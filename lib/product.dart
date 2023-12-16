import 'package:figma_project/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyProduct extends StatefulWidget {
  final String productName;
  final String price;
  final Function(String, String) onAddToCart;

  const MyProduct(
      {Key? key,
      required this.productName,
      required this.price,
      required this.onAddToCart})
      : super(key: key);
  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black_1,
        body: Column(
          children: [
            // Product images
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/card/listimage.svg',
                        height: 300,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.black_20,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      alignment: Alignment.center,
                      color: AppColors.black_100,
                    ),
                  ),
                  title: const Text(
                    'Details',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),

            //lite text
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: ListTile(
                minVerticalPadding: 20,
                title: const Center(
                    child: Text('Use code #HalalFood at Checkouut')),
                tileColor: AppColors.orangeShade_1,
              ),
            ),

            // Product details with rounded DraggableScrollableSheet
            Expanded(
              child: DraggableScrollableSheet(
                  initialChildSize: 0.90,
                  minChildSize: 0.90,
                  maxChildSize: 0.98,
                  snap: true,
                  builder: (context, scrollController) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 30, bottom: 20, left: 20, right: 20),
                                  color: AppColors.black_20,
                                  width: double.maxFinite,
                                  child: Text(
                                    widget.productName,
                                    style: const TextStyle(fontSize: 60),
                                  ),
                                ),
                                Container(
                                  height: 6,
                                  width: 60,
                                  color: AppColors.black_60,
                                  margin:
                                      const EdgeInsets.only(top: 12, left: 170),
                                  alignment: Alignment.center,
                                )
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              color: AppColors.black_20,
                              width: double.maxFinite,
                              child: Text(
                                widget.price,
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                            Container(
                              width: double.maxFinite,
                              color: AppColors.black_20,
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: RatingBar(
                                itemSize: 30,
                                allowHalfRating: true,
                                ratingWidget: RatingWidget(
                                    full: const Icon(Icons.star,
                                        color: Colors.amber),
                                    half: const Icon(Icons.star,
                                        color: Colors.amber),
                                    empty: const Icon(Icons.star,
                                        color: Colors.amber)),
                                onRatingUpdate: (rating) {},
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              color: AppColors.black_20,
                              height: 200,
                              child: const Text(
                                  'A product description is a form of marketing copy used to describe and explain the benefits of your product. In other words, it provides all the information and details of your product on your ecommerce site. These product details can be one sentence, a short paragraph or bulleted. They can be serious, funny or quirky.'),
                            ),
                            ExpansionTile(
                              collapsedTextColor: AppColors.black_100,
                              textColor: AppColors.black_100,
                              collapsedBackgroundColor: AppColors.black_45,
                              backgroundColor: AppColors.black_45,
                              iconColor: AppColors.blueShade_2,
                              title: const Text('Nutritional facts'),
                              onExpansionChanged: (value) => true,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(20),
                                    child: const Text(
                                        'A product description is a form of marketing copy used toA product description is a form of marketing copy used toA product description is a form of marketing copy used to'))
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              color: AppColors.black_20,
                              child: const Text(
                                  'A product description is a form of marketing copy used to describe and explain the benefits of your product. In other words, it provides all the information and details of your product on your ecommerce site. These product details can be one sentence, a short paragraph or bulleted. They can be serious, funny or quirky.'),
                            ),
                            Container(
                              height: 100,
                              width: double.maxFinite,
                              padding: const EdgeInsets.only(
                                left: 50,
                                right: 50,
                                bottom: 30,
                              ),
                              color: AppColors.black_20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: GestureDetector(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        widget.onAddToCart(
                                            widget.productName, widget.price);
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  AppColors.blueShade_1)),
                                      child: const Text('Add to card')),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}



// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DraggableScrollableSheet'),
//       ),
//       body: SizedBox.expand(
//         child: DraggableScrollableSheet(
//           builder: (BuildContext context, ScrollController scrollController) {
//             return Container(
//               color: Colors.blue[100],
//               child: ListView.builder(
//                 controller: scrollController,
//                 itemCount: 25,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(title: Text('Item $index'));
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }