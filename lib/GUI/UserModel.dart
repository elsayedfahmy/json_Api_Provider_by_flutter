import 'package:flutter/material.dart';

class UserModel{

 final int index ;
 final String about ;
 final String name;
 final String  picture;
 final String company;
 final String  email;

 UserModel(this.index, this.about, this.name, this.picture, this.company,
      this.email);
}