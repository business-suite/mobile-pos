// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:business_suite_mobile_pos/app/module/res/dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../di/injection.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/style.dart';
import '../coins_bills/popup_coins_bills.dart';

void closingControlBottomSheet(
    {VoidCallback? onCloseClick, double statusBarHeight = 0.0}) {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(size_20_w))),
    context: context,
    backgroundColor: transparent,
    isScrollControlled: true,
    builder: (BuildContext builderContext) {
      return ClosingControlBottomSheet(
        statusBarHeight: statusBarHeight,
      );
    },
  );
}

class ClosingControlBottomSheet extends StatefulWidget {
  double statusBarHeight = 0.0;

  ClosingControlBottomSheet({this.statusBarHeight = 0.0});

  @override
  State<ClosingControlBottomSheet> createState() =>
      _ClosingControlBottomSheetState();
}

class _ClosingControlBottomSheetState extends State<ClosingControlBottomSheet> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    var paddingTop = widget.statusBarHeight == 0.0
        ? appBarSize * 2
        : appBarSize + widget.statusBarHeight;
    return SafeArea(
      child: Container(
         margin: EdgeInsets.only(top: paddingTop),
        color: kColorf0eeee,
        child: Column(
          children: [
            Container(
              color: kWhite.withOpacity(0.5),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: size_20_w, bottom: size_20_w),
                  child: Text(
                    LocaleKeys.closing_control.tr(),
                    style: TextStyle(
                        fontSize: size_18_w,
                        color: kColor555555,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: size_10_w,
                          right: size_10_w,
                          top: size_10_w,
                          bottom: size_80_w),
                      child: Column(
                        children: [
                          //total 35 orders
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total 35 orders',
                                      style: TextStyle(
                                          color: kColor555555,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: size_5_w,
                                    ),
                                    Text('Payments',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal)),
                                    SizedBox(
                                      height: size_5_w,
                                    ),
                                    Text('Customer Account',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Text('\$ 125890085.40',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal)),
                                    SizedBox(
                                      height: size_5_w,
                                    ),
                                    Text('\$ 125890085.40',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal)),
                                    SizedBox(
                                      height: size_5_w,
                                    ),
                                    Text('\$ 125890085.40',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size_20_w,
                          ),

                          Container(
                            height: size_120_w,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Payment Method',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: size_10_w,
                                    ),
                                    Text('Cash',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal)),
                                    SizedBox(
                                      height: size_5_w,
                                    ),
                                    Row(
                                      children: [
                                        Text('|'),
                                        Text('Opening',
                                            style: TextStyle(
                                                color: kColor555555,
                                                fontWeight: FontWeight.normal))
                                      ],
                                    ),
                                    SizedBox(
                                      height: size_5_w,
                                    ),
                                    Text('Bank',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal)),
                                    SizedBox(
                                      height: size_5_w,
                                    ),
                                    Text('Customer Account',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                                SizedBox(
                                  width: size_30_w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Expected',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: size_10_w,
                                    ),
                                    Text('\$ 0.00',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal)),
                                    SizedBox(
                                      height: size_5_w,
                                    ),
                                    Text('\$ 0.00',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal)),
                                    SizedBox(
                                      height: size_5_w,
                                    ),
                                    Text('\$ 0.00',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal)),
                                    SizedBox(
                                      height: size_5_w,
                                    ),
                                    Text('\$ 0.00',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                                SizedBox(
                                  width: size_30_w,
                                ),
                                Column(
                                  children: [
                                    Text('Counted',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: size_10_w,
                                    ),
                                    Container(
                                      width: 70,
                                      height: 30,
                                      child: TextField(
                                        cursorColor: kColor808080,
                                        maxLines: 1,
                                        textInputAction:
                                            TextInputAction.newline,
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          filled: true,
                                          border: InputBorder.none,
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.blue.shade900,
                                              width: size_1_w,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(

                                            borderSide: BorderSide(
                                              color: kColor555555.withOpacity(0.5)
                                            ),
                                          ),
                                          // border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: size_20_w,
                                ),
                                Column(
                                  children: [
                                    Text('',),
                                    SizedBox(
                                      height: size_5_w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: kColorE0E0E0,
                                          borderRadius: BorderRadius.circular(size_1_w)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size_7_w, vertical: size_5_w),
                                      child: Container(
                                        height: size_22_w,
                                        width: size_22_w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(size_1_w)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size_1_w, vertical: size_1_w),
                                        child: InkWell(
                                          onTap: (){
                                            OpenPopupClosingControl();
                                          },
                                          child: SvgPicture.asset(
                                            'assets/icons/ic_calculator.svg',
                                            height: size_12_w,
                                            width: size_12_w,
                                            color: kColor555555,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: size_10_w,
                                ),
                                Column(
                                  children: [
                                    Text('Difference',
                                        style: TextStyle(
                                            color: kColor555555,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: size_10_w,
                                    ),
                                    Text('\$ 7.00',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size_20_w,
                          ),
                          Material(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                            child: TextFormField(
                              cursorHeight: size_25_w,
                              autofocus: true,
                              cursorColor: kColor808080,
                              //  minLines: 1,
                              maxLines: 3,
                              textInputAction: TextInputAction.newline,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kColor64AF8A, width: size_2_w),
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: 'Notes'),
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: this.value,
                                onChanged: (value) {
                                  setState(() {
                                    this.value = value!;
                                  });
                                },
                              ),
                              Flexible(
                                child: Text(
                                  'Accept payments difference and post a profit/loss journal entry',
                                  style: TextStyle(
                                      color: kColor555555,
                                      fontWeight: FontWeight.normal),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Wrap(
                      children: [
                        Container(
                          height: size_1_w,
                          color: kColorCACACA,
                        ),
                        Container(
                          color: kColorf0eeee,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: size_160_w,
                                    height: size_60_w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size_10_w,
                                        vertical: size_10_w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: size_1_w,
                                          color: kColorBFBFBF,
                                        ),
                                      ),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(),
                                        color: Colors.black.withOpacity(0.05),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          LocaleKeys.close_session.tr(),
                                          style: TextStyle(
                                              fontSize: text_12,
                                              color: kColor555555,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: size_160_w,
                                    height: size_60_w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size_10_w,
                                        vertical: size_10_w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: size_1_w,
                                          color: kColorBFBFBF,
                                        ),
                                      ),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(),
                                        color: Colors.black.withOpacity(0.05),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          LocaleKeys.keep_session_open.tr(),
                                          style: TextStyle(
                                              fontSize: text_12,
                                              color: kColor555555,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: size_160_w,
                                    height: size_60_w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size_10_w, vertical: size_10_w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: size_1_w,
                                          color: kColorBFBFBF,
                                        ),
                                      ),
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(),
                                        color: Colors.black.withOpacity(0.05),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          LocaleKeys.continue_selling.tr(),
                                          style: TextStyle(
                                              fontSize: text_12,
                                              color: kColor555555,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
