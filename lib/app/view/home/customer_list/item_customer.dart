import 'package:business_suite_mobile_pos/app/model/order.dart';
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/custom_card.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../model/customer.dart';

class ItemCustomer extends StatelessWidget {
  Customer item;
  VoidCallback onClickItem;

  ItemCustomer({
    Key? key,
    required this.item,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: size_10_w),
              child: Text(
                item.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kColor6F6F6F,
                  fontWeight: FontWeight.w300,
                  fontSize: text_13,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(left: size_20_w),
            child: Text(
              item.date,
              style: TextStyle(
                color: kColor6F6F6F,
                fontWeight: FontWeight.w300,
                fontSize: text_12,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.only(right: size_10_w),
            child: Text(
              item.email,
              style: TextStyle(
                color: kColor6F6F6F,
                fontSize: text_10,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
