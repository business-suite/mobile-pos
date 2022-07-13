import 'package:flutter/material.dart';

import '../../../model/keyboard.dart';
import '../../../module/common/config.dart';
import '../../../module/res/style.dart';
import 'number.dart';

class ItemNumber extends StatelessWidget {
  Number numbers;

  ItemNumber({Key? key,  required this.numbers, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25)
            ),
            padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            child: Text(numbers.number.toString(),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
