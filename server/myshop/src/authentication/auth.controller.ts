import { Body, Controller, Post } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { RegisterUserDto } from "./Dto/register.user";
import { LoginUserDto } from "./Dto/login.user";


@Controller("/auth")
export class AuthController{
   constructor(private readonly authService:AuthService){}

    @Post("/register")
    registerUser(@Body() data:RegisterUserDto){
        return this.authService.registerUser(data);
    }

    @Post("/login")
    loginUser(@Body() data:LoginUserDto){

    }

   @Post("/refresh")
   refreshUserTokens(){

   }
}