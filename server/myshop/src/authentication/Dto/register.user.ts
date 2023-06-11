import { IsEmail, IsNotEmpty, IsString } from 'class-validator';

export class RegisterUserDto {
  @IsEmail()
  email: String;

  @IsString()
  @IsNotEmpty()
  user_name: String;

  @IsString()
  @IsNotEmpty()
  password: String;
}
