// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/custom_card.dart';
import 'package:business_suite_mobile_pos/app/viewmodel/base_viewmodel.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../flavors.dart';
import '../../../module/res/style.dart';
import '../../widget_utils/base_scaffold_safe_area.dart';
import '../detail_shop/appbar_shop.dart';
import 'item_keyboard.dart';
import 'pay_viewmodel.dart';

class PayPage extends PageProvideNode<PayViewModel> {
  PayPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return PayContent(viewModel);
  }
}

class PayContent extends StatefulWidget {
  final PayViewModel _payViewModel;

  PayContent(this._payViewModel);

  @override
  State<PayContent> createState() => _PayContentState();
}

class _PayContentState extends State<PayContent> {
  PayViewModel get payViewModel => widget._payViewModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffoldSafeArea(
      backgroundColor: kColorf0eeee,
      customAppBar: AppBarShop(
        badgeCount: 1,
        avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
      ),
      body: Consumer<PayViewModel>(builder: (context, value, child) {
        return SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: size_20_w),
                            child: Text(
                              '\$ 0.00',
                              style: TextStyle(
                                  color: kColor43996E, fontSize: text_64),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: size_30_w, bottom: size_4_w),
                            child: Text(
                              LocaleKeys.please_select_a_payment_method.tr(),
                              style: TextStyle(
                                  color: kColor555555,
                                  fontSize: text_14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                size_10_w, size_2_w, size_20_w, 0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: size.width / 2,
                                  height: size_100_w,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius:
                                            BorderRadius.circular(size_10_w)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size_2_w),
                                    child: FlatButton(
                                      color: kColorE2E2E2,
                                      onPressed: () {},
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0, size_35_w, size_45_w, 0),
                                        child: Column(
                                          children: [
                                            Text(
                                              LocaleKeys.cash.tr(),
                                              style: TextStyle(
                                                  fontSize: text_20,
                                                  color: Colors.black38),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: size_100_w,
                                    child: FlatButton(
                                      color: kColorE2E2E2,
                                      onPressed: () {},
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0, size_35_w, size_45_w, 0),
                                        child: Column(
                                          children: [
                                            Text(
                                              LocaleKeys.bank.tr(),
                                              style: TextStyle(
                                                  fontSize: text_20,
                                                  color: Colors.black38),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                size_10_w, size_2_w, size_10_w, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius:
                                      BorderRadius.circular(size_10_r)),
                              padding: EdgeInsets.symmetric(vertical: size_2_w),
                              child: SizedBox(
                                width: double.infinity,
                                height: size_100_w,
                                child: FlatButton(
                                  color: kColorE2E2E2,
                                  onPressed: () {},
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0, size_5_w, size_45_w, 0),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(right: size_60_w),
                                      child: Text(
                                        LocaleKeys.customer_account.tr(),
                                        style: TextStyle(
                                            fontSize: text_20,
                                            color: Colors.black38),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size_20_w,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(size_30_w, 0, size_40_w, 0),
                            child: CustomCard(
                              borderRadiusValue: size_4_r,
                              shadow: Shadow.none,
                              backgroundColor: kColorBFBFBF,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(size_4_r)),
                                clipBehavior: Clip.hardEdge,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: value.computers.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(1),
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          childAspectRatio: 1,
                                          crossAxisSpacing: 1,
                                          mainAxisSpacing: 1,
                                          maxCrossAxisExtent: 100),
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          ItemKeyBoard(
                                    item: value.computers[index],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size_30_w,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: size_10_w),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius:
                                      BorderRadius.circular(size_10_r)),
                              padding: EdgeInsets.symmetric(vertical: size_2_w),
                              child: SizedBox(
                                width: double.infinity,
                                height: size_100_w,
                                child: FlatButton(
                                  color: kColorE2E2E2,
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: size_10_w),
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                          child: Icon(
                                            Icons.person,
                                            size: size_30_w,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: size_70_w),
                                        child: Center(
                                          child: Text(
                                            LocaleKeys.customer.tr(),
                                            style: TextStyle(
                                                fontSize: text_20,
                                                color: Colors.black38),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: size_10_w),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius:
                                      BorderRadius.circular(size_10_w)),
                              padding: EdgeInsets.symmetric(vertical: size_2_w),
                              child: SizedBox(
                                width: double.infinity,
                                height: size_100_w,
                                child: FlatButton(
                                  color: Color(0xFFe2e2e2),
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: size_10_w),
                                        child: Container(
                                          height: size_70_w,
                                          width: size_70_w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                              color: Colors.white,
                                              shape: BoxShape.circle),
                                          child: Container(
                                            width: size_70_w,
                                            height: size_70_w,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.all(size_16_w),
                                              child: SvgPicture.asset(
                                                'assets/icons/ic_file.svg',
                                                width: size_16_w,
                                                height: size_16_w,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: size_80_w),
                                        child: Center(
                                          child: Text(
                                            LocaleKeys.invoice.tr(),
                                            style: TextStyle(
                                                fontSize: text_20,
                                                color: Colors.black38),
                                          ),
                                        ),
                                      ),
                                    ],
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
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Color(0xffCACACA),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(size_10_r)),
                          padding: EdgeInsets.symmetric(horizontal: size_2_w),
                          child: FlatButton(
                            color: Colors.white,
                            onPressed: () {},
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: size_25_w),
                              child: Center(
                                child: Text(
                                  LocaleKeys.validate.tr(),
                                  style: TextStyle(
                                    fontSize: text_35,
                                    color: kColor6EC89B,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> Item()));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: size_25_w),
                            child: Center(
                              child: Text(
                                LocaleKeys.review.tr(),
                                style: TextStyle(
                                  fontSize: text_35,
                                  color: kColor6EC89B,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
