import 'package:business_suite_mobile_pos/app/model/customer_phone.dart';
import 'package:business_suite_mobile_pos/app/model/order.dart';
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/custom_card.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../model/customer.dart';

class ItemPhoneCustomer extends StatelessWidget {
  CustomerPhone itemphone;
  VoidCallback onClickItem;

  ItemPhoneCustomer({
    Key? key,
    required this.itemphone,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: size_15_w, right: size_15_w, bottom: size_10_w),
      child: Column(
        children: [
          //name
          Padding(
            padding: EdgeInsets.only(top: size_10_w),
            child: Row(
              children: [
                Text(
                  LocaleKeys.name_phone.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor666666,
                    fontSize: text_15,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size_5_w),
                  child: Text(
                    itemphone.name,
                    style: TextStyle(
                      color: kColor6F6F6F,
                      fontWeight: FontWeight.w400,
                      fontSize: text_15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size_5_w,
          ),
          RichText(
            softWrap: true,
            overflow: TextOverflow.clip,
            maxLines: null,
            text: TextSpan(
              text: LocaleKeys.address_phone.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: kColor666666,
                fontSize: text_15,
              ),
              children: [
                TextSpan(
                  text: itemphone.address,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: kColor6F6F6F,
                    fontSize: text_15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size_5_w,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.phone_phone.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kColor666666,
                  fontSize: text_15,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size_5_w),
                child: Text(
                  itemphone.phone,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontWeight: FontWeight.w400,
                    fontSize: text_15,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size_5_w,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.email_phone.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kColor666666,
                  fontSize: text_15,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size_5_w),
                child: Text(
                  itemphone.email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontWeight: FontWeight.w400,
                    fontSize: text_15,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size_5_w,
          ),
          //zip
          Row(
            children: [
              Text(
                LocaleKeys.zip_phone.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kColor666666,
                  fontSize: text_15,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size_5_w),
                child: Text(
                  itemphone.date,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kColor6F6F6F,
                    fontWeight: FontWeight.w400,
                    fontSize: text_15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
