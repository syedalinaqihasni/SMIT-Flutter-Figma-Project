import 'package:figma_project/home_view.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

// ignore: must_be_immutable
class Restaurant extends StatelessWidget {
  final String restaurantName; 

  Restaurant({Key? key, required this.restaurantName}) : super(key: key); // Constructor with restaurantName parameter

List counter = ['Deal 1','Deal 2','Deal 3','Deal 4','Deal 5','Deal 6','Deal 7','Deal 8','Deal 9','Deal 10','Deal 11','Deal 12','Deal 13','Deal 14','Deal 15','Deal 16','Deal 17','Deal 18','Deal 19','Deal 20',];
List counterPrice = ['\$2.25','\$4.25','\$2.25','\$4.25','\$2.25','\$4.25','\$2.25','\$4.25','\$3.25','\$2.25','\$4.25','\$1.25','\$7.25','\$4.25','\$2.25','\$4.25','\$2.25','\$4.25','\$2.25','\$3.25'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading:  CircleAvatar(
                  backgroundColor: AppColors.black_20,
                  child: IconButton(onPressed: () {
                    Navigator.of(context).pop();
                  },
                   icon: const Icon(Icons.arrow_back_ios),
                   alignment: Alignment.center,
                   color: AppColors.black_100,
                   ),
                ),
          title: Text(restaurantName),
          ),

          Expanded(
            child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                    itemCount: counter.length,
                                    itemBuilder: (BuildContext , int index) {
                                      return Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(6),
                                            padding: EdgeInsets.all(4),
                                            color: Color.fromARGB(255, 231, 215, 169),
                                            child: Center(child: Text(counter[index])),
                                          ),
                                          Container(
                                            alignment: Alignment.bottomRight,
                                            child: IconButton(
                                              onPressed: (){
                                                MyCardItems.add(counter[index]);
                                                MyCardItemsPrice.add(counterPrice[index]);
                                               }, 
                                              icon: Icon(Icons.add_circle_sharp),
                                              alignment: Alignment.bottomRight,
                                              ),
                                          )
                                        ],
                                      );
                                    }),
          )
        ],
      )),
    );
  }
}
