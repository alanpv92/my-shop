import { HttpException, Injectable } from '@nestjs/common';
import { RegisterUserDto } from './Dto/register.user';
import { InjectRepository } from '@nestjs/typeorm';
import { userEntity } from 'src/typeorm/entity/user';
import { Equal, Repository } from 'typeorm';
import * as bcrypt from 'bcrypt';
import { JwtService } from '@nestjs/jwt';
import { LoginUserDto } from './Dto/login.user';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(userEntity)
    private readonly userRepo: Repository<userEntity>,
    private readonly jwt: JwtService,
  ) {}

  private async hashData(payload: String) {
    return await bcrypt.hash(payload as string, 12);
  }

  private generateTokens(payload: { id: Number; email: String }) {
    const accessToken = this.jwt.sign(payload, {
      expiresIn: 60 * 10,
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
        return new HttpException('user already registred', 400);
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
    } catch {
      return new HttpException('something went wrong', 500);
    }
  }

  async loginUser(userData: LoginUserDto) {
    try {
      const user = await this.userRepo.findOneBy({
        email: Equal(userData.email),
      });
      if (!user) {
        return new HttpException('user has not yet registred', 400);
      }
      const isPasswordOk = bcrypt.compare(
        userData.password as string,
        user.passwordHash as string,
      );

      return {
        status: 'sucess',
        data: {
          id: user.id,
          email: user.email,
          user_name: user.user_name,
          ...this.generateTokens({ id: user.id, email: user.email }),
        },
      };
    } catch {
      return new HttpException('something went wrong', 500);
    }
  }


  async refreshTokens(authHeader:String){
   try{
    if(!authHeader){
      throw new HttpException("refresh token is not present",400);
      
    }
    const token=authHeader.split(' ')[1];
      const decodedToken=this.jwt.verify(token);
     
      if(decodedToken){
         return{
            status:'sucess',
            data:{
               status:"sucess",
               data:this.generateTokens({id:decodedToken.id,email:decodedToken.email})
            }
         }
      }
   }catch(e){
      return {
         status:"failure",
         message:"invaild refresh token"
      }
   }
  }
}
