// ignore_for_file: prefer_const_constructors

import 'package:business_suite_mobile_pos/app/module/event_bus/event_bus.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/order_list_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/popup_quotation_order_page/popup_percentage.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../main.dart';
import '../../../di/injection.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';
import '../detail_shop/detail_shop.dart';

void OpenPopupEmptyOrder() {
  BuildContext context =
  getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return PopupEmptyOrder();
      });
}

class PopupEmptyOrder extends StatefulWidget {
  PopupEmptyOrder({Key? key}) : super(key: key);

  @override
  State<PopupEmptyOrder> createState() => _PopupEmptyOrderState();
}

class _PopupEmptyOrderState extends State<PopupEmptyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26.withOpacity(0.5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kColorF3BBBB,
              borderRadius: BorderRadius.circular(size_2_w),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: size_1_w,
            ),
            padding: EdgeInsets.symmetric(
              vertical: size_1_w,
              horizontal: size_1_w,
            ),
            child: Column(
              children: [
                Container(
                  width:double.infinity,
                  color: kColorFF4C4C.withOpacity(0.5),
                  child: Padding(
                    padding:
                    EdgeInsets.all(size_15_w),
                    child: Text(

                      LocaleKeys.empty_order
                          .tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size_22_w,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.topLeft,

                  padding: EdgeInsets.all(size_15_w),
                  child: Text(
                    LocaleKeys.there_must_be_at_least_one_product_in_your_order_before_it_can_be_validated_and_invoiced.tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kColorA85959,
                        fontSize: size_20_w,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: size_15_h,
                ),
                Container(
                  height: size_1_w,
                  color: kColor755555,
                ),
                SizedBox(
                  height: size_10_h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size_10_w,right: size_10_w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: kColor3C3C3C.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(size_4_w)),
                        padding: EdgeInsets.symmetric(
                            horizontal: size_1_w, vertical: size_1_w),
                        child: Container(
                          height: size_50_w,
                          width: size_120_w,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(size_1_w)),
                          padding: EdgeInsets.symmetric(
                              horizontal: size_1_w, vertical: size_1_w),
                          child: FlatButton(
                            onPressed: () {
                              getIt<NavigationService>().dimiss();
                            },
                            child: Text(
                              LocaleKeys.dialog_ok.tr(),
                              style: TextStyle(
                                fontSize: text_12,
                                color: kColorA85959,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
