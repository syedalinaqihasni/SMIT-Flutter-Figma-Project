import 'package:flutter/material.dart';
import 'colors.dart';
import 'restaurant.dart';

List CategoriesArr = ['KFC','Mcdonalds','Allah wala Biryani','OPTP','Al-Naseeb','Broadway Pizza','Starbucks','Kababjees'];
List CategoriesItemsURLArr = ['assets/images/categories/kfc.png',
                              'assets/images/categories/mc.jpg' ,
                              'assets/images/categories/allahwalabiryani.jpg',
                              'assets/images/categories/optp.jpg',
                              'assets/images/categories/alnaseeb.jpg',
                              'assets/images/categories/broadway.jpg',
                              'assets/images/categories/starbucks.jpg'
                              ];

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key});


  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header text
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 30),
              color: AppColors.blueShade_1,
              width: double.infinity,
              child: Text(
                'Shop\nBy Category',
                style: TextStyle(
                  color: AppColors.black_1,
                  fontSize: 50,
                ),
              ),
            ),
      
            // Grid view
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                ),
                itemCount: CategoriesItemsURLArr.length,
                padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
                itemBuilder: (BuildContext context, int index)  {
                  return Container(
                    margin: const EdgeInsets.only(top: 4,left: 10,right: 10,bottom: 12),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(AppColors.black_1)
                      ),
                      onPressed: () {
                              String restName = CategoriesArr[index]; // Get the restaurant name
                              Navigator.push( context,MaterialPageRoute( builder: (context) =>
                               Restaurant(restaurantName: restName), ), );
                            },
                      child: Container(
                        color: Colors.transparent,
                        height: 158,
                        child: Stack(
                              children: [
                                Container(
                                  color: AppColors.black_1,
                                  width: 130,
                                  child: Image.asset(CategoriesItemsURLArr[index],)
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(CategoriesArr[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.blueShade_1,
                                    fontWeight: FontWeight.w700,
                                    backgroundColor:AppColors.black_20
                                  ),),
                                ),
                              ],
                            ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
