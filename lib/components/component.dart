import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';

class Round extends StatelessWidget {
  Round({this.title, this.colour, @required this.onPressed});
  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class User{
  String name;
  String email;
  String pass;
  String city;
  int pid;

  static User getUser(){
    return User()..name = "test"
        ..email = "test@gmail.com"
        ..pass = "123456"
        ..city = "Mumbai";
  }
}

class Pet{
  String name;
  String type;
  String breed;
  String desc;
  String owner;
  String city;
  bool adapt;
  
  Pet(){
    name = "";
    type = "";
    breed = "";
    desc = "";
    owner = "";
    city = "";
    adapt = false;
  }
  
  // void toFire(){
  //   u = User.getUser().email;
  //   c = User.getUser().city;
  //   if(name.isNotEmpty && type.isNotEmpty) {
  //     FirebaseFirestore.instance
  //       .collection('pet')
  //       .add({
  //       "name" = this.name,
  //       "type" = this.type,
  //       "breed" = this.breed,
  //
  //   });
  //
  //   }}
}

class Stray {
  String name;
  String type;
  String breed;
  String desc;
  String owner;
  String city;

  Pet() {
    name = "";
    type = "";
    breed = "";
    desc = "";
    owner = "";
    city = "";
  }
}
