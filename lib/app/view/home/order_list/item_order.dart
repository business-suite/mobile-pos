import 'package:business_suite_mobile_pos/app/model/order.dart';
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ItemOrder extends StatelessWidget {
  Order item;
  VoidCallback onClickItem;

  ItemOrder({
    Key? key,
    required this.item,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:  EdgeInsets.only(left: size_10_w,right: size_10_w),
        child: Column(
          children: [
            //order
            Padding(
              padding: EdgeInsets.only(top:size_10_w),
              // Oder-item name
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: size_5_w,),
                    child: Text(
                      LocaleKeys.order.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kColor666666,
                        fontSize: text_15,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:kColor6F6F6F,
                      fontWeight: FontWeight.w400,
                      fontSize: text_15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size_5_w,),
            //Date - item date
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: size_5_w,),
                  child: Text(
                  LocaleKeys.product_date.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kColor666666,
                      fontSize: text_15,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  item.date,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontWeight: FontWeight.w400,
                    fontSize: text_15,
                  ),
                ),
              ],
            ),
            SizedBox(height: size_5_w,),
            //Customer - item customer
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: size_5_w,),
                  child: Text(
                  LocaleKeys.customer.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kColor666666,
                      fontSize: text_15,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  item.customer,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontSize: text_15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: size_5_w,),
            //Salesman -  item salesMan
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: size_5_w,),
                  child: Text(
                    LocaleKeys.salesman.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kColor666666,
                      fontSize: text_15,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  item.salesMan,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontSize: text_15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: size_5_w,),
            //Total
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: size_5_w,),
                  child: Text(
                    LocaleKeys.total_item_order.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kColor666666,
                      fontSize: text_15,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  item.total,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontSize: text_15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: size_5_w,),
            //State
            Padding(
              padding: EdgeInsets.only(bottom: size_10_w),
              child: Row(
                children: [
                  Text(
                    LocaleKeys.state.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kColor666666,
                      fontSize: text_15,
                    ),
                  ),
                  Spacer(),
                  Text(
                    item.state,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kColor6F6F6F,
                      fontSize: text_15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
