import 'package:business_suite_mobile_pos/app/model/review_oder.dart';
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemReview extends StatelessWidget {
  Review item;
  VoidCallback onClickItem;

  ItemReview({
    Key? key,
    required this.item,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: size_10_w),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: kColor6F6F6F,
                      fontWeight: FontWeight.w500,
                      fontSize: text_18,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(right: size_10_w),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    item.price,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: kColor6F6F6F,
                      fontWeight: FontWeight.w500,
                      fontSize: text_18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: size_20_w),
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
                children: [
                  TextSpan(
                    text: item.sale,
                    style: TextStyle(
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
        // Row(
        //   children: [
        //     Container(
        //       alignment: Alignment.centerLeft,
        //       child: Padding(
        //         padding: EdgeInsets.only(left: size_15_w),
        //         child: Text(
        //           item.amount,
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //             color: kColor6F6F6F,
        //             fontWeight: FontWeight.w400,
        //             fontSize: text_15,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.only(left: size_2_w),
        //       child: Text(
        //         item.sale,
        //         style: TextStyle(
        //           color: kColor6F6F6F,
        //           fontWeight: FontWeight.w300,
        //           fontSize: text_15,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
