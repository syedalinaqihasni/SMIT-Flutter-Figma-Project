import 'package:figma_project/colors.dart';
import 'package:figma_project/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Favorite_view extends StatefulWidget {
  const Favorite_view({super.key});

  @override
  State<Favorite_view> createState() => _Favorite_viewState();
}

class _Favorite_viewState extends State<Favorite_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: myFavItems.length,
            itemBuilder: (context, index) {
              if (myFavItems.isEmpty) {
                return const Center(child: Text('No Favorite items Selected'));
              } else {
                return Container(
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: ListTile(
                    tileColor: AppColors.black_20,
                    leading:
                        SvgPicture.asset('assets/images/card/listimage.svg'),
                    title: Text(
                      myFavItems[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            myFavItems.removeAt(index);
                          });
                        },
                        icon: SvgPicture.asset(
                          'assets/images/icon/minus.svg',
                          // ignore: deprecated_member_use
                          color: Colors.red,
                        )),
                  ),
                );
              }
            }));
  }
}
