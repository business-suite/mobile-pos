import 'package:business_suite_mobile_pos/app/view/home/products/validate_page/validate_page.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/custom_card.dart';
import 'package:business_suite_mobile_pos/app/viewmodel/base_viewmodel.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../di/injection.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/repository/data_repository.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/style.dart';
import '../../widget_utils/base_scaffold_safe_area.dart';
import '../../widget_utils/bottom_sheet/bottom_sheet_utils.dart';
import '../products/appbar_product.dart';
import '../products/review/review_page.dart';
import '../popup_empty_order/popup_empty_order.dart';
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
  bool _hasBeenPressed = false;
  bool _hasBeenText = false;

  bool _hasBeenBank = false;
  bool _hasBeenTextBank = false;

  bool _hasBeenCustomer = false;
  bool _hasBeenTextCustomer = false;

  @override
  void initState() {
    super.initState();
  }

  PayViewModel get payViewModel => widget._payViewModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffoldSafeArea(
      transparentStatusBar: 0.2,
      backgroundColor: kColorf0eeee,
      customAppBar: AppBarProduct(
        badgeCount: 1,
        avatarUrl: getAvatarProfile(),
        onClickAvatar: () =>
            ButtomSheetUtils.bottomSheetActionAccount(
              context,
              onPreferences: (){},
              onLogout: ()=>  getIt<DataRepository>().logout(),
            ),
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
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: SingleChildScrollView(
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
                          padding:
                              EdgeInsets.only(top: size_30_w, bottom: size_4_w),
                          child: Text(
                            LocaleKeys.please_select_a_payment_method.tr(),
                            style: TextStyle(
                                color: kColor555555,
                                fontSize: text_14,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size_15_w, right: size_15_w),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(size_2_r)),
                            padding: EdgeInsets.symmetric(
                                horizontal: size_1_w, vertical: size_1_w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width / 2.1,
                                      height: size_100_w,
                                      child: Container(
                                        child: FlatButton(
                                          color: _hasBeenPressed
                                              ? Colors.black
                                              : kColorE2E2E2,
                                          onPressed: () {
                                            setState(() {
                                              _hasBeenPressed =
                                                  !_hasBeenPressed;
                                              _hasBeenText = !_hasBeenText;
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, size_35_w, size_45_w, 0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  LocaleKeys.name_cash.tr(),
                                                  style: TextStyle(
                                                    fontSize: text_20,
                                                    color: _hasBeenText
                                                        ? Colors.white
                                                        : kColor555555
                                                            .withOpacity(0.5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: size_1_w,
                                      color: kColorE2E2E2,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: size_100_w,
                                        child: Container(
                                          child: FlatButton(
                                            color: _hasBeenBank
                                                ? Colors.black
                                                : kColorE2E2E2,
                                            onPressed: () {
                                              OpenPopupEmptyOrder();
                                              setState(() {
                                                _hasBeenBank = !_hasBeenBank;
                                                _hasBeenTextBank =
                                                    !_hasBeenTextBank;
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, size_35_w, size_45_w, 0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    LocaleKeys.bank.tr(),
                                                    style: TextStyle(
                                                      fontSize: text_20,
                                                      color: _hasBeenTextBank
                                                          ? Colors.white
                                                          : kColor555555
                                                              .withOpacity(0.5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: size_1_w,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: size_100_w,
                                  child: FlatButton(
                                    color: _hasBeenCustomer
                                        ? Colors.black
                                        : kColorE2E2E2,
                                    onPressed: () {
                                      setState(() {
                                        _hasBeenCustomer = !_hasBeenCustomer;
                                        _hasBeenTextCustomer =
                                            !_hasBeenTextCustomer;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0, size_5_w, size_5_w, 0),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(right: size_65_w),
                                        child: Text(
                                          LocaleKeys.customer_account.tr(),
                                          style: TextStyle(
                                            fontSize: text_20,
                                            color: _hasBeenTextCustomer
                                                ? Colors.white
                                                : kColor555555.withOpacity(0.5),
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
                        SizedBox(
                          height: size_20_w,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(size_30_w, 0, size_30_w, 0),
                          child: CustomCard(
                            borderRadiusValue: 0,
                            shadow: Shadow.none,
                            backgroundColor: kColorBFBFBF,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: value.computers.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.all(size_1_w),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 1,
                                      mainAxisSpacing: 1,
                                      crossAxisCount: 4),
                              itemBuilder: (BuildContext context, int index) =>
                                  ItemKeyBoard(
                                item: value.computers[index],
                                onClickItem: () => value.onClickItem,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size_30_w,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size_10_w),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(size_1_w)),
                            padding: EdgeInsets.symmetric(
                                vertical: size_1_w, horizontal: size_1_w),
                            child: SizedBox(
                              width: double.infinity,
                              height: size_100_w,
                              child: FlatButton(
                                color: kColorE2E2E2,
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: size_10_w),
                                      child: Container(
                                        height: size_60_w,
                                        width: size_60_w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: Padding(
                                          padding: EdgeInsets.all(size_16_w),
                                          child: SvgPicture.asset(
                                            'assets/icons/ic_user.svg',
                                            width: size_14_w,
                                            height: size_14_w,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: size_65_w),
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
                          padding: EdgeInsets.all(size_10_w),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(size_1_w)),
                            padding: EdgeInsets.symmetric(
                                vertical: size_1_w, horizontal: size_1_w),
                            child: SizedBox(
                              width: double.infinity,
                              height: size_100_w,
                              child: FlatButton(
                                color: _hasBeenPressed
                                    ? kColor64AF8A
                                    : kColorE2E2E2,
                                onPressed: () {
                                  payViewModel.changePopup();
                                  setState(() {
                                    _hasBeenPressed = !_hasBeenPressed;
                                    _hasBeenText = !_hasBeenText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: size_10_w),
                                      child: Container(
                                        height: size_60_w,
                                        width: size_60_w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                            ),
                                            color: _hasBeenPressed
                                                ? kColor64AF8A
                                                : Colors.white,
                                            shape: BoxShape.circle),
                                        child: Padding(
                                          padding: EdgeInsets.all(size_16_w),
                                          child: SvgPicture.asset(
                                            'assets/icons/ic_file.svg',
                                            width: size_14_w,
                                            height: size_14_w,
                                            color: _hasBeenPressed
                                                ? Colors.white
                                                : kColor555555,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: size_65_w),
                                      child: Center(
                                        child: Text(
                                          LocaleKeys.invoice.tr(),
                                          style: TextStyle(
                                            fontSize: text_20,
                                            color: _hasBeenPressed
                                                ? Colors.white
                                                : kColor555555.withOpacity(0.5),
                                          ),
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
                ),
              ),

              //Button Validate + Review
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size_100_w,
                  padding: EdgeInsets.all(size_1_w),
                  color: kColorCACACA,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            getIt<NavigationService>()
                                .pushReplacementScreenWithFade(ValidatePage());
                          },
                          child: Center(
                            child: Text(
                              LocaleKeys.validate.tr(),
                              style: TextStyle(
                                fontSize: text_24,
                                color: kColor6EC89B,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: size_1_w,
                        color: kColorCACACA,
                      ),
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            getIt<NavigationService>()
                                .pushReplacementScreenWithFade(ReviewPage());
                          },
                          child: Center(
                            child: Text(
                              LocaleKeys.review.tr(),
                              style: TextStyle(
                                fontSize: text_24,
                                color: kColor6EC89B,
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
