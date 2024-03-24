import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices{
  Future addYear(Map<String,dynamic>userYear,String id)async{
    return await FirebaseFirestore.instance
        .collection('User')
        .doc(id)
        .set(userYear);
  }
}