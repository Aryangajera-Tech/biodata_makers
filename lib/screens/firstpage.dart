import 'dart:io';
import 'package:biodata_makers/screens/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  ImagePicker imagePicker = ImagePicker();
  XFile? pic;
  TextEditingController fullname = TextEditingController();
  final firstpage = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (pic?.path ?? '') == ''
                ? const CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.people,
                      color: Colors.black,
                      size: 50,
                    ))
                : CircleAvatar(
                    radius: 75,
                    backgroundImage:
                        FileImage(File(pic?.path.toString() ?? ''))),
            SizedBox(
              height: h * 0.02,
            ),
            GestureDetector(
                onTap: () async {
                  // Navigator.pop(context);
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () async {
                                  pic = await imagePicker.pickImage(
                                      source: ImageSource.camera);
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: ListTile(
                                  leading: Icon(Icons.camera_alt),
                                  title: Text("CAMERA"),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  pic = await imagePicker.pickImage(
                                      source: ImageSource.gallery);
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: ListTile(
                                  leading: Icon(Icons.image),
                                  title: Text("GALERRY"),
                                ),
                              )
                            ],
                          ));
                },
                child: Text(
                  "Edit Image",
                  style: TextStyle(fontSize: 10, color: Colors.black26),
                )),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.05, vertical: h * 0.03),
                child: Form(
                  key: firstpage,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Full Name';
                      } else if ((pic?.path ?? '') == '') {
                        return "Please Enter Image";
                      }
                      return null;
                    },
                    controller: fullname,
                    decoration: InputDecoration(
                        hintText: "Full name",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black))),
                  ),
                )),
            ElevatedButton(
                onPressed: () async {
                  final pref = await SharedPreferences.getInstance();
                  pref.setString('image', pic!.path.toString());
                  pref.setString('fullname', fullname.text);
                  if (firstpage.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondPage()));
                  }
                },
                child: Text("NEXT"))
          ],
        ),
      ),
    );
  }
}
