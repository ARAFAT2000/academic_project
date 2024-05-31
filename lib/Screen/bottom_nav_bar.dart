import 'package:academic_project/Screen/Cart/cart_screen.dart';
import 'package:academic_project/Screen/Favorite/favorite_screen.dart';
import 'package:academic_project/Screen/Home/home_screen.dart';
import 'package:academic_project/Screen/Profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../Constant/constant.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int selectindex= 2;

  List screen=[
    Scaffold(),
    FavoriteScreen(),
    HomeScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          height: 60,
          color: Colors.white,
          elevation: 3,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
           setState(() {
             selectindex =0;
           });
              },
                  icon: Icon(Icons.grid_view_outlined,
                    size:30,
                    color:selectindex==0 ? kprimaryColor:Colors.grey.shade400,)),

              IconButton(onPressed: (){
                setState(() {
                  selectindex=1;
                });
              },
                  icon: Icon(Icons.favorite_border,
                    size: 30,
                    color:selectindex==1 ? kprimaryColor:Colors.grey.shade400,
                  )),

              SizedBox(
                width:size.width/20 ,
              ),
              IconButton(onPressed: (){
                setState(() {
                  selectindex=3;
                });
              },
                  icon: Icon(Icons.shopping_cart,size: 30,
                    color:selectindex==3 ? kprimaryColor:Colors.grey.shade400,)),
              IconButton(onPressed: (){
                setState(() {
                  selectindex=4;
                });
              },
                  icon: Icon(Icons.person,size: 30,
                    color:selectindex==4 ? kprimaryColor:Colors.grey.shade400,)),


            ],
          ),
        ),
      floatingActionButton: 
      FloatingActionButton(
        backgroundColor:kprimaryColor ,
        onPressed: (){
        setState(() {
          selectindex=2;
        });
      },
      child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: screen[selectindex],
    );
  }
}
