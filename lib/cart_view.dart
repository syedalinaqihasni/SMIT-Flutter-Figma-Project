import 'package:figma_project/colors.dart';
import 'package:figma_project/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_view.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //list tile and banner
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.asset('assets/images/card/banner.jpg'),
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
                  'Shopping Cart',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),

          //text tile
          ListTile(
            tileColor: AppColors.orangeShade_1,
            title: Center(
              child: Text(
                'Use code #HalalFood at Checkouut',
                style: TextStyle(
                  color: AppColors.black_100,
                ),
              ),
            ),
          ),

          //items list
          Expanded(
            child: ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(20),
                itemCount: MyCardItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 6),
                    color: AppColors.black_10,
                    child: GestureDetector(
                      child: ListTile(
                        leading: SvgPicture.asset(
                            'assets/images/card/listimage.svg'),
                        title: Text(MyCardItems[index]),
                        subtitle: Text(MyCardItemsPrice[index]),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                MyCardItems.removeAt(index);
                                MyCardItemsPrice.removeAt(index);
                              });
                            },
                            icon: SvgPicture.asset(
                              'assets/images/icon/minus.svg',
                              color: Colors.red,
                            )),
                      ),
                    ),
                  );
                }),
          ),

          //subtotal
          Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              height: 210,
              width: double.infinity,
              color: AppColors.black_1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Container(
                  color: AppColors.black_20,
                  child: const ProceedBotton(),
                ),
              )),
        ],
      )),
    );
  }
}
