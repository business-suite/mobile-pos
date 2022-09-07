import 'package:business_suite_mobile_pos/app/model/review_oder.dart';
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../model/detail_review_oder.dart';
import '../../../../module/network/response/products_response.dart';
import '../../../../module/network/response/shops_response.dart';
import '../../../widget_utils/anims/touchable_opacity.dart';
import '../../../widget_utils/custom/custom_card.dart';
import 'detail_item_review_customer.dart';

class ItemReviewProduct extends StatelessWidget {
  Product item;
  VoidCallback onClickItem;
  bool isSelected = false;
  Shop? shop;

  ItemReviewProduct({
    Key? key,
    required this.item,
    required this.onClickItem,
    required this.isSelected,
    required  this.shop
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onPressed: () => onClickItem.call(),
      child: CustomCard(
        borderRadiusValue: size_4_r,
        backgroundColor: isSelected ? kColorD1D1D1 : Colors.white,
        shadow: Shadow.none,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size_10_w, vertical: size_6_w),
          width: double.infinity,
          child: Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // item name
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text(
                              item.display_name?.replaceAll('[${item.default_code}]', '').trim() ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(
                                color: kCBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: text_15,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //item amuont
                      Padding(
                        padding: EdgeInsets.only(left: size_14_w, top: size_4_w),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              text: LocaleKeys.units_prices.tr(namedArgs: {
                                'quantity': item.quantity.toStringAsFixed(2)
                              }),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: kCBlack,
                                fontSize: text_13,
                              ),
                              //item sale
                              children: [
                                TextSpan(
                                  text: LocaleKeys.at.tr(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: kColor6F6F6F,
                                    fontSize: text_13,
                                  ),
                                ),
                                TextSpan(
                                  text: LocaleKeys.product_price_units.tr(namedArgs: {
                                    'money': item.lst_price?.toStringAsFixed(2) ?? '0.0',
                                    'currency': NumberFormat()
                                        .simpleCurrencySymbol(shop?.currencyId?[1])
                                  }),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: kColor6F6F6F,
                                    fontSize: text_13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: size_10_w,),
                //item price
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      LocaleKeys.product_price.tr(namedArgs: {
                        'money': item.getTotalPrice().toStringAsFixed(2),
                        'currency': NumberFormat()
                            .simpleCurrencySymbol(shop?.currencyId?[1])
                      }),
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      style: TextStyle(
                        color: kCBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: text_15,
                      ),
                    ),
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
