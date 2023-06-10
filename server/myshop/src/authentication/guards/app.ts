import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Request } from 'express';
import { Observable } from 'rxjs';

@Injectable()
export class AppGuard implements CanActivate {
  constructor(private readonly jwt: JwtService) {}
  canActivate(
    context: ExecutionContext,
  ): boolean | Promise<boolean> | Observable<boolean> {
    const http = context.switchToHttp();
    const httpRequest = http.getRequest<Request>();

    if (!httpRequest.headers.authorization) {
      return false;
    }
    const accessToken = httpRequest.headers.authorization.split(' ')[1];
    const isTokenVaild = this.jwt.verify(accessToken);

    return isTokenVaild;
  }
}
