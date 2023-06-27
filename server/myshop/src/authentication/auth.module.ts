import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { userEntity } from 'src/typeorm/entity/user';
import { JwtModule } from '@nestjs/jwt';
import { APP_GUARD } from '@nestjs/core';
import { AppGuard } from './guards/app';
import { MailService } from 'src/mail/mail.service';


@Module({
  imports: [
    TypeOrmModule.forFeature([userEntity]),
    JwtModule.registerAsync({
      useFactory:()=>({
        secret:process.env.JWT_SECRET
      })
    }),
  ],
  controllers: [AuthController],
  providers: [
    AuthService,
    {
      provide: APP_GUARD,
      useClass: AppGuard,
    },
    MailService
  ],
})
export class AuthModule {}
