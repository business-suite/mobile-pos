import 'package:business_suite_mobile_pos/app/view/widget_utils/anims/touchable_opacity.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/custom_card.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../module/network/response/products_response.dart';
import '../../../module/network/response/shops_response.dart';
import '../../../module/res/style.dart';
import '../../widget_utils/bottom_gradient_black_to_white.dart';
import '../../widget_utils/custom/image_holder.dart';

class ItemProduct extends StatelessWidget {
  Product product;
  Shop? shop;
  VoidCallback onClickItem;

  ItemProduct({Key? key, required this.product,required this.onClickItem, required this.shop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberFormat =  NumberFormat.currency(symbol: NumberFormat().simpleCurrencySymbol(shop?.currencyId?[1]), decimalDigits: 2);
    return TouchableOpacity(
      onPressed: () => onClickItem.call(),
      child: CustomCard(
        borderRadiusValue: size_4_r,
        backgroundColor: Colors.white,
        shadow: Shadow.none,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(size_4_r)),
                clipBehavior: Clip.hardEdge,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder.jpg',
                  image: product.getImageProduct(),
                  fit: BoxFit.fitHeight,
                  width: size_150_w,
                  height: size_150_w,
                  fadeInDuration: Duration(milliseconds: 50),
                  //ERROR IMAGE WHEN LOAD IMAGE
                  imageErrorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return ImageHolder(
                      asset: 'assets/images/placeholder.jpg',
                      width: size_150_w,
                      height: size_150_w,
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 10,
              child: BottomGradient(offset: 0.96),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size_4_w, vertical: size_4_w),
                      child: Text(
                          product.display_name?.replaceAll('[${product.default_code}]', '').trim() ?? '',
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: text_14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size_4_w,
              right: size_4_w,
              child: Container(
                decoration: BoxDecoration(
                    color: kColor7F82AC,
                    borderRadius: BorderRadius.circular(size_2_r)),
                padding: EdgeInsets.symmetric(
                    horizontal: size_3_w, vertical: size_2_w),
                child: Text(
                    //numberFormat.format(product.lst_price)
                    LocaleKeys.product_price.tr(namedArgs: {
                    'money': product.lst_price
                        ?.toStringAsFixed(2) ??
                    '',
                      'currency': NumberFormat()
                          .simpleCurrencySymbol(shop?.currencyId?[1])
                    }),
                    style: TextStyle(
                        fontSize: text_12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            Positioned(
              top: size_4_w,
              left: size_4_w,
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: size_18_w,
                  height: size_18_w,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size_2_r),
                    color: kColor7F82AC,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: size_3_w),
                  child: SvgPicture.asset(
                    'assets/icons/ic_circle_info.svg',
                    color: kCWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
