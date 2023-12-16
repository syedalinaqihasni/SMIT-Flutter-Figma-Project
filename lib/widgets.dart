import 'package:figma_project/checkout.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'home_view.dart';


class ProceedBotton extends StatelessWidget {
  const ProceedBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 50,top: 15),
              child: Text('Subtotal                                                   ${MyCardItemsPrice.length*5} \$',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.black_90,
              ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 50,top: 15),
              child: Text('Delivery                                                    ${MyCardItems.length} \$',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.black_90,
              ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const  EdgeInsets.only(left: 50,top: 15),
              child: 
              Text('Total                                                         ${MyCardItems.length*5+1} \$',
              style: TextStyle(
                fontSize: 15,
                color: AppColors.black_90,
              ),
              ),
            ),
          ],
        ), 
        
        Container(
          margin: const EdgeInsets.only(top: 110,left: 30),
          width: 320,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              alignment: Alignment.center,
              padding:const MaterialStatePropertyAll(EdgeInsets.all(8)),
              backgroundColor: MaterialStateProperty.all(AppColors.blueShade_2),
            ),
            onPressed: () {
                           Navigator.push(context,  MaterialPageRoute(builder: (context) => const CheckOut()) );
            },
            child: Container(
              height: 60,
              child: const Center(child: Text('Proceed to checkout',
              style: TextStyle(
                fontSize: 16
              ),))),
          ),
        ),
        
      ],
    );
  }
}



  Widget buildButtonRow(List<String> items) {
    return Row(
      children: items.map((item) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(0),
            color: AppColors.black_45,
            width: 150,
            height: 200,
            child: Text(item),
          ),
        );
      }).toList(),
    );
  }

SearchBarr(HintText) {
  return 
  TextField(cursorColor: AppColors.black_1,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.blueShade_2,
                prefixIcon: Icon(Icons.search, color: AppColors.black_10),
                contentPadding: const EdgeInsets.all(18),
                hintText: HintText ,
                hintStyle: const TextStyle(color: Color.fromARGB(255, 154, 152, 152)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              style: TextStyle(
                color: AppColors.black_1,
              ),
            );

}

class CustomButton extends StatelessWidget {
  final  onPressed;
  final String text;
 const CustomButton({super.key, required this.onPressed, required this.text});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))) ,
                    backgroundColor: MaterialStatePropertyAll(AppColors.black_1)//white color
                  ),
                  onPressed: onPressed,
                  child:  Row(
                     children: [
                       const Padding(padding: EdgeInsets.only(left: 40)),
                       Text( text ,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                       const Spacer(),
                       const Icon(Icons.arrow_forward_sharp,
                       color:  Colors.black,
                      ),
                      const Spacer(),
                    ],
                   ),
                  );
  }
}
class TileWidget extends StatelessWidget {

final String text;
  const TileWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return 
            ListTile(
              tileColor: AppColors.black_1,
              leading: Title(
                color: AppColors.black_100,
                child: Text( text,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),),
                ),
            );
  }
}
