import 'package:flutter/material.dart';
import '../../Constant/constant.dart';
import '../../Provider/favorite_provider.dart';


class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalist= provider.favorites;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcontentColor,
        title: const Text(
          "Favorite",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),
        ),
        centerTitle: true,
      ),
body: Column(
 children: [
   Expanded(
       child: ListView.builder(
           itemCount: finalist.length,
           itemBuilder: (context,index){
             final favoriteItem= finalist[index];
             return Stack(
               children: [
                 Padding(
                   padding: EdgeInsets.all(15),
                   child: Container(
                     padding: EdgeInsets.all(10),
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Row(

                       crossAxisAlignment:CrossAxisAlignment.start,
                       children: [
                         Container(
                           height: 85,
                           width: 85,
                           padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                           ),
                           child: Image.asset(favoriteItem.image),
                         ),
                         SizedBox(width:2,),
                         Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment:CrossAxisAlignment.start,
                           children: [
                             Text(favoriteItem.title,
                               style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16
                               ),),
                             SizedBox(height: 5,),
                             Text(favoriteItem.category,
                               style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 14,
                                   color: Colors.grey.shade400
                               ),),
                             SizedBox(height: 10,),
                             Text(
                               ' ${favoriteItem.price}',
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


                       ],
                     ))
               ],
             );
           }))
 ],
),
    );
  }
}