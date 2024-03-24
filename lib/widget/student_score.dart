

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/modify_text.dart';

class StudentScore extends StatefulWidget {
   StudentScore({
    super.key,
  });

  @override
  State<StudentScore> createState() => _StudentScoreState();
}

class _StudentScoreState extends State<StudentScore> {
  TextEditingController numberController =TextEditingController();

  List<double> sgpaList = [];

  double totalCGPA = 0.0;

     void _addSGPA(double sgpa) {
    setState(() {
      sgpaList.add(sgpa);
      totalCGPA = _calculateTotalCGPA();
    });
  }

  double _calculateTotalCGPA() {
    double sum = sgpaList.reduce((value, element) => value + element);
    return sum / sgpaList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Container(
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(13)
          ),
          child: Column(

            children: [
              SizedBox(height: 10,),

              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 70,),
                  ModifyText(text: ' ${totalCGPA.toStringAsFixed(2)}',size: 30, color:Colors.white),
                  SizedBox(width: 10,),
                  InkWell(
                      onTap: (){
                        showDialog(context: context,
                            builder: (context){
                           return AlertDialog(
                            actions: [
                            TextField(
                              controller: numberController,
                              keyboardType: TextInputType.numberWithOptions(decimal: true),
                              decoration: InputDecoration(labelText: 'Enter SGPA'),
                              onSubmitted: (value) {
                                double sgpa = double.tryParse(value) ?? 0.0;
                             if (sgpa > 0.0 && sgpa <= 4.0) {
                             _addSGPA(sgpa);

                           } else {

                         }
                        },
                            ),
                            SizedBox(height: 5,),
                         ElevatedButton(onPressed: (){
                           double sgpa = double.tryParse(numberController.text) ?? 0.0;
                           if (sgpa > 0.0 && sgpa <= 4.0) {
                             _addSGPA(sgpa);
                             Navigator.pop(context);
                           } else {

                           }
                         }, child: ModifyText(text: 'Save', size: 12, color: Colors.white))
                            ],
                          );
                            });
                      },
                      child: Icon(Icons.edit,color: Colors.white,))
                ],
              ),
                SizedBox(height: 10,),
              Center(
                child: sgpaList.isEmpty
                    ? ModifyText(
                  text: 'No SGPA available',
                  size: 15,
                  color: Colors.white,
                )
                    : sgpaList== 3.50
                    ? ModifyText(text: 'Continue Hard Work ', size: 15, color: Colors.white)
                    : sgpaList== 3.00
                    ? ModifyText(text: 'Speed up Daily ', size: 15, color: Colors.white)
                    : sgpaList == 2.80
                    ? ModifyText(text: 'Restart Again', size: 15, color: Colors.white)
                    : ModifyText(text: 'Wow ! go to your focus ', size: 15, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),



            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }
}