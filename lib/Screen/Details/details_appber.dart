import 'package:academic_project/Constant/constant.dart';
import 'package:academic_project/Model/product_model.dart';
import 'package:flutter/material.dart';

import '../../Provider/favorite_provider.dart';


class DetailsAppber extends StatelessWidget {
  final Product product;
  const DetailsAppber({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
        padding: EdgeInsets.only(left: 5,right: 5,top: 20),
    child: Row(
      children: [

        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: EdgeInsets.all(15)
          ),
          onPressed: (){
Navigator.pop(context);
        },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back_ios)),

        ),
        Spacer(),
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: EdgeInsets.all(15)
          ),
          onPressed: (){

          },
          icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.share)),

        ),
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: EdgeInsets.all(15)
          ),
          onPressed: (){
         provider.toggleFavorite(product);
          },
          icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                  provider.isExist(product)?
                  Icons.favorite:
                  Icons.favorite_border,

              color: Colors.black,
              size: 20,)),

        ),
      ],
    ),
    );
  }
}
