import 'package:academic_project/auth/login_screen.dart';
import 'package:academic_project/utils/modify_text.dart';
import 'package:academic_project/widget/normal_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../page/home_page.dart';
import '../utils/textformfield_decoration.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController passwordController= TextEditingController();

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth _auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
              child: Column(
                children: [
                  ModifyText(text: 'Create new account', size: 25, color: Colors.black),
                  SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    child: Form(
                      key: _formKey ,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration:TextFieldInputDecoration('Name') ,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null; // Return null for valid input
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
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
                            controller: phoneController,
                            decoration:TextFieldInputDecoration('Phone Number') ,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
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
                          NormalButton(title: 'Save', onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
                            if(_formKey.currentState!.validate()){
                            _auth.createUserWithEmailAndPassword(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString());
                            }
                          },
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                ModifyText(text: 'Already have an account ?', size: 15, color: Colors.deepPurple),
                               TextButton(onPressed: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
                               }, child: ModifyText(text: 'Log In', size: 15, color: Colors.deepPurple))
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
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
