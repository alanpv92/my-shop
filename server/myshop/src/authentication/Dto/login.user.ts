import { IsEmail, IsNotEmpty, IsString } from 'class-validator';

export class LoginUserDto {
  @IsEmail()
  email: String;

  @IsString()
  @IsNotEmpty()
  password: String;
}
