import 'package:business_suite_mobile_pos/app/view/home/detail_shop/cash_in_out_shop/cash_in_out_page.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/image_holder.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../di/injection.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/style.dart';

class AppBarShopList extends StatelessWidget implements PreferredSizeWidget {
  final Widget? iconLeft, iconRight;
  final bool enableCopyPaste;
  final int badgeCount;
  final String avatarUrl;
  final Function? leftIconOnPress;
  final Function? rightIconOnPress;

  AppBarShopList({
    Key? key,
    this.iconLeft,
    this.iconRight,
    this.enableCopyPaste = false,
    this.leftIconOnPress,
    this.rightIconOnPress,
    this.badgeCount = 0,  this.avatarUrl = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      child: Container(
        height: appBarSize,
        width: double.infinity,
        color: kColor71639E,
        child: Padding(
          padding: EdgeInsets.only(right: size_14_w, ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.window),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'Point of Sale',
                      style: TextStyle(color: Colors.white, fontSize: text_16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(color: Colors.white, fontSize: text_10),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'Orders',
                      style: TextStyle(color: Colors.white, fontSize: text_10),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'Products',
                      style: TextStyle(color: Colors.white, fontSize: text_10),
                    ),
                  ),
                ],
              ),


              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
                clipBehavior: Clip.hardEdge,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder_character.png',
                  image: avatarUrl,
                  fit: BoxFit.cover,
                  width: size_30_w,
                  height: size_30_w,
                  fadeInDuration: Duration(milliseconds: 50),
                  //ERROR IMAGE WHEN LOAD IMAGE
                  imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return ImageHolder(
                      asset: 'assets/images/placeholder_character.png',
                      width: size_30_w,
                      height: size_30_w,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150.0);
}
