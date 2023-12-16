import 'package:figma_project/landing_screen.dart';
import 'package:figma_project/widgets.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'colors.dart';

class OnBoard_screen extends StatefulWidget {
  const OnBoard_screen({super.key});

  @override
  State<OnBoard_screen> createState() => _OnBoard_screenState();
}

class _OnBoard_screenState extends State<OnBoard_screen> {

final SLiderKaController = PageController();

List TitleArr = ['Your holiday\nshopping\ndelivered to Screen\none ' ,'Your holiday\nshopping\ndelivered to Screen\ntwo ' ];
List SubTitleArr = ['Theres something for everyone to enjoy with Sweet Shop Favourites Screen 1','Theres something for everyone to enjoy with Sweet Shop Favourites Screen 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.blueShade_1,
       body: Column(
         children: [
           Expanded(
             child: PageView(
              controller: SLiderKaController,
              physics:const BouncingScrollPhysics(),
              children: [
                //page one
                Column(
                  children: [
                    Container(
                      color: AppColors.blueShade_1,
                      margin: const EdgeInsets.only(top: 100),
                      child: const Center(
                        child: Text('Your holiday\nshopping\ndelivered to Screen\none 🏡',
                        textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                              ),
                        ),
                      ),
                    ),
                    Container( 
                      margin:const EdgeInsets.only(top: 20),
                      color: AppColors.blueShade_1,
                      width: 280,
                      height: 66,
                       child: const Text('Theres something for everyone to enjoy with Sweet Shop Favourites Screen 1',
                       style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.w500,
                       color: Color(0xffB2BBCE),
                       ),
                       ),
                    )
                  ],
                ),
                //second page
                Column(
                  children: [
                    Container(
                    color: AppColors.blueShade_1,
                      margin: const EdgeInsets.only(top: 100),
                      child: const Center(
                        child: Text('Your holiday\nshopping\ndelivered to Screen\ntwo 🏡 ',
                        textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                              ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      color: AppColors.blueShade_1,
                      width: 280,
                      height: 66,
                       child: const Text('Theres something for everyone to enjoy with Sweet Shop Favourites Screen 2',
                       style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.w500,
                       color: Color(0xffB2BBCE),
                       ),
                       ),
             
                    ),
                  ],
                )
              ],
             ),
           ),

            //inicator
           Padding(
             padding: const EdgeInsets.only(bottom: 110,right: 186),
             child: SmoothPageIndicator(
              controller: SLiderKaController, 
              count: 2,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.black_1,
                dotColor: AppColors.black_45,
                dotHeight: 7,
                dotWidth: 20,
                spacing: 10
              ),
              ),
           ),


           Expanded(
             child: Column(
              children: [
                //image
                SizedBox( 
                  height: 160,
                  child:  Image.asset('assets/images/onboarding/onboarding3.png'),
                ),
                
        
                //button
                Container(
                margin: const EdgeInsets.only(top: 100),
                width: 290,
                height: 75,
                child: CustomButton(onPressed: () {
                    Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LandingPageView()),);
                }, text: 'Get Started '),
              )
              ],
             ),
           )
         ],
       ),
    );
  }
}