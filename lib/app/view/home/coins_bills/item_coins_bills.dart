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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(

              left: size_5_w,
              right: size_5_w,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: size_5_w,
                  ),
                  child: Container(
                    width: size_30_w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  )
                ),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontWeight: FontWeight.normal,
                    fontSize: text_12,
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
