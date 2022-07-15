// ignore_for_file: prefer_const_constructors

import 'package:business_suite_mobile_pos/app/view/home/order_list/order_list_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/popup_quotation_order_page/popup_percentage.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../di/injection.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';
import '../detail_shop/detail_shop.dart';

void openPopupQuatationOrder() {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return PopupQuotationOrderPage();
      });
}

class PopupQuotationOrderPage extends StatefulWidget {
  PopupQuotationOrderPage({Key? key}) : super(key: key);

  @override
  State<PopupQuotationOrderPage> createState() =>
      _PopupQuotationOrderPageState();
}

class _PopupQuotationOrderPageState extends State<PopupQuotationOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26.withOpacity(0.5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kColorBackground,
              borderRadius: BorderRadius.circular(size_5_w),
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
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: size_15_w),
                      child: Text(
                        LocaleKeys.what_do_you_want_to_do.tr(),
                        style:
                            TextStyle(fontSize: size_18_w, color: kColor555555),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size_20_w,
                ),
                Container(
                  height: size_2_w,
                  color: kColorE6E6E6,
                ),
                SizedBox(
                  height: size_5_w,
                ),
                Material(
                    color: kColorf0eeee,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            getIt<NavigationService>().dimiss();
                            acceptScoreInputDialog();
                          },
                          child: Container(
                            // color: Colors.,
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: size_15_w,
                                left: size_10_w,
                                bottom: size_15_w,
                              ),
                              child: Text(
                                LocaleKeys.apply_a_down_payment.tr(),
                                style: TextStyle(color: kColor555555),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            getIt<NavigationService>().dimiss();
                           // getIt<NavigationService>().pu(DetailShopPage());
                          },
                          child: Container(
                            color: kColorE6E6E6,
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(
                                  top: size_15_w,
                                  left: size_10_w,
                                  bottom: size_15_w,
                                ),
                                child: Text(LocaleKeys.settle_the_order.tr(),
                                    style: TextStyle(color: kColor555555))),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: size_10_w,
                ),
                Padding(
                  padding: EdgeInsets.only(right: size_10_w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(size_2_w)),
                        padding: EdgeInsets.symmetric(
                            horizontal: size_10_w, vertical: size_3_w),
                        child: Container(
                          height: size_40_w,
                          width: size_100_w,
                          child: FlatButton(
                            onPressed: () {
                              getIt<NavigationService>().dimiss();
                            },
                            child: Text(
                              LocaleKeys.cancel.tr(),
                              style: TextStyle(
                                fontSize: text_16,
                                color: kColor555555,
                              ),
                            ),
                            color: kColorE4E2E2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size_10_w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
