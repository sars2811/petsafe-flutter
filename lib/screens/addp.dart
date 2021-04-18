import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawsafe/components/component.dart';
import 'package:google_fonts/google_fonts.dart';

class AddP extends StatefulWidget {
  _AddpState createState() => new _AddpState();
}

final GlobalKey<FormState> _key = GlobalKey();

class _AddpState extends State<AddP> {
  Pet _pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            autovalidateMode: AutovalidateMode.disabled,
            key: _key,
            child: Container(
                alignment: Alignment.center,
                child: ListView(children: <Widget>[
                  SizedBox(
                    height: 12.0,
                  ),
                  Icon(Icons.account_circle_rounded, size: 75),
                  ElevatedButton(
                    child: Text(
                      'Add a picture',
                      style: GoogleFonts.baskervville(
                        textStyle: TextStyle(fontSize: 20),
                      ),
                    ),
                    onPressed: () => {},
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Input names', hintText: 'Tommy'),
                    onChanged: (String val) {
                      setState(() {
                        _pet.name = val;
                      });
                    },
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'We need some name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Type', hintText: 'ex. Cat,Dog'),
                    onChanged: (String val) {
                      setState(() {
                        _pet.type = val;
                      });
                    },
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'We need some name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Breed', hintText: 'ex. labrador'),
                    onChanged: (String val) {
                      setState(() {
                        _pet.breed = val;
                      });
                    },
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'We need some name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                    onChanged: (String val) {
                      setState(() {
                        _pet.desc = val;
                      });
                    },
                    validator: (String val) {
                      if (val.isEmpty) {
                        return 'We need some name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ElevatedButton(
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.baskervville(
                              textStyle: TextStyle(fontSize: 20),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        ElevatedButton(
                          child: Text(
                            'Add Pet',
                            style: GoogleFonts.baskervville(
                              textStyle: TextStyle(fontSize: 20),
                            ),
                          ),
                          onPressed: () => {},
                        )
                      ])
                ]))));
  }
}
