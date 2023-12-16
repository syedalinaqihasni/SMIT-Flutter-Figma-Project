import 'package:figma_project/colors.dart';
import 'package:figma_project/favorites_view.dart';
import 'package:figma_project/home_view.dart';
import 'package:figma_project/more_view.dart';
import 'categories_view.dart';
import 'package:flutter/material.dart';
import 'cart_view.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  List tabs = [
    const HomeView(),
    const CategoryPage(),
    const Favorite_view(),
    const MoreView(),
  ];

  int _currentIndex = 0;

  get cardLenghtNum => 0; // Index of the currently selected item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black_1,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: AppColors.blueShade_1,
        title: const Text('Hey, Fariz', textAlign: TextAlign.left),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyCard()));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined)),
              // Container(
              //     margin: const EdgeInsets.only(left: 30, top: 5),
              //     alignment: Alignment.topRight,
              //     child: Text(
              //       MyCardItems.length.toString(),
              //       style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.w600,
              //           color: AppColors.orangeShade_1),
              //     ))
            ],
          )
        ],
      ),

      body: tabs[_currentIndex],

      //bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_sharp), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: 'More'),
        ],
        currentIndex: _currentIndex,
        backgroundColor: AppColors.blueShade_1,
        selectedItemColor: AppColors.orangeShade_2,
        unselectedItemColor: AppColors.black_1,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        selectedIconTheme: const IconThemeData(size: 35),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      // CurvedNavigationBar(
      //   items: [
      //     Icon(Icons.home, color: AppColors.black_100,),
      //     Icon(Icons.category_sharp, color: AppColors.black_100),
      //     Icon(Icons.favorite_border, color: AppColors.black_100),
      //     Icon(Icons.more_vert, color: AppColors.black_100),
      //   ],
      //   backgroundColor: Colors.transparent,
      //   color: AppColors.black_1,
      //   buttonBackgroundColor: AppColors.black_1,
      //   animationDuration: const Duration(milliseconds: 400 ),
      //   onTap: (index) {
      //     setState(() {
      //       // Update the color of the tapped icon and reset the color of others
      //       _currentIndex = index;
      //     });
      //   },
      //   index: _currentIndex,

      // ),
    );
  }
}
