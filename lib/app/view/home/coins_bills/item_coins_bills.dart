// ignore_for_file: prefer_const_constructors

import 'package:business_suite_mobile_pos/app/model/bill.dart';
import 'package:business_suite_mobile_pos/app/model/price.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/popup_bill.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';

class ItemCoInsBills extends StatelessWidget {
  Price item;
  VoidCallback onClickItem;

  ItemCoInsBills({
    Key? key,
    required this.item,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kColorf0eeee,
       elevation: 0,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: size_5_w,
              right: size_5_w,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    cursorColor: kColor808080,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '0',
                      errorStyle: TextStyle(height: 0) ,
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(

                    padding: EdgeInsets.only(top: size_20_w),
                    child: Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kColor555555,
                        fontWeight: FontWeight.normal,
                        fontSize: text_14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
