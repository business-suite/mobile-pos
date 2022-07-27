import 'package:business_suite_mobile_pos/app/model/invoice.dart';
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemInVoice extends StatelessWidget {
  InVoice item;
  VoidCallback onClickItem;

  ItemInVoice({
    Key? key,
    required this.item,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(size_2_w)),
          padding:
              EdgeInsets.symmetric(vertical: size_1_w, horizontal: size_1_w),
          child: Container(
            width: double.infinity,
            height: size_50_w,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    item.image,
                    fit: BoxFit.fill,
                    height: size_20_w,
                    width: size_20_w,
                  ),
                ),
                SizedBox(
                  width: size_2_w,
                ),
                Text(
                  '|',
                  style: TextStyle(
                      fontSize: size_20_w,
                      color: kColor3E3E3E,
                      fontWeight: FontWeight.normal),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: size_5_w),
                    child: Text(
                      item.name,
                      style: TextStyle(
                          fontSize: size_12_w,
                          color: kColor3E3E3E,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      item.quantity,
                      style: TextStyle(
                          fontSize: size_12_w,
                          color: kColor3E3E3E,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    item.price,
                    style: TextStyle(fontSize: size_12_w, color: kColor3E3E3E),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: size_10_w,
          color: kColorf0eeee,
        )
      ],
    );
  }
}
