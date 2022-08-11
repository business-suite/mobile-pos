import 'package:business_suite_mobile_pos/app/model/review_oder.dart';
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../model/detail_review_oder.dart';
import 'detail_item_review_customer.dart';

class ItemReview extends StatelessWidget {
  List<DetailReview> detailReviews;
  Review item;
  VoidCallback onClickItem;

  ItemReview({
    Key? key,
    required this.detailReviews,
    required this.item,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // item name
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: size_10_w),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text(
                        item.name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                          color: kColor6F6F6F,
                          fontWeight: FontWeight.w500,
                          fontSize: text_18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //item price
            Flexible(
              child: Padding(
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
            ),
          ],
        ),
        //item amuont
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
                //item sale
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

        Padding(
          padding: EdgeInsets.only(right: size_250_w),
          child: Text(
            LocaleKeys.s00041.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kColor6F6F6F,
              fontWeight: FontWeight.w300,
              fontSize: text_18,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: detailReviews.length,
          itemBuilder: (context, index) =>
              Material(
                color: kColorf0eeee,
                child: DetailItemReview(
                  item: detailReviews[index],
                  onClickItem: () => onClickItem,
                ),
              ),
        ),
      ],
    );
  }
}
