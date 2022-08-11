import 'package:business_suite_mobile_pos/app/model/detail_review_oder.dart';
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size_10_w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // item name
          Container(
            alignment: Alignment.centerLeft,
            child: Wrap(
              children: [
                RichText(
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
              ],
            ),
          ),
          //item price
          Expanded(
            flex: 1,
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
      ),
    );
  }
}
