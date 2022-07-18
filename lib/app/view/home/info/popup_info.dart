// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore_for_file: prefer_const_constructors

import 'package:business_suite_mobile_pos/app/view/home/popup_quotation_order_page/percentage_viewmodel.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../di/injection.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../widget_utils/custom/custom_card.dart';

void acceptScoreInputDialog() {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return ProductInformation();
      });
}

class ProductInformation extends PageProvideNode<PercentageViewModel> {
  ProductInformation({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return PopupPercentageContent(viewModel);
  }
}

class PopupPercentageContent extends StatefulWidget {
  final PercentageViewModel _percentageViewModel;

  PopupPercentageContent(this._percentageViewModel);

  @override
  State<PopupPercentageContent> createState() => _PopupPercentageContentState();
}

class _PopupPercentageContentState extends State<PopupPercentageContent> {
  PercentageViewModel get percentageViewModel => widget._percentageViewModel;

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
              horizontal: size_1_w,
            ),
            padding: EdgeInsets.symmetric(
              vertical: size_1_w,
              horizontal: size_1_w,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: kWhite.withOpacity(0.5),
                      child: Center(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: size_20_w, bottom: size_20_w),
                          child: Text(
                            LocaleKeys.product_information.tr(),
                            style:
                                TextStyle(fontSize: size_18_w, color: kColor555555),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size_15_h,
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size_10_w),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              LocaleKeys.office_chair.tr(),
                              style: TextStyle(
                                  fontSize: size_30_w, color: kColor555555),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size_10_w),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              LocaleKeys.furn_7777.tr(),
                              style: TextStyle(
                                  fontSize: size_15_w, color: kColor555555),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size_10_h,
                        ),
                        Text(
                          '\$ 70.00',
                          style: TextStyle(
                              fontSize: size_30_w, color: kColor555555),
                        ),
                        SizedBox(
                          height: size_20_w,
                        ),

                        //financials
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_10_w),
                                child: Text(
                                  LocaleKeys.financials.tr(),
                                  style: TextStyle(
                                      fontSize: size_20_w,
                                      color: kColor555555,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.topLeft,
                                height: size_2_w,
                                color: kColor808080,
                              ),
                            ),
                            SizedBox(
                              width: size_15_w,
                            )
                          ],
                        ),
                        SizedBox(
                          height: size_10_w,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_10_w),
                                child: Text(
                                  LocaleKeys.price_excl_vat.tr(),
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: size_20_w),
                                child: Text(
                                  '\$ 70.00',
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_10_w),
                                child: Text(
                                  LocaleKeys.cost.tr(),
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: size_20_w),
                                child: Text(
                                  '\$ 55.00',
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_10_w),
                                child: Text(
                                  LocaleKeys.margin.tr(),
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: size_20_w),
                                child: Text(
                                  '\$ 15.00(21.43%)',
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_10_w),
                                child: Text(
                                  LocaleKeys.public_pricelist.tr(),
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: size_20_w),
                                child: Text(
                                  '\$ 70.00',
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: size_20_w,
                        ),
                        //Inventory (as of opening)
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_10_w),
                                child: Text(
                                  LocaleKeys.inventory_as_of_opening.tr(),
                                  style: TextStyle(
                                      fontSize: size_20_w,
                                      color: kColor555555,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.topLeft,
                                height: size_2_w,
                                color: kColor808080,
                              ),
                            ),
                            SizedBox(
                              width: size_15_w,
                            )
                          ],
                        ),
                        SizedBox(
                          height: size_10_w,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: size_20_w),
                          alignment: Alignment.topLeft,
                          child: Text(
                            LocaleKeys.san_francisco.tr(),
                            style: TextStyle(
                                fontSize: size_15_w, color: kColor555555),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: size_35_w),
                          alignment: Alignment.topLeft,
                          child: Text(
                            '0 Units available,',
                            style: TextStyle(
                                fontSize: size_15_w, color: kColor555555),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: size_35_w),
                          alignment: Alignment.topLeft,
                          child: Text(
                            '35 forecasted',
                            style: TextStyle(
                                fontSize: size_15_w, color: kColor555555),
                          ),
                        ),

                        //Replenishment
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_10_w),
                                child: Text(
                                  LocaleKeys.replenishment.tr(),
                                  style: TextStyle(
                                      fontSize: size_20_w,
                                      color: kColor555555,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.topLeft,
                                height: size_2_w,
                                color: kColor808080,
                              ),
                            ),
                            SizedBox(
                              width: size_15_w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size_10_w,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: size_20_w),
                          alignment: Alignment.topLeft,
                          child: Text(
                            LocaleKeys.azure_interior.tr(),
                            style: TextStyle(
                                fontSize: size_15_w, color: kColor555555),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_35_w),
                                child: Text(
                                  '7 Days',
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_30_w),
                                child: Text(
                                  '\$ 55.00',
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(''),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(''),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: size_20_w),
                          alignment: Alignment.topLeft,
                          child: Text(
                            LocaleKeys.wood_corner.tr(),
                            style: TextStyle(
                                fontSize: size_15_w, color: kColor555555),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_35_w),
                                child: Text(
                                  '4 Days',
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_30_w),
                                child: Text(
                                  '\$ 66.00',
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(''),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(''),
                              ),
                            ),


                          ],
                        ),
                        SizedBox(
                          height: size_30_w,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_10_w),
                                child: Text(
                                  LocaleKeys.financials.tr(),
                                  style: TextStyle(
                                      fontSize: size_20_w,
                                      color: kColor555555,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.topLeft,
                                height: size_2_w,
                                color: kColor808080,
                              ),
                            ),
                            SizedBox(
                              width: size_15_w,
                            )
                          ],
                        ),
                        SizedBox(
                          height: size_10_w,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_10_w),
                                child: Text(
                                  LocaleKeys.total_price_excl_vat.tr(),
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: size_20_w),
                                child: Text(
                                  '\$ 103.00',
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_10_w),
                                child: Text(
                                  LocaleKeys.total_cost.tr(),
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: size_20_w),
                                child: Text(
                                  '\$ 55.00',
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(left: size_10_w),
                                child: Text(
                                  LocaleKeys.total_margin.tr(),
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.only(left: size_20_w),
                                child: Text(
                                  '\$ 48.00(46.6%)',
                                  style: TextStyle(
                                      fontSize: size_15_w,
                                      color: kColor555555),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: size_1_w,
                          color: kColorCACACA,
                        ),
                        SizedBox(
                          height: size_10_w,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: size_15_w),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kColor3C3C3C.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(size_4_w)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size_1_w, vertical: size_1_w),
                                  child: Container(
                                    height: size_40_w,
                                    width: size_120_w,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(size_1_w)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size_1_w, vertical: size_1_w),
                                    child: FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        LocaleKeys.close.tr(),
                                        style: TextStyle(
                                          fontSize: text_12,
                                          color: kColor555555,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
