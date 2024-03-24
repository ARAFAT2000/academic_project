import 'package:academic_project/utils/modify_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../View/show_years.dart';
import '../widget/profile_card.dart';
import '../widget/student_score.dart';
import '../widget/user_years.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final fetchYear= FirebaseFirestore.instance.collection('Years').snapshots();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
          onPressed: (){
          showDialog(context: context, builder: (context){
            return UserYears();
          });
          },
          label:  ModifyText(text: 'Tap Here', size: 15, color: Colors.white),
      icon: Icon(Icons.add),),
      body: SafeArea(
          child:Column(
            children: [
              ProfileCard(),
              SizedBox(
                height: 15,
              ),
              StudentScore(),
              SizedBox(
                height: 10,
              ),
              ShowYears(fetchYear: fetchYear)
            ],
          )),
    );
  }

}









