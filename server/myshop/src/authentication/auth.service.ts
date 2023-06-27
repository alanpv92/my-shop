import { HttpException, Injectable } from '@nestjs/common';
import { RegisterUserDto } from './Dto/register.user';
import { InjectRepository } from '@nestjs/typeorm';
import { userEntity } from 'src/typeorm/entity/user';
import { Equal, Repository } from 'typeorm';
import * as bcrypt from 'bcrypt';
import { JwtService } from '@nestjs/jwt';
import { LoginUserDto } from './Dto/login.user';
import { MailService } from 'src/mail/mail.service';
import { ResetPasswordDto } from './Dto/reset.password';
import { VerifyOtpForPasswordDto } from './Dto/verify.otp.password';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(userEntity)
    private readonly userRepo: Repository<userEntity>,
    private readonly jwt: JwtService,
    private readonly mailService: MailService,
  ) {}

  private async hashData(payload: String) {
    return await bcrypt.hash(payload as string, 12);
  }

  private generateTokens(payload: { id: Number; email: String }) {
    const accessToken = this.jwt.sign(payload, {
      expiresIn: '1d',
    });
    const refreshToken = this.jwt.sign(payload, {
      expiresIn: 60 * 10 * 10,
    });
    return {
      accessToken,
      refreshToken,
    };
  }

  async registerUser(userData: RegisterUserDto) {
    try {
      const isUserPresent = await this.userRepo.exist({
        where: {
          email: Equal(userData.email),
        },
      });

      if (isUserPresent) {
        throw new HttpException('user already registred', 400);
      }

      const hashedPassword = await this.hashData(userData.password);

      const userModel = this.userRepo.create({
        email: userData.email,
        passwordHash: hashedPassword,
        user_name: userData.user_name,
      });

      await this.userRepo.save(userModel);

      return {
        status: 'sucess',
        data: {
          id: userModel.id,
          email: userModel.email,
          user_name: userModel.user_name,
          ...this.generateTokens({ id: userModel.id, email: userModel.email }),
        },
      };
    } catch (e) {
      const errorText = e.message || 'something went wrong';
      const status = e.status || 500;
      throw new HttpException(errorText, status);
    }
  }

  async loginUser(userData: LoginUserDto) {
    try {
      const user = await this.userRepo.findOneBy({
        email: Equal(userData.email),
      });
      if (!user) {
        throw new HttpException('user has not yet registred', 400);
      }
      const isPasswordOk =await bcrypt.compare(
        userData.password as string,
        user.passwordHash as string,
      );

      if(!isPasswordOk){
        throw new HttpException("password is inncorrect",400);
      }

      return {
        status: 'sucess',
        data: {
          id: user.id,
          email: user.email,
          user_name: user.user_name,
          ...this.generateTokens({ id: user.id, email: user.email }),
        },
      };
    } catch (e) {
      const errorText = e.message || 'something went wrong';
      const status = e.status || 500;
      throw new HttpException(errorText, status);
    }
  }

  async refreshTokens(authHeader: String) {
    try {
      if (!authHeader) {
        throw new HttpException('refresh token is not present', 400);
      }
      const token = authHeader.split(' ')[1];
      const decodedToken = this.jwt.verify(token);

      if (decodedToken) {
        return {
          status: 'sucess',
          data: {
            status: 'sucess',
            data: this.generateTokens({
              id: decodedToken.id,
              email: decodedToken.email,
            }),
          },
        };
      }
    } catch (e) {
      return {
        status: 'failure',
        message: 'invaild refresh token',
      };
    }
  }

  async resetPassword(data: ResetPasswordDto) {
    const otp = this.generateOtp();
    const hashedOtp = await this.hashData(otp.toString());
    const user = await this.userRepo.findOneBy({
      email: Equal(data.email),
    });
    if (!user) {
      throw new HttpException('no user by this email', 400);
    }
    user.otp = hashedOtp;
    await this.userRepo.save(user);

    this.mailService.sendMail({
      email: data.email,
      message: `otp to reset your password is ${otp}`,
      subject: 'password reset',
    });

    setTimeout(async () => {
      user.otp = null;
      await this.userRepo.save(user);
    }, 60000*2);

    return {
      status: 'sucess',
      data: {
        message: 'otp send',
      },
    };
  }

  async verifyOtpForPassword(data: VerifyOtpForPasswordDto) {
    try {
      const user = await this.userRepo.findOneBy({
        email: Equal(data.email),
      });

      if (!user) {
        throw new HttpException('user not found', 400);
      }
      if (!user.otp) {
        throw new HttpException('otp has expired', 400);
      }
      const isOtpVaild = await bcrypt.compare(
        data.otp as string,
        user.otp as string,
      );
      if (isOtpVaild) {
        const hashedPassword = await this.hashData(data.newPassword);
        user.passwordHash = hashedPassword;
        await this.userRepo.save(user);
        return {
          status: 'sucess',
          data: {
            message: 'password has been reset',
          },
        };
      } else {
        throw new HttpException('invalid otp', 400);
      }
    } catch (e) {
      const errorText = e.message || 'something went wrong';
      const status = e.status || 500;
      throw new HttpException(errorText, status);
    }
  }

  private generateOtp(): number {
    const min = 100000; // Minimum value (inclusive)
    const max = 999999; // Maximum value (inclusive)
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }
}
