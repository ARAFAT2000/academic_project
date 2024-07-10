import 'package:academic_project/Constant/constant.dart';
import 'package:academic_project/Provider/provider_cart_screen.dart';
import 'package:academic_project/Screen/Cart/check_out_box.dart';
import 'package:academic_project/Screen/bottom_nav_bar.dart';
import 'package:flutter/material.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider=CartProvider.of(context);
    final finalist= provider.cart;
    //for quantity
 productQuantity(IconData icon,int index){
   return GestureDetector(onTap: (){
     setState(() {
       icon== Icons.add ? provider.increment(index):provider.decrement(index);
     });

   },
     child: Icon(icon,size: 20,),
   );
   
 }

    return Scaffold(
      bottomSheet: CheckOutBox(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               IconButton(
                   onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomPage()));
                   },
                   icon: Icon(Icons.arrow_back_ios_sharp),
               style: IconButton.styleFrom(
                 backgroundColor: Colors.white
               ),
               ),
                  Text('My Cart',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  Container()
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: finalist.length,
                    itemBuilder: (context,index){
                    final cartItem= finalist[index];
                      return Stack(
                        children: [
                            Padding(
                                padding: EdgeInsets.all(15),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(

                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 90,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(cartItem.image),
                                  ),
                                  SizedBox(width:2,),
                                  Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                      Text(cartItem.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                        ),),
                                      SizedBox(height: 5,),
                                      Text(cartItem.category,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.grey.shade400
                                        ),),
                                      SizedBox(height: 10,),
                                      Text(
                                        ' ${cartItem.price}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.grey.shade400
                                        ),)

                                    ],
                                  ),

                                ],
                              ),
                            ),
                            ),

                          Positioned(
                            top:35,
                              right:35,
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: (){
                                         finalist.removeAt(index);
                                         setState(() {

                                         });
                                      },
                                      icon: Icon(Icons.delete,color: Colors.red,)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade400
                                      ),
                                      color: kcontentColor,
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        productQuantity(Icons.add, index),
                                        SizedBox(width: 10,),
                                        Text(cartItem.quantity.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87
                                            )
                                        ),
                                        SizedBox(width: 10,),
                                        productQuantity(Icons.remove, index),
                                      ],
                                    ),
                                  )

                                ],
                              ))
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
