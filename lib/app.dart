
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/favorite_provider.dart';
import 'Provider/provider_cart_screen.dart';
import 'Screen/bottom_nav_bar.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>CartProvider()),
          ChangeNotifierProvider(create: (_)=>FavoriteProvider())

        ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home:BottomPage(),
    ),
    );

  }
}