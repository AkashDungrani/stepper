import 'package:flutter/material.dart';
import 'package:stepper/views/screens/splashscreen.dart';
import 'dart:io';

import 'models/globals.dart';

void main() {
  runApp(
    MyStepper(),
  );
}

class MyStepper extends StatefulWidget {
  const MyStepper({super.key});

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int initialstep = 0;

  String? name;
  String? email;
  String? password;
  String? confirmpassword;
  String? username;
  final gk1 = GlobalKey<FormState>();
  final gk2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stepper App"),
        ),
        body: Theme(
          data: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green))),
            canvasColor: Colors.yellow,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.red,
                  background: Colors.black,
                  secondary: Colors.green,
                ),
          ),
          child: Stepper(
            currentStep: initialstep,
            onStepTapped: (val) {
              setState(() {
                initialstep = val;
              });
            },
            onStepContinue: () {
              setState(() {
                if (initialstep < 2) {
                  ++initialstep;
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (initialstep > 0) {
                  --initialstep;
                }
              });
            },
            controlsBuilder: ((context, controldetails) {
              return (controldetails.currentStep == 0)
                  ? Row(
                      children: [
                        ElevatedButton(
                            onPressed: controldetails.onStepContinue,
                            child: Text("Next")),
                        OutlinedButton(
                            onPressed: controldetails.onStepCancel,
                            child: Text("Privious"))
                      ],
                    )
                  : (controldetails.currentStep == 1)
                      ? Row(
                          children: [
                            ElevatedButton(
                                onPressed: controldetails.onStepContinue,
                                child: Text("Next")),
                            OutlinedButton(
                                onPressed: controldetails.onStepCancel,
                                child: Text("Privious"))
                          ],
                        )
                      : Row(
                          children: [
                            ElevatedButton(
                                onPressed:controldetails.onStepContinue,
                                  // setState(() {
                                  //   if (gk2.currentState!.validate()) {
                                  //     gk2.currentState!.save();
                                  //     if (initialstep < 2) {
                                  //       ++initialstep;
                                  //     }
                                  //   }
                                  // });
                                
                                child: Text("Next")),
                            OutlinedButton(
                                onPressed: controldetails.onStepCancel,
                                child: Text("Privious"))
                          ],
                        );
            }),
            steps: [
              Step(
                title: Text("SignUp"),
                state: StepState.indexed,
                content: Form(
                  key: gk1,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please Enter Name';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.name = val;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade300,
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            hintText: "Akash Dungrani",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Contact Number";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.email = val;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade300,
                            prefixIcon: Icon(Icons.email),
                            filled: true,
                            hintText: "Enter Your Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter valid Chacter";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.password = val;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade300,
                            prefixIcon: Icon(Icons.lock),
                            filled: true,
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter valid Chacter";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.confirmpassword = val;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade300,
                            prefixIcon: Icon(Icons.lock),
                            filled: true,
                            hintText: "Confirm Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                    ],
                  ),
                ),
                isActive: (initialstep >= 0) ? true : false,
              ),
              Step(
                title: Text("Log In"),
                // subtitle: Text("Welcome to app"),
                content: Form(
                  key: gk2,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Username";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.username = val;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade300,
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            hintText: "Username",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter password";
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            Globals.password = val;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade300,
                            filled: true,
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                    ],
                  ),
                ),
                isActive: (initialstep >= 1) ? true : false,
              ),
              Step(
                title: Text("Home"),
                // subtitle: Text("Welcome to app"),
                content: Container(),
                isActive: (initialstep >= 2) ? true : false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
