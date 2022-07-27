// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:business_suite_mobile_pos/app/view/home/coins_bills/popup_coins_bills.dart';
import 'package:business_suite_mobile_pos/app/view/home/opening_cash_control/opening_cash_viewmodel.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:business_suite_mobile_pos/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../di/injection.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/event_bus/event_bus.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';
import '../../../viewmodel/base_viewmodel.dart';

void PopupPercentageDialog() {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return PopupOpeningCashControl();
      });
}

class PopupOpeningCashControl extends PageProvideNode<OpeningCashViewModel> {
  PopupOpeningCashControl({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return PopupOpeningCashControlContent(viewModel);
  }
}

class PopupOpeningCashControlContent extends StatefulWidget {
  final OpeningCashViewModel _openingCashViewModel;

  PopupOpeningCashControlContent(this._openingCashViewModel);

  @override
  State<PopupOpeningCashControlContent> createState() => _PopupOpeningCashControlContentState();
}

class _PopupOpeningCashControlContentState extends State<PopupOpeningCashControlContent> {

  OpeningCashViewModel get openingCashViewModel => widget._openingCashViewModel;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26.withOpacity(0.5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kColorf0eeee,
              borderRadius: BorderRadius.circular(size_2_w),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: size_25_w,
            ),
            padding: EdgeInsets.symmetric(
              vertical: size_1_w,
              horizontal: size_1_w,
            ),
            child: Column(
              children: [
                Container(
                  color: kWhite.withOpacity(0.5),
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: size_20_w, bottom: size_20_w),
                      child: Text(
                        LocaleKeys.opening_cash_control.tr(),
                        style:
                            TextStyle(fontSize: size_18_w, color: kColor555555),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size_15_h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: size_10_w,right: size_10_w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text('Opening cash',style: TextStyle(
                              color: kColor555555,fontWeight: FontWeight.bold,fontSize: size_16_w
                            ),),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              cursorColor: kColor808080,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '0',
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size_10_w,
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(size_1_w)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size_1_w, vertical: size_1_w),
                                    child: Container(
                                      height: size_45_w,
                                      width: size_45_w,
                                      child: FlatButton(
                                        onPressed: () {
                                          OpenPopupClosingControl();
                                        },
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_calculator.svg',
                                          height: size_26_w,
                                          width: size_26_w,
                                          color: kColor555555,
                                        ),
                                        color: kColorE4E2E2,
                                      ),
                                    ),
                                  ),
                                  Text('')
                                ],
                              )
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size_30_h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(size_3_w)),
                        padding: EdgeInsets.symmetric(
                            horizontal: size_1_w, vertical: size_1_w),
                        child: Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                          child: TextFormField(
                            cursorHeight: size_20_w,
                            autofocus: true,
                            cursorColor: kColor808080,
                            //  minLines: 1,
                            maxLines: 5,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kColor64AF8A, width: size_3_w),
                                ),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: 'Notes'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size_20_h,
                      ),
                      Container(
                        height: size_1_w,
                        color: kColorCACACA,
                      ),
                      SizedBox(
                        height: size_10_h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: size_15_w),
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
                                    LocaleKeys.open_session.tr(),
                                    style: TextStyle(
                                      fontSize: text_14,
                                      color: kColor555555,
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
