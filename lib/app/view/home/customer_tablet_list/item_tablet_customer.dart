import 'package:business_suite_mobile_pos/app/model/order.dart';
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/custom_card.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../module/network/response/customers_response.dart';


class ItemCustomer extends StatelessWidget {
  Customer item;
  VoidCallback onClickItem;
  int index;

  ItemCustomer({
    Key? key,
    required this.item,
    required this.onClickItem,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      backgroundColor: index % 2 == 0 ? kColorE6E6E6 : kColorF7F7F7,
      padding: EdgeInsets.symmetric(horizontal: size_10_w),
      child: SizedBox(
        height: size_40_w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.name ?? '',
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontWeight: FontWeight.w300,
                    fontSize: text_13,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: size_20_w),
                child: Text(
                  item.zip ?? '',
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontWeight: FontWeight.w300,
                    fontSize: text_12,
                  ),
                ),
              ),
            ),
            SizedBox(width: size_10_w,),
            Expanded(
              flex: 3,
              child: Text(
                item.email ?? '',
                style: TextStyle(
                  color: kColor6F6F6F,
                  fontSize: text_11,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
