import 'package:academic_project/Constant/constant.dart';
import 'package:academic_project/Screen/Details/details_screen.dart';
import 'package:academic_project/utils/modify_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final products;
  const ProductCard({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>
                DetailsScreen(product: products)));
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
                     tag:products.image ,
                     child: Image.asset(products.image,
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
                  child: ModifyText(text: products.title, size: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${products.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Row(

                      children: List.generate(
                          products.colors.length, (index) {
                         return Container(
                           height: 18,
                           width: 18,
                           decoration: BoxDecoration(
                             color: products.colors[index],
                             shape: BoxShape.circle
                           ),
                         );
                      }),
                    ),
                  ],
                )
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
