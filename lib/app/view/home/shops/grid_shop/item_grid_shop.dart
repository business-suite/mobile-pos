import 'package:business_suite_mobile_pos/app/view/widget_utils/anims/touchable_opacity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../../module/common/extension.dart';
import '../../../../module/network/response/shops_response.dart';
import '../../../../module/res/style.dart';
import '../../../widget_utils/bottom_sheet/bottom_sheet_utils.dart';

class ItemGridShop extends StatelessWidget {
  Shop shop;
  VoidCallback onClickItem;

  ItemGridShop({
    Key? key,
    required this.shop,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left:size_8_w, right: size_8_w, top: size_8_w),
      color: Colors.white,
      child: Ink(
        child: InkWell(
          onTap: () => onClickItem.call(),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: size_1_w,
                color: kColorDEE2E6,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: size_10_w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: size_10_w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        child: Text(
                          shop.name ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        height: size_24_w,
                        child: TouchableOpacity(
                          onPressed: () =>
                              ButtomSheetUtils.bottomSheetActionShops(context,
                                  onViewOrders: () {},
                                  onViewSessions: () {},
                                  onReportingOrders: () {},
                                  onSettings: () {}),
                          child: Icon(
                            Icons.more_vert,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (shop.getPosSessionState().isNotEmpty)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: size_10_w, right: size_10_w, bottom: size_10_w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size_2_r),
                        color: shop.getColorPosSessionState(),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size_4_w, vertical: size_2_w),
                        child: Text(
                          shop.getPosSessionState(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: text_11,
                          ),
                        ),
                      ),
                    ),
                  ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size_10_w),
                  child: Row(
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.zero,
                        elevation: 0.0,
                        color: kColor71639E,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size_8_w, vertical: size_6_w),
                            child: Text(
                              shop.getCurrentSessionState(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: text_11,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 10.0,
                        height: 10.0,
                      ),
                      if( dateTimeFromString(shop.lastSessionClosingDate).isNotEmpty)
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                LocaleKeys.last_closing_date.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kColorTextNormal,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                LocaleKeys.last_closing_cash.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kColorTextNormal,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                LocaleKeys.balance.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kColorTextNormal,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                        height: 10.0,
                      ),
                      if( dateTimeFromString(shop.lastSessionClosingDate).isNotEmpty)
                      Column(
                        children: <Widget>[
                          Text(
                            dateTimeFromString(shop.lastSessionClosingDate),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 23),
                            child: Text(
                              LocaleKeys.product_price.tr(namedArgs: {
                              'money': shop.lastSessionClosingCash
                                  ?.toStringAsFixed(2) ??
                              '',
                                'currency': NumberFormat()
                                    .simpleCurrencySymbol(shop.currencyId?[1]),

                              }),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Text(
                            '',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
