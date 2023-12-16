import 'package:carousel_slider/carousel_slider.dart';
import 'package:figma_project/colors.dart';
import 'package:figma_project/fav_button.dart';
import 'product.dart';
import 'package:figma_project/widgets.dart';
import 'package:flutter/material.dart';

List MyCardItems = [];
List MyCardItemsPrice = [];
List<String> myFavItems = [];

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> addressArr = [
    'Green Way 3000, Sylhet',
    'Halt road 201, Europe',
    'Halt road 201, Asia',
    'Halt road 201, Africa'
  ];
  String addressDropDownValue = 'Green Way 3000, Sylhet';

  List<String> timeArr = ['1 Hour', '2 Hours', '3 Hours', '4 Hours'];
  String timeDropDownValue = '1 Hour';

  List<String> SliderImagesArr = [
    'assets/images/slider/slider1.jpg',
    'assets/images/slider/slider2.png',
    'assets/images/slider/slider3.png',
    'assets/images/slider/slider5.png'
  ];

  List RecommendedItemsArr = [
    'Biryani',
    'Haleem',
    'Karhai',
    'Nihari',
    'Burger'
  ];
  List RecommendedItemsPriceArr = [
    '\$2.5',
    '\$1.75',
    '\$2.0',
    '\$3.0',
    '\$2.0'
  ];
  List RecommendedItemsURLArr = [
    'assets/images/recommend/biryani.jpg',
    'assets/images/recommend/haleem.jpg',
    'assets/images/recommend/karhai.jpg',
    'assets/images/recommend/nihari.jpg',
    'assets/images/recommend/burger.jpg'
  ];

  List DealArr = [
    'Asia-Cup Deal',
    'Cricket Deal',
    'Mid Night Deal',
    'Gol-Gappay Combo',
    'Weekend Deal'
  ];
  List DealPriceArr = ['\$3.5', '\$2.75', '\$3.0', '\$3.50', '\$4.0'];
  List DealsURLArr = [
    'assets/images/deals/11.jpeg',
    'assets/images/deals/1.jpg',
    'assets/images/deals/3.jpg',
    'assets/images/deals/4.png',
    'assets/images/deals/5.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 20, bottom: 30),
              width: MediaQuery.of(context).size.width * 1,
              color: AppColors.blueShade_1,
              child: SearchBarr("Search or Enter here...") //Function of Bar
              ),

          //dropdown button
          // Container(
          //   width: double.maxFinite,
          //   color: AppColors.blueShade_2,
          //   height: 80,
          //   child: Row(
          //     children: [
          //       Container(
          //         color: AppColors.orangeShade_1,
          //         width: MediaQuery.of(context).size.width*0.5,
          //         height: 40,
          //       ),
          //       Container(
          //         color: AppColors.orangeShade_2,
          //         width: MediaQuery.of(context).size.width*0.5,
          //         height: 40,
          //       )
          //     ],
          //   ),
          // ),

          //Slider Banner
          CarouselSlider.builder(
            itemCount: SliderImagesArr.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              String ImageUrl = SliderImagesArr[itemIndex];
              return Container(
                color: Colors.transparent,
                child: Image.asset(
                  ImageUrl,
                ),
              );
            },
            options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 3)),
          ),

          //Recommended text
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const TileWidget(
              text: 'Recommended ',
            ),
          ),

          // First row List
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: RecommendedItemsURLArr.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, bottom: 10),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColors.black_10),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MyProduct(
                                              productName:
                                                  RecommendedItemsArr[index],
                                              price: RecommendedItemsPriceArr[
                                                  index],
                                              onAddToCart:
                                                  (productName, price) {
                                                MyCardItems.add(productName);
                                                MyCardItemsPrice.add(price);
                                              },
                                            )));
                              },
                              child: SizedBox(
                                width: 150,
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topCenter,
                                      color: AppColors.black_10,
                                      width: 140,
                                      height: 115,
                                      child: Image.asset(
                                          RecommendedItemsURLArr[index]),
                                    ),
                                    ListTile(
                                      title:
                                          Text(RecommendedItemsPriceArr[index]),
                                      subtitle:
                                          Text(RecommendedItemsArr[index]),
                                      trailing: IconButton.filled(
                                        onPressed: () {
                                          MyCardItems.add(
                                              RecommendedItemsArr[index]);
                                          MyCardItemsPrice.add(
                                              RecommendedItemsPriceArr[index]);
                                        },
                                        icon: const Icon(Icons.add_circle),
                                        color: AppColors.blueShade_1,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          child: FavoriteButton(
                              itemName: RecommendedItemsArr[index]))
                    ],
                  );
                }),
          ),

          //Deals Text
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const TileWidget(text: 'Combos and Deals'),
          ),

          //Deals list
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: RecommendedItemsURLArr.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 10, bottom: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.black_10),
                        ),
                        onPressed: () {},
                        child: Container(
                          width: 170,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                color: AppColors.black_10,
                                width: 150,
                                height: 110,
                                child: Image.asset(DealsURLArr[index]),
                              ),
                              Stack(
                                children: [
                                  ListTile(
                                    title: Text(DealArr[index]),
                                    subtitle: Text(DealPriceArr[index]),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      onPressed: () {
                                        MyCardItems.add(DealArr[index]);
                                        MyCardItemsPrice.add(
                                            DealPriceArr[index]);
                                      },
                                      icon: const Icon(Icons.add_circle),
                                      color: AppColors.blueShade_1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  );
                }),
          ),

          const SizedBox(
            height: 30,
          )
        ],
      ),
    ));
  }
}
