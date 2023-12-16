import 'package:flutter/material.dart';
import 'colors.dart';

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({super.key});

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {

  List<String> addressArr = ['Green Way 3000, Sylhet', 'Halt road 201, Europe', 'Halt road 201, Asia', 'Halt road 201, Africa'];
  String addressDropDownValue = 'Green Way 3000, Sylhet';

  List<String> timeArr = ['1 Hour', '2 Hours', '3 Hours', '4 Hours'];
  String timeDropDownValue = '1 Hour';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
             Container(
              color: AppColors.blueShade_1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: DropdownButton<String>(
                  value: addressDropDownValue,
                  onChanged: (newValue) {
                    setState(() {
                      addressDropDownValue = newValue!;
                    });
                  },
                  items: addressArr.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Colors.black, // Change the text color to black
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
      
            // Second Dropdown Button
            Flexible(
              child: Container(
                color: AppColors.blueShade_1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: DropdownButton<String>(
                    value: timeDropDownValue,
                    onChanged: (newValue) {
                      setState(() {
                        timeDropDownValue = newValue!;
                      });
                    },
                    items: timeArr.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: Colors.black, // Change the text color to black
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}