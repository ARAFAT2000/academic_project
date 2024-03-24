
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserYears extends StatelessWidget {
   UserYears({
    super.key,
  });
final years=FirebaseFirestore.instance.collection('Years');
final yearController= TextEditingController();
final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Form(
          key: _formkey,
          child: SizedBox(
            child: TextFormField(
              validator: (value){
                if(value == null || value.isEmpty ){
                  return 'Enter years';
                }
              },
              controller: yearController,
              decoration: InputDecoration(
                  labelText: 'Enter Your Years'
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child:Text('Cancel')),
            TextButton(onPressed: (){
              final form= _formkey.currentState;
              if(form!=null && form.validate()){
                var id= DateTime.now().toString();
                years.doc(id).set({'Year':yearController.text});
                Navigator.pop(context);
              }

            }, child:Text('Save')),
          ],
        )
      ],
    );
  }
}