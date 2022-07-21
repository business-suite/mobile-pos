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

void OpenPopupErrorSesionPage() {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return PopupErrorSesionPage();
      });
}

class PopupErrorSesionPage extends StatefulWidget {
  PopupErrorSesionPage({Key? key}) : super(key: key);

  @override
  State<PopupErrorSesionPage> createState() => _PopupErrorSesionPageState();
}

class _PopupErrorSesionPageState extends State<PopupErrorSesionPage> {
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

                  color: kColorFF4C4C.withOpacity(0.5),
                  child: Padding(
                    padding:
                        EdgeInsets.all(size_15_w),
                    child: Text(

                      LocaleKeys.error_finalized_order_cannot_be_modified
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
                  height: size_100_w,
                  padding: EdgeInsets.all(size_10_w),
                  child: Text(
                    LocaleKeys.error_finalized_order_cannot_be_modified.tr(),
                    style: TextStyle(
                        color: kColorA85959,
                        fontSize: size_16_w,
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
                  height: size_15_h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size_15_w,right: size_10_w),
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
                          width: size_50_w,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(size_1_w)),
                          padding: EdgeInsets.symmetric(
                              horizontal: size_1_w, vertical: size_1_w),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child:  SvgPicture.asset(
                              'assets/icons/ic_paper_plane.svg',
                              height: size_14_w,
                              width: size_14_w,
                              color: kColorA85959,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size_5_w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: kColor3C3C3C.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(size_4_w)),
                        padding: EdgeInsets.symmetric(
                            horizontal: size_1_w, vertical: size_1_w),
                        child: Container(
                          height: size_50_w,
                          width: size_50_w,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(size_1_w)),
                          padding: EdgeInsets.symmetric(
                              horizontal: size_1_w, vertical: size_1_w),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child:  SvgPicture.asset(
                              'assets/icons/ic_download.svg',
                              height: size_14_w,
                              width: size_14_w,
                              color: kColor555555,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size_5_w,
                      ),
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
