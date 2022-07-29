import 'package:business_suite_mobile_pos/app/view/widget_utils/anims/touchable_opacity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../module/common/extension.dart';
import '../../../module/network/response/shops_response.dart';
import '../../../module/res/style.dart';
import '../../widget_utils/bottom_sheet/bottom_sheet_utils.dart';

class ItemShop extends StatelessWidget {
  Shop shop;
  VoidCallback onClickItem;

  ItemShop({
    Key? key,
    required this.shop,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(size_6_w),
      color: Colors.white,
      child: Ink(
        child: InkWell(
          onTap: () => onClickItem.call(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: size_10_w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: size_10_w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                      height: 10.0,
                    ),
                    Card(
                      color: kColor71639E,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size_8_w, vertical: size_6_w),
                          child: Text(
                            'Continue Selling',
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
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Last Closing Date',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'Last Closing Cash',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'Balance',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
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
                              'currency': NumberFormat()
                                  .simpleCurrencySymbol(shop.currencyId?[1]),
                              'money': shop.lastSessionClosingCash
                                      ?.toStringAsFixed(shop.currencyId?[0]) ??
                                  ''
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
