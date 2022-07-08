// ignore_for_file: prefer_const_constructors

import 'package:business_suite_mobile_pos/app/view/widget_utils/base_scaffold_safe_area.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../flavors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../module/res/colors.dart';
import '../../../../module/res/dimens.dart';
import '../../../../module/res/text.dart';
import '../appbar_shop.dart';

class ValidatePage extends StatefulWidget {
  const ValidatePage({Key? key}) : super(key: key);

  @override
  State<ValidatePage> createState() => _ValidatePageState();
}

class _ValidatePageState extends State<ValidatePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldSafeArea(
        backgroundColor: kColorf0eeee,
        customAppBar: AppBarShop(
          badgeCount: 1,
          avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: kColorA8A8A8,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: kColorA8A8A8,
                    height: size_80_w,
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.only(right: size_20_w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(size_4_w)),
                            padding: EdgeInsets.symmetric(
                                horizontal: size_1_w, vertical: size_1_w),
                            child: Container(
                              height: size_45_w,
                              width: size_160_w,
                              color: kColor64AF8A,
                              child: Row(
                                children: [
                                  FlatButton(
                                    onPressed: () {},
                                    child: Text(
                                      LocaleKeys.new_order.tr(),
                                      style: TextStyle(
                                        fontSize: text_22,
                                        color: kColorf0eeee,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: size_10_w),
                                    child: SvgPicture.asset(
                                      'assets/icons/ic_angles_right.svg',
                                      height: size_18_w,
                                      width: size_18_w,
                                      color: kColorf0eeee,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: size_1_w,
                    color: kColor39393A,
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(size_15_w, size_15_w, size_12_w, 0),
                      child: Text(
                        LocaleKeys.how_would_like_to_receive_your_receipt.tr(),
                        style: TextStyle(
                          color: kColor555555,
                          fontSize: size_25_w
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size_25_w,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: size_10_w,left: size_10_w,),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                            BorderRadius.circular(size_4_w)),
                        padding: EdgeInsets.symmetric(vertical: size_1_w),
                        child: SizedBox(
                          width: double.infinity,
                          height: size_60_w,
                          child: FlatButton(
                            onPressed: () {},
                            child: Center(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/ic_print.svg',height: size_15_w,width: size_15_w,),
                                  SizedBox(
                                    width: size_3_w,
                                  ),
                                  Text(
                                    LocaleKeys.print_receipt.tr(),
                                    style: TextStyle(
                                        fontSize: text_20,
                                        color: kColor555555),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size_15_w,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: size_10_w,left: size_10_w,),
                      height: size_60_w,
                      child: Material(
                        color: kColorf0eeee,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                cursorHeight: size_25_w,
                                cursorColor: kColor565656,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: kColorf0eeee, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: kColorf0eeee, width: size_2_w,),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(size_6_r),
                                  ),
                                  hintText: LocaleKeys.email_receipt.tr(),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: size_3_w,bottom: size_3_w,right: size_3_w),
                             height: double.infinity,
                              width: size_100_w,
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  LocaleKeys.cancel.tr(),
                                  style: TextStyle(
                                    fontSize: text_12,
                                    color: kColor555555,
                                  ),
                                ),
                                color: kColorE4E2E2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
