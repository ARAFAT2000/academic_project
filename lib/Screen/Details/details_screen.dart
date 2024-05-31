import 'package:academic_project/Constant/constant.dart';
import 'package:academic_project/Model/product_model.dart';
import 'package:academic_project/Screen/Details/addtocard.dart';
import 'package:academic_project/Screen/Details/description.dart';
import 'package:academic_project/Screen/Details/details_images_slider.dart';
import 'package:academic_project/Screen/Details/item_details_card.dart';
import 'package:academic_project/utils/modify_text.dart';
import 'package:flutter/material.dart';

import 'details_appber.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
      int currentImage= 0;
      int currentColor= 0;
      final size=  MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kcontentColor,
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  
           floatingActionButton: AddtoCart(product: widget.product),
           body: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.only(left: 1,right: 5,top: 20),
               child: Column(
                 children: [
                   DetailsAppber(),
                   DetailsImageSlider(
                       onChanges: (index){
                     setState(() {
                       currentImage =  index;
                     });
                   }, image: widget.product.image),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: List.generate(
                       5,
                           (index) => AnimatedContainer(
                         duration: const Duration(microseconds: 300),
                         width: currentImage == index ? 16 : 8,
                         height: 8,
                         margin: const EdgeInsets.only(right: 3),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: currentImage == index
                                 ? Colors.black
                                 : Colors.transparent,
                             border: Border.all(
                               color: Colors.black,
                             )),
                       ),
                     ),
                   ),
                    SizedBox(
                      height: size.height/25,
                    ),
             
                   Container(
             
                       width: double.infinity,
                     decoration: BoxDecoration(
                         color: Colors.white,
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(40),
                         topRight: Radius.circular(40),
                       )
                     ),
                     child: Padding(
                         padding: EdgeInsets.only(
                           left: 20,
                           right: 20,
                           top: 20,
                           bottom: 200
                         ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        ItemsDetails(product: widget.product),
                         ModifyText(text: 'Colors', size: 20),
                         SizedBox(
                           height: size.height/55,
                         ),
                         Row(
                           children: List.generate(widget.product.colors.length,
                                   (index) => GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         currentColor=index;
                                       });
                                     },
                                     child: AnimatedContainer(
                                         duration: Duration(milliseconds: 300),
                                       height:35,
                                       width: 35,
                                       decoration:BoxDecoration(
                                         shape: BoxShape.circle,
                                         border: currentColor == index ? Border.all(
                                           color: widget.product.colors[index]
                                         ):null,
                                         color: currentColor ==index? Colors.white : widget.product.colors[index]
                                       ),
                                       padding: currentColor==index? EdgeInsets.all(3): null,
                                       margin: EdgeInsets.only(right: 6),
                                       child: Container(
                                         width: 35,
                                         height: 35,
                                         decoration: BoxDecoration(
                                             color: widget.product.colors[index],
                                             shape: BoxShape.circle),
                                       ),
             
                                     ),
             
                                   )),
                         ),
                         SizedBox(
                           height: size.height/45,
                         ),
                         Description(description: widget.product.description),


             
                       ],
                     ),
                     ),
                   )
                 ],
               ),
             ),
           ),
    );
  }
}
