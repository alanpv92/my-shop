import { Body, Controller, Post } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { RegisterUserDto } from "./Dto/register.user";
import { LoginUserDto } from "./Dto/login.user";


@Controller("/auth")
export class AuthController{
   constructor(private readonly authService:AuthService){}

    @Post("/register")
   async registerUser(@Body() data:RegisterUserDto){
        return await this.authService.registerUser(data);
    }

    @Post("/login")
   async loginUser(@Body() data:LoginUserDto){
      return await this.authService.loginUser(data);
    }

   @Post("/refresh")
   refreshUserTokens(){

   }
}