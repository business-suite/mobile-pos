// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:business_suite_mobile_pos/app/module/event_bus/event_bus.dart';
import 'package:business_suite_mobile_pos/app/view/home/coins_bills/coins_bills_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/coins_bills/item_coins_bills.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:business_suite_mobile_pos/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../di/injection.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';
import '../../../viewmodel/base_viewmodel.dart';

void OpenPopupClosingControl() {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return PopupCoInsControl();
      });
}

class PopupCoInsControl extends PageProvideNode<ConInsBillsViewModel> {
  PopupCoInsControl({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return PopupCoInsBills(viewModel);
  }
}

class PopupCoInsBills extends StatefulWidget {
  final ConInsBillsViewModel _conInsBillsViewModel;

  PopupCoInsBills(this._conInsBillsViewModel);

  @override
  State<PopupCoInsBills> createState() => _PopupCoInsBillsState();
}

class _PopupCoInsBillsState extends State<PopupCoInsBills> {

  ConInsBillsViewModel get conInsBillsViewModel => widget._conInsBillsViewModel;

  @override
  void initState() {
    eventBus.on<CloseScreenSettleOrder>().listen((event) {
      getIt<NavigationService>().back();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kColorf0eeee.withOpacity(0.5),
      body: SafeArea(
        child: Container(
          height: screenHeight - keyboardHeight,
          decoration: BoxDecoration(
            color: kColorf0eeee,
            borderRadius: BorderRadius.circular(size_2_w),
          ),
          margin:
              EdgeInsets.symmetric(horizontal: size_30_w, vertical: size_130_w),
          padding: EdgeInsets.symmetric(
            vertical: size_1_w,
            horizontal: size_1_w,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                color: kColorf0eeee,
                child: Padding(
                  padding: EdgeInsets.all(size_15_w),
                  child: Text(
                    'Coins/Bills',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: size_22_w,
                        color: kColor555555,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.all(size_5_w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size_20_w, bottom: size_100_w),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          conInsBillsViewModel.prices.length,
                                      itemBuilder: (context, index) =>
                                          ItemCoInsBills(
                                        item:
                                            conInsBillsViewModel.prices[index],
                                        onClickItem: () {},
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size_20_w, bottom: size_50_w),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: conInsBillsViewModel
                                          .priceBills.length,
                                      itemBuilder: (context, index) =>
                                          ItemCoInsBills(
                                        item: conInsBillsViewModel
                                            .priceBills[index],
                                        onClickItem: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size_40_w,)

                          ],
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Wrap(
                        children: [
                          Container(
                            color: kColorf0eeee,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: size_10_w),
                                  child: Text(
                                    'Total \$ 0.00',
                                    style: TextStyle(
                                        color: kColor555555, fontSize: size_18_w),
                                  ),
                                ),
                                Container(
                                  height: size_1_w,
                                  color: kColorCACACA,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: size_100_w,
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
                                            LocaleKeys.confirm.tr(),
                                            style: TextStyle(
                                                fontSize: text_12,
                                                color: kColor555555,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: size_100_w,
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
                                            'Discard',
                                            style: TextStyle(
                                                fontSize: text_12,
                                                color: kColor555555,
                                                fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
