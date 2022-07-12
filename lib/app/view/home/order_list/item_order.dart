import 'package:business_suite_mobile_pos/app/model/order.dart';
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/custom_card.dart';
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
                  Text(
                    'Order',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kColor555555,
                      fontSize: text_20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kColor555555,
                      fontSize: text_20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size_5_w,),
            //Date - item date
            Row(
              children: [
                Text(
                  'Date',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor555555,
                    fontSize: text_20,
                  ),
                ),
                Spacer(),
                Text(
                  item.date,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor555555,
                    fontSize: text_20,
                  ),
                ),
              ],
            ),
            SizedBox(height: size_5_w,),
            //Customer - item customer
            Row(
              children: [
                Text(
                  'Customer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor555555,
                    fontSize: text_20,
                  ),
                ),
                Spacer(),
                Text(
                  item.customer,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor555555,
                    fontSize: text_20,
                  ),
                ),
              ],
            ),
            SizedBox(height: size_5_w,),
            //Salesman -  item salesMan
            Row(
              children: [
                Text(
                  'Salesman',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor555555,
                    fontSize: text_20,
                  ),
                ),
                Spacer(),
                Text(
                  item.salesMan,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor555555,
                    fontSize: text_20,
                  ),
                ),
              ],
            ),
            SizedBox(height: size_5_w,),
            //Total
            Row(
              children: [
                Text(
                  'Total',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor555555,
                    fontSize: text_20,
                  ),
                ),
                Spacer(),
                Text(
                  item.total,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor555555,
                    fontSize: text_20,
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
                    'State',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kColor555555,
                      fontSize: text_20,
                    ),
                  ),
                  Spacer(),
                  Text(
                    item.state,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kColor555555,
                      fontSize: text_20,
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
