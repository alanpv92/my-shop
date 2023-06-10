import { Body, Controller, Post, Req } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { RegisterUserDto } from "./Dto/register.user";
import { LoginUserDto } from "./Dto/login.user";
import { Public } from "src/decorators/public";
import { Request } from "express";



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
}