// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'biodata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController date = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController wight = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController contactnumber = TextEditingController();
  TextEditingController cast = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController eduction = TextEditingController();
  TextEditingController hobbies = TextEditingController();
  TextEditingController fathername = TextEditingController();
  TextEditingController mothername = TextEditingController();
  TextEditingController nativeplace = TextEditingController();
  TextEditingController maternalname = TextEditingController();
  TextEditingController maternalplace = TextEditingController();
  final one = GlobalKey<FormState>();
  final two = GlobalKey<FormState>();
  final three = GlobalKey<FormState>();
  int currentstap = 0;
  DateTime? birthdate;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stepper(
          currentStep: currentstap,
          onStepTapped: (index) {
            currentstap = index;
            setState(() {});
          },
          onStepContinue: () async {
            if (currentstap == 0) {
              if (one.currentState!.validate()) {
                currentstap++;
                setState(() {});
              }
              setState(() {});
            } else if (currentstap == 1) {
              if (two.currentState!.validate()) {
                currentstap++;
                setState(() {});
              }
            } else if (currentstap == 2) {
              setState(() {});
              if (one.currentState!.validate() &&
                  two.currentState!.validate() &&
                  three.currentState!.validate()) {
                final pref = await SharedPreferences.getInstance();
                pref.setString('adress', adress.text);
                pref.setString('cast', cast.text);
                pref.setString('date', date.text);
                pref.setString('fathername', fathername.text);
                pref.setString('hobbies', hobbies.text);
                pref.setString('gradute', eduction.text);
                pref.setString('height', height.text);
                pref.setString('maternalname', maternalname.text);
                pref.setString('maternalplace', maternalplace.text);
                pref.setString('mobile', contactnumber.text);
                pref.setString('mothername', mothername.text);
                pref.setString('weight', weight.text);
                pref.setString('native place', nativeplace.text);
                pref.setString('birthdate', date.text);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Data()));
              }
            }
          },
          onStepCancel: () {
            if (currentstap != 0) {
              currentstap--;
              setState(() {});
            }
          },
          steps: [
            Step(
                isActive: currentstap >= 0,
                title: Text("Personal Details"),
                content: Builder(builder: (context) {
                  return Form(
                      key: one,
                      child: Column(children: [
                        TextFormField(
                          controller: date,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Your BirthDate';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "BirthDate",
                              labelText: "BirthDate dd/mm/yyyy",
                              border: OutlineInputBorder()),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: w * 0.35,
                                child: TextFormField(
                                  controller: height,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Height';
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: "Height(Feet)",
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              SizedBox(
                                width: w * 0.35,
                                child: TextFormField(
                                  controller: wight,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter height';
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: "Height(Inch)",
                                      border: OutlineInputBorder()),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Weight';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            controller: weight,
                            decoration: InputDecoration(
                                hintText: "Weight(Kg)",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Contact Number';
                              } else if (value.length != 10) {
                                return "Please Enter 10 Digit";
                              }
                            },
                            controller: contactnumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Contact Number",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: TextFormField(
                            controller: cast,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Cast';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Cast", border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Adress';
                              } else {
                                return null;
                              }
                            },
                            controller: adress,
                            maxLines: 3,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Adress",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: TextFormField(
                            controller: eduction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Eduction';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Education",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: TextFormField(
                            controller: hobbies,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Hobbies';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Hobbies",
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ]));
                })),
            Step(
                isActive: currentstap >= 1,
                title: Text("Famaily Details"),
                content: Builder(builder: (context) {
                  return Form(
                    key: two,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: fathername,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Father Name';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Father name",
                              border: OutlineInputBorder()),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: h * 0.01),
                          child: TextFormField(
                            controller: mothername,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Mother Name';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Mother name",
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                  );
                })),
            Step(
                isActive: currentstap >= 2,
                title: Text("Maternal Details"),
                content: Form(
                  key: three,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: maternalname,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Maternal Uncle name';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Maternal Uncle Name",
                            border: OutlineInputBorder()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: h * 0.01),
                        child: TextFormField(
                          controller: maternalplace,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Maternal Place';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Maternal Place",
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                )),
          ]),
    );
  }
}
