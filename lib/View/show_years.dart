import 'package:academic_project/View/semester_years.dart';
import 'package:academic_project/utils/modify_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowYears extends StatelessWidget {
   ShowYears({
    super.key,
    required this.fetchYear,
  });
   int currentIndex = 0;
  final Stream<QuerySnapshot<Map<String, dynamic>>> fetchYear;
  final years=FirebaseFirestore.instance.collection('Years');

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: fetchYear,
        builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
          return !snapshot.hasData? Center(child: CircularProgressIndicator(),):
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: snapshot.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                   crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                  ),
                  itemBuilder: (context,index){
                    var getStore= snapshot.data!.docs[index];
                     return Container(
                     decoration: BoxDecoration(
                         color: Colors.green,
                       borderRadius: BorderRadius.circular(09)
                     ),
                       child: Center(
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             SizedBox(height: 35,),
                             GestureDetector(
                                 onDoubleTap: (){

                                   Navigator.push(context,
                                       MaterialPageRoute(builder: (context)=>Semester(year:  getStore['Year'])));

                                 },
                                 child: ModifyText(text: 'Your Years', size: 20, color: Colors.white)),
                             SizedBox(height: 10,),
                             ModifyText(text: getStore['Year'], size: 20, color: Colors.white),

                             SizedBox(height: 10,),
                            Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(onPressed: (){

                                }, icon: Icon(Icons.edit_note,color: Colors.white,)),
                                IconButton(onPressed: (){
                                  String documentId = snapshot.data!.docs[index].id;
                                  if (documentId != null) {
                                    years.doc(documentId).delete();
                                  }
                                }, icon: Icon(Icons.delete,color: Colors.white)),
                              ],
                            )
                           ],
                         )
                       ),
                     );
                  }),
            )
          );
        });
  }
}