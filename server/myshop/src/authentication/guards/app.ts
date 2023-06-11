import { CanActivate, ExecutionContext, HttpException, Injectable } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { JwtService } from '@nestjs/jwt';
import { Request } from 'express';
import { Observable } from 'rxjs';

@Injectable()
export class AppGuard implements CanActivate {
  constructor(
    private readonly jwt: JwtService,
    private readonly reflector: Reflector,
  ) {}
  canActivate(
    context: ExecutionContext,
  ): boolean | Promise<boolean> | Observable<boolean> {
    const isPublic = this.reflector.getAllAndOverride('isPublic', [
      context.getClass(),
      context.getHandler(),
    ]);
    if (isPublic) {
      return true;
    }
    const http = context.switchToHttp();
    const httpRequest = http.getRequest<Request>();

    if (!httpRequest.headers.authorization) {
      return false;
    }
    const accessToken = httpRequest.headers.authorization.split(' ')[1];
    try {
      const isTokenVaild = this.jwt.verify(accessToken);
      if (isTokenVaild) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if(e.message==='jwt expired'){
        throw new HttpException("token has expired",400);
      }
      return false;
    }

    return true;
  }
}
