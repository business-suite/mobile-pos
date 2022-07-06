import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../di/injection.dart';
import '../../../../module/common/navigator_screen.dart';
import '../../../../module/res/colors.dart';
import '../../../../module/res/dimens.dart';
import '../../../../module/res/string.dart';
import '../../../../module/res/text.dart';

void acceptScoreInputDialog() {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return CashInOutPage();
      });
}

class CashInOutPage extends StatefulWidget {
  CashInOutPage({Key? key}) : super(key: key);

  @override
  State<CashInOutPage> createState() => _CashInOutPageState();
}

class _CashInOutPageState extends State<CashInOutPage> {
  bool cashIn = false;
  bool cashOut = false;
  @override
  void initState() {
    super.initState();
  }
  switchColor() {
    setState((){
      cashIn = !cashIn;

    });
  }

  switchCashOut(){
    setState((){
      cashOut = !cashOut;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26.withOpacity(0.5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kColorBackground,
              borderRadius: BorderRadius.circular(size_10_w),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: size_10_w,
            ),
            padding: EdgeInsets.symmetric(
              vertical: size_10_w,
              horizontal: size_10_w,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size_5_w,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        switchColor();
                      },
                      child: Container(
                        decoration: BoxDecoration(color: cashIn ? Color(0xFF64AF8A):Color(0xFFCACACA)),
                        padding: EdgeInsets.only(left: size_5_w),
                        height: size_50_w,
                        width: size_85_w,
                        child: Center(
                          child: Text(
                            LocaleKeys.cash_in.tr(),
                            style: TextStyle(
                              fontSize: text_12,
                              color: kColor555555,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Ink(
                      child: InkWell(
                        onTap: (){
                       print('kieuthang');
                        },
                        child: Container(
                          decoration: BoxDecoration(color: cashOut ? Color(0xFF64AF8A):Color(0xFFCACACA)),
                          padding: EdgeInsets.only(left: size_5_w),
                          height: size_50_w,
                          width: size_85_w,
                          child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              LocaleKeys.cash_out.tr(),
                              style: TextStyle(
                                fontSize: text_12,
                                color: kColor555555,
                              ),
                            ),
                            color: kColorCACACA,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: kColorf0eeee,
                            borderRadius: BorderRadius.circular(size_10_r)),
                        padding: EdgeInsets.symmetric(horizontal: size_2_w),
                        height: size_50_w,
                        width: size_160_w,
                        child: TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size_5_h,
                ),
                Container(
                  padding: EdgeInsets.only(right: size_80_w),
                  alignment: Alignment.topRight,
                  child: Text(
                    LocaleKeys.$,
                    style: TextStyle(
                      fontSize: text_16,
                      color: kColor555555,
                    ),
                  ),
                ),
                SizedBox(
                  height: size_15_h,
                ),
                TextField(
                  minLines: 1,
                  maxLines: 3,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Reason'
                  ),
                ),
                SizedBox(
                  height: size_25_w,
                ),
                Container(
                  height: size_1_w,
                  color: kColorCACACA,
                ),
                SizedBox(
                  height: size_15_h,
                ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,

                 children: [
                   Container(
                     padding: EdgeInsets.only(left: size_5_w),
                     height: size_50_w,
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
                       color: kColorCACACA,
                     ),
                   ),
                   Container(
                     padding: EdgeInsets.only(left: size_5_w),
                     height: size_50_w,
                     width: size_100_w,
                     child: FlatButton(
                       onPressed: () {},
                       child: Text(
                         LocaleKeys.confirm.tr(),
                         style: TextStyle(
                           fontSize: text_12,
                           color: kColor555555,
                         ),
                       ),
                       color: kColorCACACA,
                     ),
                   ),
                 ],
               )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
