import 'package:business_suite_mobile_pos/app/view/home/detail_shop/cash_in_out_shop/cash_in_out_page.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/image_holder.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../module/res/style.dart';

class AppBarShop extends StatelessWidget implements PreferredSizeWidget {
  final Widget? iconLeft, iconRight;
  final bool enableCopyPaste;
  final int badgeCount;
  final String avatarUrl;
  final Function? leftIconOnPress;
  final Function? rightIconOnPress;

  AppBarShop({
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
        color: kColor875a7b,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size_14_w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_money.svg',
                    width: size_16_w,
                    height: size_16_w,
                    color: kCWhite,
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: size_10_w),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CashInOutPage()));
                      },
                      child: Text(
                        LocaleKeys.cash_in_out.tr(),
                        style: TextStyle(
                            fontSize: text_18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                height: double.infinity,
                child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      RotationTransition(
                        turns: AlwaysStoppedAnimation(-45 / 360),
                        child: Padding(
                          padding: EdgeInsets.only(right: size_10_w, bottom: size_10_w),
                          child: SvgPicture.asset(
                            'assets/icons/ic_ticket.svg',
                            width: size_16_w,
                            height: size_16_w,
                            color: kCWhite,
                          ),
                        ),
                      ),
                      if (badgeCount > 0)
                        Positioned(
                          // draw a red marble
                          top: size_10_w,
                          right: size_2_w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: kColor01A09D,
                              borderRadius: BorderRadius.circular(size_10_r),
                            ),
                            child: Text(
                              badgeCount.toString(),
                              style: TextStyle(
                                  fontSize: text_12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        )
                      else
                        Container()
                    ]),
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              SvgPicture.asset(
                'assets/icons/ic_wifi.svg',
                width: size_16_w,
                height: size_16_w,
                color: kColor5EB937,
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
