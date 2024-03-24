import 'package:academic_project/auth/signup_screen.dart';
import 'package:academic_project/page/home_page.dart';
import 'package:academic_project/utils/modify_text.dart';
import 'package:academic_project/widget/normal_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/textformfield_decoration.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth _auth= FirebaseAuth.instance;
  void logIn(){
    _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 45,left: 20,right: 20),
              child: Column(
                children: [
                  ModifyText(text: 'Welcome !', size: 25, color: Colors.black),
                  SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    child: Form(
                      key: _formKey ,
                      child: Column(
                        children: [


                          TextFormField(
                            controller: emailController,
                            decoration:TextFieldInputDecoration('Email') ,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid email';
                              }
                              return null; // Return null for valid input
                            },
                          ),

                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller:passwordController,
                            decoration:TextFieldInputDecoration('Password') ,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Strong password';
                              }
                              return null; // Return null for valid input
                            },
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          NormalButton(title: 'Log In', onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                            if(_formKey.currentState!.validate()){
                              logIn();
                            }
                          }),
                          SizedBox(
                            height: 45,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                ModifyText(text: 'Dont Have an account ?', size: 15, color: Colors.deepPurple),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                }, child: ModifyText(text: 'Sign Up', size: 15, color: Colors.deepPurple))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )

                ],
              ),
            )),
      ),
    );
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}


