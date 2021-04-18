import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawsafe/components/component.dart';

class AddS extends StatefulWidget{
  _AddsState createState() => new _AddsState();

}

final GlobalKey<FormState> _key = GlobalKey();

class _AddsState extends State<AddS>{

  Stray _stray ;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Form(
            autovalidateMode: AutovalidateMode.disabled, key: _key,
            child: Container(
                alignment: Alignment.center,
                child: ListView(
                    children: <Widget>[
                      Icon(
                          Icons.account_circle_rounded,
                          size:75
                      ),

                      ElevatedButton(
                        child: Text('Add a picture'),
                        onPressed: () => {},
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Input names',
                            hintText: 'Tommy'
                        ),

                        onChanged: (String val){
                          setState(() {
                            _stray.name = val;
                          });
                        },

                        validator: (String val){
                          if(val.isEmpty){
                            return 'We need some name';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Type',
                            hintText: 'ex. Cat,Dog'
                        ),

                        onChanged: (String val){
                          setState(() {
                            _stray.type = val;
                          });
                        },

                        validator: (String val){
                          if(val.isEmpty){
                            return 'We need some name';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Breed',
                            hintText: 'ex. labrador'
                        ),

                        onChanged: (String val){
                          setState(() {
                            _stray.breed = val;
                          });
                        },

                        validator: (String val){
                          if(val.isEmpty){
                            return 'We need some name';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Description'
                        ),

                        onChanged: (String val){
                          setState(() {
                            _stray.desc = val;
                          });
                        },

                        validator: (String val){
                          if(val.isEmpty){
                            return 'We need some name';
                          }
                          return null;
                        },
                      ),

                      Row(
                          children: <Widget>[
                            ElevatedButton(
                              child: Text('Cancel'),
                              onPressed: () => Navigator.pop(context),
                            ),

                            ElevatedButton(
                              child: Text('Add Pet'),
                              onPressed: () => {},
                            )
                          ]
                      )



                    ]
                )
            )

        )
    );
  }

}