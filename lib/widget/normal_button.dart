import 'package:academic_project/utils/modify_text.dart';
import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
 final String title;
  final VoidCallback onTap;
  final bool isLoading;
   NormalButton({super.key,required this.title,required this.onTap,this.isLoading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child:isLoading? CircularProgressIndicator(
          strokeWidth: 2,color: Colors.white,
        ): ModifyText(text: title, size: 15,color: Colors.white,)),
      ),
    );
  }
}
