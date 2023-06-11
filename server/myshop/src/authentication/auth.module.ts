import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { userEntity } from 'src/typeorm/entity/user';
import { JwtModule } from '@nestjs/jwt';
import { APP_GUARD } from '@nestjs/core';
import { AppGuard } from './guards/app';

@Module({
  imports: [
    TypeOrmModule.forFeature([userEntity]),
    JwtModule.register({
      secret: 'my-secret',
    }),
  ],
  controllers: [AuthController],
  providers: [
    AuthService,
    {
      provide: APP_GUARD,
      useClass: AppGuard,
    },
  ],
})
export class AuthModule {}
