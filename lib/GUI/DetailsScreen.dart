import 'package:flutter/material.dart';
import 'package:json/GUI/UserModel.dart';

class DetailsScreen extends StatelessWidget{
  UserModel user;
  DetailsScreen(this.user);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( title: Text(user.name),),
      body: Container(
        alignment: Alignment.center,
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:10,bottom: 10),
            alignment: Alignment.center,
            child:Image(
              image: NetworkImage(
                user.picture + user.index.toString()+'.jpg'
            ),) ,
          ),
          Row(
            children: <Widget>[
              Text( "company"),Text( user.company),
            ],
          ),


              Text( "about"),
              Text( user.about),






        ],),
      ),
    );
  }

}