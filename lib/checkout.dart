import 'package:figma_project/paymentform.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  List LocationType = ['Home', 'Office'];
  List AddressArr = ['36 green way, Sunamganj', 'Medical road, Halal lab, Sunamganj'];
  int SelectedIndex = -1;
  Color Iconcolor = AppColors.black_100;
  TextEditingController AddressKaController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    AddressKaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: AppColors.black_1,
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
        title: Text(
          'Checkout',
          style: TextStyle(
            color: AppColors.black_100,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          // delivery title
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: const ListTile(
              title: Text(
                'Delivery Address',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),

          // address box
          Expanded(
            child: ListView.builder(
              itemCount: LocationType.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      SelectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: SelectedIndex == index ? AppColors.orangeShade_2 : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        children: [
                          Container(
                            child: ListTile(
                              leading: Title(
                                color: AppColors.black_60,
                                child: Text(
                                  LocationType[index],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              trailing: Icon(
                                Icons.check_circle_rounded,
                                color: SelectedIndex == index ? AppColors.orangeShade_2 : AppColors.black_100,
                              ),
                            ),
                            color: AppColors.black_10,
                            height: 60,
                          ),
                          Container(
                            color: AppColors.black_10,
                            child: ListTile(
                              title: Text(
                                AddressArr[index],
                                style:const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              trailing: TextButton(
                                onPressed: () {
                                  showDialog(context: context, builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: AppColors.black_20,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      title: const Text('Edit address here'),
                                      content: TextField(
                                        controller: AddressKaController,
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.orangeShade_1)),
                                          onPressed: (){
                                          Navigator.pop(context);
                                        },
                                         child: Text('cancel',
                                         style: TextStyle(color: AppColors.black_100),
                                         )),
                                        ElevatedButton(
                                          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColors.orangeShade_1)),
                                          onPressed: (){
                                          setState(() {
                                                AddressArr[index]=AddressKaController.text;
                                                AddressKaController.clear();
                                                Navigator.pop(context);
                                          });
                                        },
                                         
                                        child: Text('Save',
                                        style: TextStyle(color: AppColors.black_100 ),
                                        ))
                                      ],
                                    );
                                  }
                                  );


                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: AppColors.blueShade_2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),


          //place order button
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: ElevatedButton(
              style: 
              ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                shadowColor: MaterialStatePropertyAll(AppColors.blueShade_1),
                backgroundColor: MaterialStatePropertyAll(AppColors.blueShade_2)
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => Payment()));
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 90,
                width: 300,
                child: Center(child: Text('Make Payment',
                style: TextStyle(
                  color: AppColors.black_1,
                  fontSize: 18
                ),
                )
              ),
              )
            ),
          )
        ],
      ),
    );
  }
}
