import 'package:academic_project/Model/product_model.dart';
import 'package:academic_project/Provider/provider_cart_screen.dart';
import 'package:flutter/material.dart';

import '../../Constant/constant.dart';
class AddtoCart extends StatefulWidget {
  final Product product;
  const AddtoCart({super.key, required this.product});

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  int currentIndex=1;
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    final provider= CartProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(59),
          color: Colors.black87
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Container(
               height: 40,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 border: Border.all(color: Colors.white,width: 2),
               ),
               child: Row(
                 children: [
                   IconButton(
                       onPressed: (){
                     if(currentIndex !=1){
                       setState(() {
                         currentIndex--;
                       });
                     }
                   },
                       iconSize: 14,
                       icon: Icon(Icons.remove,
                       color: Colors.white,
                       )),

                  SizedBox(
                    width: 5,
                  ),
                   Text(currentIndex.toString(),
                     style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                   SizedBox(
                     width: 5,
                   ),
                   IconButton(
                       onPressed: (){
                         setState(() {
                           currentIndex++;
                         });
                       },
                       iconSize: 14,
                       icon: Icon(Icons.add,
                         color: Colors.white,
                       )),
                 ],
               ),
             ),


              GestureDetector(
                onTap: (){
                  provider.toggleFavorite(widget.product);
                const  snakbar= SnackBar(content: Text('Succesfully add'));
                  ScaffoldMessenger.of(context).showSnackBar(snakbar);
                },
                child: Container(
                  height: 55,

                  decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
