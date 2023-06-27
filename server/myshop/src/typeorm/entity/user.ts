import { Entity, Column, PrimaryGeneratedColumn, OneToOne, JoinColumn } from 'typeorm';


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
  

  @Column({nullable:true})
  otp:String

}
