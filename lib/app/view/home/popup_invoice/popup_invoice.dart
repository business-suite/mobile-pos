// ignore_for_file: prefer_const_constructors
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../di/injection.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';


void OpenPopupInvoiceValidate() {
  BuildContext context =
  getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return PopupInvoiceValidate();
      });
}

class PopupInvoiceValidate extends StatefulWidget {
  PopupInvoiceValidate({Key? key}) : super(key: key);

  @override
  State<PopupInvoiceValidate> createState() =>
      _PopupInvoiceValidateState();
}

class _PopupInvoiceValidateState extends State<PopupInvoiceValidate> {



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: kColorBackground,
            borderRadius: BorderRadius.circular(size_5_w),
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
                height: size_50_w,
                color: kColorffffff.withOpacity(0.5),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: size_5_w),
                    child: Text(
                      LocaleKeys.please_select_the_customer.tr(),
                      style:
                      TextStyle(fontSize: size_18_w, color: kColor555555,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: size_20_w,top: size_20_w,bottom: size_20_w,right: size_20_w,),
                child: Text(
                  LocaleKeys
                      .you_need_to_select_the_customer_before_you_can_invoice_or_ship_an_order
                      .tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kColor555555,fontSize: size_16_w,fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                height: size_1_w,
                width: double.infinity,
                color: kColor3C3C3C.withOpacity(0.1),
              ),
              SizedBox(
                height: size_10_w,
              ),
              Padding(
                padding: EdgeInsets.only(right: size_10_w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: kColorcacaca,
                          borderRadius: BorderRadius.circular(size_2_w)),
                      padding: EdgeInsets.symmetric(
                          horizontal: size_1_w, vertical: size_1_w),
                      child: Container(
                        height: size_40_w,
                        width: size_100_w,
                        child: FlatButton(
                          onPressed: () {
                            getIt<NavigationService>().dimiss();
                          },
                          child: Text(
                            LocaleKeys.cancel.tr(),
                            style: TextStyle(
                              fontSize: text_16,
                              color: kColor555555,fontWeight: FontWeight.normal
                            ),
                          ),
                          color: kColorE4E2E2,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size_5_w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kColorcacaca,
                          borderRadius: BorderRadius.circular(size_2_w)),
                      padding: EdgeInsets.symmetric(
                          horizontal: size_1_w, vertical: size_1_w),
                      child: Container(
                        height: size_40_w,
                        width: size_100_w,
                        child: FlatButton(
                          onPressed: () {
                            // value.deleteBillItem(index);
                          },
                          child: Text(
                            LocaleKeys.dialog_ok.tr(),
                            style: TextStyle(
                              fontSize: text_16,
                              color: kColor555555,fontWeight: FontWeight.normal
                            ),
                          ),
                          color: kColorE4E2E2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size_10_w,
              ),
            ],
          ),
        ),
      ],
    );
  }

}
