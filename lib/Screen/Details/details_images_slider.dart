import 'package:flutter/material.dart';

class DetailsImageSlider extends StatelessWidget {
  final Function (int) onChanges;
  final String image;
  const DetailsImageSlider({super.key,
    required this.onChanges
    ,required this.image});

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return SizedBox(
      height: size.height/3,
      child: PageView.builder(
        onPageChanged: onChanges,
          itemBuilder: (context,index){
            return Hero(
                tag: image,
                child: Image.asset(image));
          }
           ),
    );
  }
}
