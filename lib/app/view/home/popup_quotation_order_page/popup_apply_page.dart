// ignore_for_file: prefer_const_constructors
import 'package:business_suite_mobile_pos/app/view/home/pay/pay_page.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../di/injection.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';
import 'apply_viewmodel.dart';
import 'item_number.dart';

void acceptScoreInputDialog() {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return PopupApplyPage();
      });
}

class PopupApplyPage extends StatefulWidget {
  PopupApplyPage({Key? key}) : super(key: key);

  @override
  State<PopupApplyPage> createState() => _PopupApplyPageState();
}

class _PopupApplyPageState extends State<PopupApplyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26.withOpacity(0.5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kColorE0E0E0,
              borderRadius: BorderRadius.circular(size_2_w),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: size_30_w,
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
                      padding: EdgeInsets.only(top: size_20_w,bottom: size_20_w),
                      child: Text(
                       'Percentage of \$ 66.00',
                        style:
                        TextStyle(fontSize: size_18_w, color: kColor555555),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size_15_h,
                ),
                Container(
                  padding: EdgeInsets.only(left: size_30_w,right : size_30_w,),
                  height: size_50_w,
                  child: Container(
                    decoration: BoxDecoration(
                        color: kColor6ec89b,
                        borderRadius:
                        BorderRadius.circular(size_3_w)),
                    padding: EdgeInsets.symmetric(
                        horizontal: size_2_w,vertical: size_2_w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kColorBackground,
                          borderRadius:
                          BorderRadius.circular(size_3_w)),
                    ),
                  ),
                ),

                SizedBox(
                  height: size_10_w,
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: number1.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 90,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (BuildContext context, int index) => ItemNumber(
                    numbers: number1[index],

                  ),
                ),
                Container(
                  height: size_1_w,
                  color: kColorCACACA,
                ),
                SizedBox(
                  height: size_15_h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size_15_w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(size_1_w)),
                        padding: EdgeInsets.symmetric(
                            horizontal: size_1_w, vertical: size_1_w),
                        child: Container(
                          height: size_50_w,
                          width: size_100_w,
                          child: FlatButton(
                            color: kColor3C3C3C.withOpacity(0.1),
                            onPressed: () {
                              getIt<NavigationService>().pushEnterFadeExitDown(PayPage());
                            },
                            child: Text(
                              LocaleKeys.cancel.tr(),
                              style: TextStyle(
                                fontSize: text_12,
                                color: kColor555555,
                              ),
                            ),
                           
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size_5_w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(size_1_w)),
                        padding: EdgeInsets.symmetric(
                            horizontal: size_1_w, vertical: size_1_w),
                        child: Container(
                          height: size_50_w,
                          width: size_100_w,
                          child: FlatButton(
                            onPressed: () {

                            },
                            child: Text(
                              LocaleKeys.dialog_ok.tr(),
                              style: TextStyle(
                                fontSize: text_12,
                                color: kColor555555,
                              ),
                            ),
                            color: kColor3C3C3C.withOpacity(0.1),
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
