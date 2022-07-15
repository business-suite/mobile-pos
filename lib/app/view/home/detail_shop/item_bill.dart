import 'package:business_suite_mobile_pos/app/model/bill.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/popup_bill.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';

class ItemBill extends StatelessWidget {
  Bill item;
  VoidCallback onClickItem;

  ItemBill({
    Key? key,
    required this.item,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          //order
          Padding(
            padding: EdgeInsets.only(
              top: size_10_w,
              left: size_5_w,
              right: size_5_w,
            ),
            // Oder-item name
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: size_5_w,
                  ),
                  child: Text(
                    LocaleKeys.product_date.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kColor666666,
                      fontSize: text_12,
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
                    fontSize: text_12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size_5_w,
          ),
          //Date - item date
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: size_5_w,
                  left: size_5_w,
                  right: size_5_w,
                ),
                child: Text(
                  LocaleKeys.receipt.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor666666,
                    fontSize: text_12,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  left: size_5_w,
                  right: size_5_w,
                ),
                child: Text(
                  item.receipt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontWeight: FontWeight.w400,
                    fontSize: text_12,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size_5_w,
          ),
          //Customer - item customer
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: size_5_w,
                  left: size_5_w,
                  right: size_5_w,
                ),
                child: Text(
                  LocaleKeys.number.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor666666,
                    fontSize: text_12,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  left: size_5_w,
                  right: size_5_w,
                ),
                child: Text(
                  item.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontSize: text_12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size_5_w,
          ),
          //Salesman -  item salesMan
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: size_5_w,
                  left: size_5_w,
                  right: size_5_w,
                ),
                child: Text(
                  LocaleKeys.customer.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor666666,
                    fontSize: text_12,
                  ),
                ),
              ),
              Spacer(),
              Text(
                item.customer,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kColor6F6F6F,
                  fontSize: text_12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: size_5_w,
          ),
          //Total
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: size_5_w,
                  left: size_5_w,
                  right: size_5_w,
                ),
                child: Text(
                  LocaleKeys.employee.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor666666,
                    fontSize: text_12,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: size_5_w),
                child: Text(
                  item.employee,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontSize: text_12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size_5_w,
          ),
          //State
          Padding(
            padding: EdgeInsets.only(
              bottom: size_10_w,
              left: size_5_w,
              right: size_5_w,
            ),
            child: Row(
              children: [
                Text(
                  LocaleKeys.total.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor666666,
                    fontSize: text_12,
                  ),
                ),
                Spacer(),
                Text(
                  item.total,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontSize: text_12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: size_10_w,
              left: size_5_w,
              right: size_5_w,
            ),
            child: Row(
              children: [
                Text(
                  LocaleKeys.status.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor666666,
                    fontSize: text_12,
                  ),
                ),
                Spacer(),
                Text(
                  item.status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontSize: text_12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          InkWell(
            onTap: (){
              openPopupBillRemove();
            },
            child: Container(
              height: size_30_w,
              width: double.infinity,
              color: kColord23f3a,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size_5_w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_trash.svg',
                          height: size_14_w,
                          width: size_14_w,
                          color: kColorBackground,
                        ),
                        SizedBox(
                          width: size_2_w,
                        ),
                        Text(
                          LocaleKeys.delete.tr(),
                          style: TextStyle(
                          color: kColorBackground,
                          fontSize: size_14_w,
                          fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
