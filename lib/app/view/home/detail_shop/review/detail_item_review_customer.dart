import 'package:business_suite_mobile_pos/app/model/detail_review_oder.dart';
import 'package:business_suite_mobile_pos/app/model/review_oder.dart';
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailItemReview extends StatelessWidget {
  DetailReview item;
  VoidCallback onClickItem;

  DetailItemReview({
    Key? key,
    required this.item,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // item name
        Padding(
          padding: EdgeInsets.only(left: size_10_w),
          child: Container(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                text: item.amount,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: kColor666666,
                  fontSize: text_15,
                ),
                //item sale
                children: [
                  TextSpan(
                    text: item.name,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                      color: kColor6F6F6F,
                      fontSize: text_15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //item price
        Padding(
          padding: EdgeInsets.only(right: size_10_w),
          child: Container(
            alignment: Alignment.topRight,
            child: Text(
              item.price,
              textAlign: TextAlign.right,
              maxLines: 1 ,
              style: TextStyle(
                color: kColor6F6F6F,
                fontWeight: FontWeight.w500,
                fontSize: text_18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
