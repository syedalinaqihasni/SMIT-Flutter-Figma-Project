import 'package:figma_project/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Payment extends StatelessWidget {
  Payment({super.key});

  final _formkey = GlobalKey<FormState>();

  dispose() {
    cardHolderController.clear();
    cardNumberController.clear();
    expiryController.clear();
    cvcController.clear();
  }

  TextEditingController cardHolderController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.black_1,
          leading: Container(
            padding: const EdgeInsets.all(6),
            child: CircleAvatar(
              radius: 5,
              backgroundColor: AppColors.black_20,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.black_100,
                  )),
            ),
          ),
          title: Text(
            'Payment',
            style: TextStyle(color: AppColors.black_100),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: MediaQuery.of(context).size.width * 0.10,
                    right: MediaQuery.of(context).size.width * 0.10),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'CARD HOLDER NUMBER',
                            style: TextStyle(color: AppColors.black_60),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter this field';
                            }
                            return null;
                          },
                          controller: cardHolderController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'CARD NUMBER',
                            style: TextStyle(color: AppColors.black_60),
                          ),
                        ),
                        TextFormField(
                          controller: cardNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter this field';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Expiry Date',
                                    selectionColor: Colors.black,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: AppColors.black_60),
                                  ),
                                ),
                                TextFormField(
                                  controller: expiryController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter this field';
                                    }
                                    return null;
                                  },
                                )
                              ],
                            )),
                            const Padding(padding: EdgeInsets.only(right: 10)),
                            Expanded(
                                child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'CVC',
                                    style: TextStyle(color: AppColors.black_60),
                                  ),
                                ),
                                TextFormField(
                                  controller: cvcController,
                                  validator: (value) {
                                    if (value == null || value.length != 3) {
                                      return 'Enter this field';
                                    }
                                    return null;
                                  },
                                )
                              ],
                            )),
                          ],
                        )
                      ],
                    )),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3,
                ),
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                        shadowColor:
                            MaterialStatePropertyAll(AppColors.blueShade_1),
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.blueShade_2)),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        
                        showDialog(
                            context: context,
                            builder: (context) {
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.of(context).pop();
                              });

                              return CupertinoAlertDialog(
                                title:
                                    const Text('Order successfully Placed !'),
                                actions: [
                                  SvgPicture.asset(
                                    "assets/images/payment/tick.svg",
                                    color: Colors.green,
                                  )
                                ],
                              );
                            });
                      }
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 90,
                      width: 300,
                      child: Center(
                          child: Text(
                        'Confirm Order',
                        style:
                            TextStyle(color: AppColors.black_1, fontSize: 18),
                      )),
                    )),
              )
            ],
          ),
        ));
  }
}
