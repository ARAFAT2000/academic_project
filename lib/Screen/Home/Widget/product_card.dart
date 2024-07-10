import 'package:academic_project/Constant/constant.dart';
import 'package:academic_project/Model/product_model.dart';
import 'package:academic_project/Provider/favorite_provider.dart';
import 'package:academic_project/Screen/Details/details_screen.dart';
import 'package:academic_project/utils/modify_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    final provider= FavoriteProvider.of(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>
                DetailsScreen(product: product)));
      },
      child: Stack(
        children: [

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: kcontentColor,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height/45,
                ),
               Center(
                   child: Hero(
                     tag:product.image ,
                     child: Image.asset(product.image,
                                       height: 110,
                       width: 110,
                       fit: BoxFit.cover,
                     ),
                   )),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ModifyText(text: product.title, size: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$ ${product.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Row(

                      children: List.generate(
                          product.colors.length, (index) {
                         return Container(
                           height: 18,
                           width: 18,
                           decoration: BoxDecoration(
                             color: product.colors[index],
                             shape: BoxShape.circle
                           ),
                         );
                      }),
                    ),
                  ],
                )
                
              ],
            ),
          ),
          Positioned(
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(10)
                    )
                  ),
                  child: GestureDetector(
                    onTap: (){
                      provider.toggleFavorite(product);
                    },
                      child: Icon(
                        provider.isExist(product)?
                            Icons.favorite:
                        Icons.favorite_border,color: Colors.white,size: 22,)),
                ),
              )
          )
        ],
      ),
    );
  }
}
