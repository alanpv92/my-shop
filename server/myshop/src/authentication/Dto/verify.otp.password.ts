import { IsEmail, IsString } from 'class-validator';

export class VerifyOtpForPasswordDto {
  @IsEmail()
  email: String;

  @IsString()
  newPassword: String;

  @IsString()
  otp: String;
}
