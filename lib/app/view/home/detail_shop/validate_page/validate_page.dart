// ignore_for_file: prefer_const_constructors
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/validate_page/validate_viewmodel.dart';


import 'package:business_suite_mobile_pos/app/view/widget_utils/base_scaffold_safe_area.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../flavors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../di/injection.dart';
import '../../../../module/common/navigator_screen.dart';
import '../../../../module/res/colors.dart';
import '../../../../module/res/dimens.dart';
import '../../../../module/res/text.dart';
import '../../../../viewmodel/base_viewmodel.dart';
import '../appbar_shop.dart';
import '../detail_shop.dart';

class ValidatePage extends PopupInvoicePage<ValidateViewModel> {
  ValidatePage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return ValidateConten(viewModel);
  }
}

class ValidateConten extends StatefulWidget {
  final ValidateViewModel _validateViewModel;

  ValidateConten(this._validateViewModel);

  @override
  State<ValidateConten> createState() => _ValidateContenState();
}

class _ValidateContenState extends State<ValidateConten> {
  ValidateViewModel get validateViewModel => widget._validateViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldSafeArea(
      transparentStatusBar: 0.2,
      backgroundColor: kColorE2E2E2,
      customAppBar: AppBarShop(
        badgeCount: 1,
        avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
        onClickAvatar: ()=> getIt<NavigationService>().signOut(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: kColorE2E2E2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // button new order
            Container(
              color: kColorE2E2E2,
              height: size_80_w,
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.all(size_10_w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius:
                          BorderRadius.circular(size_2_w)),
                      padding: EdgeInsets.symmetric(
                          vertical: size_1_w, horizontal: size_1_w),
                      height: double.infinity,
                      width: size_150_w,
                      child: FlatButton(
                        onPressed: () {
                          getIt<NavigationService>()
                              .pushEnterFadeExitDown(DetailShopPage());
                        },
                        child:  Row(
                          children: [
                            Text(
                              LocaleKeys.new_order.tr(),
                              style: TextStyle(
                                fontSize: text_20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: size_5_w,
                            ),
                            SvgPicture.asset(
                              'assets/icons/ic_angles_right.svg',
                              height: size_18_w,
                              width: size_18_w,
                              color: Colors.white,
                            ),

                          ],
                        ),
                        color: kColor64AF8A,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //line
            Container(
              height: size_1_w,
              color: kColorC8C8C8,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.all(size_16_w) ,
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys
                            .how_would_like_to_receive_your_receipt
                            .tr(),
                        style: TextStyle(
                            color: kColor555555,
                            fontSize: size_25_w),
                      ),
                      SizedBox(
                        height: size_25_w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: kColorD1D1D1,
                            borderRadius: BorderRadius.circular(
                                size_2_w)),
                        padding: EdgeInsets.symmetric(
                            vertical: size_1_w,horizontal: size_1_w
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: size_60_w,
                          child: FlatButton(
                            color: kColorCBCBCB,
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/ic_print.svg',
                                  height: size_15_w,
                                  width: size_15_w,
                                ),
                                SizedBox(
                                  width: size_3_w,
                                ),
                                Text(
                                  LocaleKeys.print_receipt
                                      .tr(),
                                  style: TextStyle(
                                      fontSize: text_20,
                                      color: kColor555555),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size_15_w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: kColorD1D1D1,
                            borderRadius: BorderRadius.circular(
                                size_2_w)),
                        padding: EdgeInsets.symmetric(
                            vertical: size_1_w,horizontal: size_1_w
                        ),
                        child: Container(
                          height: size_60_w,
                          width: double.infinity,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(

                                  cursorHeight: size_25_w,
                                  cursorColor: kColor565656,
                                  decoration: InputDecoration(
                                    enabledBorder:
                                        OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: size_1_w),
                                    ),
                                    focusedBorder:
                                        OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: size_2_w,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(
                                              size_2_w),
                                    ),
                                    hintText: LocaleKeys
                                        .email_receipt
                                        .tr(),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: size_3_w,
                                    bottom: size_3_w,
                                    right: size_3_w),
                                height: double.infinity,
                                width: size_100_w,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: SvgPicture.asset(
                                    'assets/icons/ic_paper_plane.svg',
                                    height: size_15_w,
                                    width: size_15_w,
                                  ),
                                  color: kColorE4E2E2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size_30_w,
                      ),
                      Container(
                        padding: EdgeInsets.all(size_16_w),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/logo.png',
                              ),
                            ),
                            SizedBox(
                              height: size_30_w,
                            ),
                            Column(
                              children: [
                                Text(
                                  LocaleKeys
                                      .my_company_san_francisco
                                      .tr(),
                                  style: TextStyle(
                                      color: kColor555555),
                                ),
                                Text(
                                    LocaleKeys.tel_16505550111
                                        .tr(),
                                    style: TextStyle(
                                        color: kColor555555)),
                                Text('info@yourcompany.com',
                                    style: TextStyle(
                                        color: kColor555555)),
                                Text('http://www.example.com',
                                    style: TextStyle(
                                        color: kColor555555)),
                                Text(
                                    '--------------------------------',
                                    style: TextStyle(
                                        color: kColor555555)),
                                Text(
                                    LocaleKeys
                                        .served_by_mitchell_admin
                                        .tr(),
                                    style: TextStyle(
                                        color: kColor555555)),
                              ],
                            ),
                            SizedBox(
                              height: size_40_w,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        right: size_10_w,
                                        left: size_10_w,
                                        top: size_20_w),
                                    alignment:
                                        Alignment.centerRight,
                                    child: Text(
                                      LocaleKeys.total.tr(),
                                      style: TextStyle(
                                          color: kColor555555,
                                          fontSize: size_25_w),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: size_10_w,left: size_10_w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .end,
                                      children: [
                                        Text(
                                          '--------',
                                          style: TextStyle(
                                              color:
                                                  kColor555555,
                                              fontSize:
                                                  size_20_w),
                                        ),
                                        Text(
                                          '\$ 0.00',
                                          style: TextStyle(
                                              color:
                                                  kColor555555,
                                              fontSize:
                                                  size_20_w),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size_25_w,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: size_10_w),
                                    child: Text(
                                      LocaleKeys.cash.tr(),
                                      style: TextStyle(
                                          color: kColor555555,
                                          fontSize: size_15_w),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: size_10_w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .end,
                                      children: [
                                        Text(
                                          '2.00',
                                          style: TextStyle(
                                            color: kColor555555,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size_25_w,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: size_10_w,
                                        right: size_10_w,
                                        top: size_10_w,
                                        bottom: size_10_w),
                                    alignment:
                                        Alignment.centerRight,
                                    child: Text(
                                      LocaleKeys.change.tr(),
                                      style: TextStyle(
                                          color: kColor555555,
                                          fontSize: size_25_w),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: size_10_w,left: size_10_w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .end,
                                      children: [
                                        Text(
                                          '\$ 2.00',
                                          style: TextStyle(
                                              color:
                                                  kColor555555,
                                              fontSize:
                                                  size_20_w),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size_25_w,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: size_10_w,right: size_10_w),
                                    child: Text(
                                      LocaleKeys.total_taxes
                                          .tr(),
                                      style: TextStyle(
                                          color: kColor555555,
                                          fontSize: size_15_w),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: size_10_w,left: size_10_w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .end,
                                      children: [
                                        Text(
                                          '\$ 0.00',
                                          style: TextStyle(
                                            color: kColor555555,
                                            fontSize: size_15_w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size_25_w,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    LocaleKeys
                                        .order_000040950006
                                        .tr(),
                                    style: TextStyle(
                                        color: kColor555555,
                                        fontWeight:
                                            FontWeight.w400),
                                  ),
                                  Text(
                                    '07/08/2022 14:21:59',
                                    style: TextStyle(
                                        color: kColor555555,
                                        fontWeight:
                                            FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size_30_w,
                            ),
                          ],
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
    );
  }
}
