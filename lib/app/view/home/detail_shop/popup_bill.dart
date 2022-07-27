// ignore_for_file: prefer_const_constructors

import 'package:business_suite_mobile_pos/app/module/event_bus/event_bus.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/order_list_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/popup_quotation_order_page/popup_percentage.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../main.dart';
import '../../../di/injection.dart';
import '../../../model/bill.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';
import '../../../viewmodel/base_viewmodel.dart';
import 'detail_shop_viewmodel.dart';

void openPopupBillRemove() {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return PopupQuotationOrderPage();
      });
}
class PopupQuotationOrderPage extends PageProvideNode<DetailShopViewModel> {
  PopupQuotationOrderPage({Key? key,}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return PopupQuotationOrderContent(viewModel);
  }
}

class PopupQuotationOrderContent extends StatefulWidget {
  final DetailShopViewModel _detailShopViewModel;

  PopupQuotationOrderContent(this._detailShopViewModel);


  @override
  State<PopupQuotationOrderContent> createState() =>
      _PopupQuotationOrderContentState();
}

class _PopupQuotationOrderContentState extends State<PopupQuotationOrderContent> {
  DetailShopViewModel get detailShopViewModel => widget._detailShopViewModel;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black26.withOpacity(0.5),
      body: Consumer<DetailShopViewModel>(builder: (context,value, child){
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
                          LocaleKeys.existing_orderlines.tr(),
                          style:
                          TextStyle(fontSize: size_18_w, color: kColor555555),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: size_20_w,top: size_20_w,bottom: size_20_w,right: size_20_w,),
                    child: Text(
                      LocaleKeys
                          .order_000041530017_has_a_total_amount_of_33_00_are_you_want_to_delete_this_order
                          .tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kColor555555,fontSize: size_16_w),
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
                                  color: kColor555555,
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
                                  color: kColor555555,
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
      })
    );
  }
}
