import 'package:http/http.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widget/top_bar.dart';

class MainProfile extends StatefulWidget {
  @override
  State<MainProfile> createState() => _MainProfile();
}

class _MainProfile extends State<MainProfile> {
  late PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.green,
              elevation: 0,
              centerTitle: true,
              title: Column(
                children: [
                  Text(
                    "Autokit",
                    style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontSize: 25,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            imageProfile(),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'hyeonjin',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 140,
              height: 5,
              color: Colors.green,
            ),
           Column(
                children: [
                  Container(
                    child: ElevatedButton(onPressed: (){
                      FirebaseAuth.instance.signOut();
                    }, child: Text("Logout")),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(AutofillHints.birthday),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: ((builder) => bottomSheet()));
              },
              child: Icon(
                Icons.camera_alt,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
            ),
          ),
          prefixIcon: Icon(
            Icons.person,
          ),
          labelText: 'Name',
          hintText: 'Input your name'),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        children: [
          Text(
            'Choose Profile photo',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  tackPhoto(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera,
                  size: 50,
                ),
                label: Text(
                  'Camera',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton.icon(
                icon: Icon(
                  Icons.photo_library,
                  size: 50,
                ),
                onPressed: () {
                  tackPhoto(ImageSource.gallery);
                },
                label: Text(
                  'Gallery',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  tackPhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile as PickedFile;
    });
  }
}
