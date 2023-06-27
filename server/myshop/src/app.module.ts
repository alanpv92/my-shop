import { Module } from '@nestjs/common';
import { AuthModule } from './authentication/auth.module';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { userEntity } from './typeorm/entity/user';

@Module({
  imports: [
    ConfigModule.forRoot(),
    TypeOrmModule.forRootAsync({
      useFactory: () => ({
        type: 'postgres',
        host: process.env.DB_HOST,
        port: parseInt(process.env.DB_PORT),
        username: process.env.DB_USERNAME,
        password: process.env.DB_PASSWORD,
        database: process.env.DB_DATABSE,
        entities:[userEntity],
        synchronize:true
      }),
    }),
    AuthModule,
  ],
})
export class AppModule {

}
