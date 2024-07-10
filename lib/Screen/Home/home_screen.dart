import 'package:flutter/material.dart';

import '../../Model/catagory.dart';
import '../../Model/product_model.dart';
import '../../utils/modify_text.dart';
import 'Widget/custom_appber.dart';
import 'Widget/images_slider.dart';
import 'Widget/product_card.dart';
import 'Widget/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectcatagory = [all, shoes, beauty, womenFashion, jewelry, menFashion];
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 7, right: 7, top: 12),
          child: Column(
            children: [
              SizedBox(
                height: size.height / 45,
              ),
              CustomAppber(),
              SizedBox(
                height: size.height / 45,
              ),
              Searchbar(),
              SizedBox(
                height: size.height / 45,
              ),
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(() {
                    currentSlider = value;
                  });
                },
              ),
              SizedBox(
                height: size.height / 45,
              ),
              SizedBox(
                height: size.height / 6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedIndex == index ? Colors.blue[200] : Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: size.height / 13,
                              width: size.width / 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  image: AssetImage(categoriesList[index].image.toString()),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 45,
                            ),
                            ModifyText(text: categoriesList[index].title.toString(), size: 15)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ModifyText(text: 'Special for you', size: 20),
                  ModifyText(text: 'See all', size: 14),
                ],
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: selectcatagory[selectedIndex].length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: selectcatagory[selectedIndex][index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
