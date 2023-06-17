import {
  ArgumentsHost,
  BadRequestException,
  Catch,
  ExceptionFilter,
  HttpException,
} from '@nestjs/common';

import { Response } from 'express';

@Catch()
export class GlobalExceptionFilter implements ExceptionFilter {
  catch(exception: any, host: ArgumentsHost) {
    const ctx = host.switchToHttp();
    const response = ctx.getResponse<Response>();
    
    if (exception instanceof HttpException) {
      const status = exception.getStatus();
      const message = exception.message;
      if (exception instanceof BadRequestException) {
        const errorsResponse = exception.getResponse();
        const errors = Array.isArray(errorsResponse)
          ? errorsResponse
          : [errorsResponse];

        return response.status(status || 500).json({
          status: 'fail',
          message: errors[0].message[0],
        });
      }

      return response.status(status).json({
        status: 'fail',
        message: message,
      });
    } else {
      return response.status(500).json({
        status: 'fail',
        message: 'Internal Server Error',
      });
    }
  }
}
