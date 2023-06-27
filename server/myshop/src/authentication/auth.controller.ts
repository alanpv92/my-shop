import { Body, Controller, Post, Req } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { RegisterUserDto } from "./Dto/register.user";
import { LoginUserDto } from "./Dto/login.user";
import { Public } from "src/decorators/public";
import { Request } from "express";
import { ResetPasswordDto } from "./Dto/reset.password";
import { VerifyOtpForPasswordDto } from "./Dto/verify.otp.password";



@Controller("/auth")
export class AuthController{
   constructor(private readonly authService:AuthService){}
 
    @Post("/register")
    @Public()
   async registerUser(@Body() data:RegisterUserDto){
        return await this.authService.registerUser(data);
    }

    @Post("/login")
    @Public()
   async loginUser(@Body() data:LoginUserDto){
      return await this.authService.loginUser(data);
    }

   @Post("/refresh")
   refreshUserTokens(@Req() req:Request){
      return this.authService.refreshTokens(req.headers.authorization)
   }

   @Post("/reset")
   @Public()
  async resetPassword(@Body() data:ResetPasswordDto){
   return  await this.authService.resetPassword(data)
   }

   @Post("/verify-password-otp")
   @Public()
   async verifyOtpForPassword(@Body() data:VerifyOtpForPasswordDto){
     return await this.authService.verifyOtpForPassword(data);
   }
}