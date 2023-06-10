import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class userEntity {
  @PrimaryGeneratedColumn()
  id: Number;

  @Column()
  user_name:String;

  @Column()
  email:String;

  @Column()
  passwordHash:String;
}
