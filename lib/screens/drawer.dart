import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:pawsafe/screens/login_screen.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  File _image;
  final picker = ImagePicker();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      PickedFile pickedFile =
          await picker.getImage(source: ImageSource.gallery);

      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child(fileName + DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(_image);
      uploadTask.then((res) {
        res.ref.getDownloadURL();
      });
      setState(() {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: (_image != null)
                          ? FileImage(_image)
                          : AssetImage('images/ani.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 8)),
                      IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          size: 35.0,
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      RaisedButton(
                        color: Colors.lightBlue[50],
                        child: Text(
                          'Upload',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          uploadPic(context);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)),
          ListTile(
            leading: Icon(Icons.add),
            title: Text(
              'Add your Pets',
              style: TextStyle(fontSize: 25.0),
            ),
            onTap: () => Navigator.pushNamed(context , '/addPet'),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)),
          ListTile(
            leading: Icon(Icons.add),
            title: Text(
              'Add for Adoption',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            onTap: () => Navigator.pushNamed(context , '/addStray'),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)),
          ListTile(
            leading: Icon(Icons.search),
            title: Text(
              'Search for Adoption',
              style: TextStyle(fontSize: 25.0),
            ),
            onTap: null,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            onTap: null,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5)),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            onTap: () {
              _auth.signOut();
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
