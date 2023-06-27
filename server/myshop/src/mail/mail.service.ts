import { Injectable } from '@nestjs/common';
import * as nodemailer from 'nodemailer';
import { MailOptions } from 'nodemailer/lib/sendmail-transport';

@Injectable()
export class MailService {
  async sendMail(options: { email: String; subject: String; message: String }) {
    var transport = nodemailer.createTransport({
      host: process.env.MAIL_HOST,
      port: parseInt(process.env.MAIL_PORT),
      auth: {
        user: process.env.MAIL_USERNAME,
        pass: process.env.MAIL_PASSWORD,
      },
    });

    const mailOptions: MailOptions = {
      from: 'My Shop <myshop@gmail.com>',
      to: options.email as string,
      text: options.message as string,
      subject:options.subject as string
    };
    await transport.sendMail(mailOptions);
  }

 
  
  
}


