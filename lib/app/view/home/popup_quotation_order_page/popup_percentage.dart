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
import 'item_number.dart';
import 'percentage_viewmodel.dart';

void acceptScoreInputDialog() {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return PopupPercentage();
      });
}

class PopupPercentage extends PageProvideNode<PercentageViewModel> {
  PopupPercentage({Key? key}) : super(key: key, params: []);

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
                      padding:
                          EdgeInsets.only(top: size_20_w, bottom: size_20_w),
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
                InkWell(
                  onTap: () {
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: size_30_w,
                          right: size_30_w,
                        ),
                        height: size_50_w,
                        child: Container(
                          decoration: BoxDecoration(
                              color: kColor6ec89b,
                              borderRadius: BorderRadius.circular(size_3_w)),
                          padding: EdgeInsets.symmetric(
                              horizontal: size_2_w, vertical: size_2_w),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(size_3_w)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size_15_w),
                        child: Center(
                          child: Consumer<PercentageViewModel>(
                            builder: (context, value, child) {
                              return Text(
                                value.textInput,
                                overflow: TextOverflow.ellipsis,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size_10_w,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(size_30_w, size_5_w, size_30_w, size_5_w),
                  child: CustomCard(
                    borderRadiusValue: size_1_r,
                    shadow: Shadow.none,
                  //  padding: EdgeInsets.zero,
                   // boxBorder: null,
                    backgroundColor: kColorf0eeee,
                    child: ClipRRect(
                   //   borderRadius: BorderRadius.all(Radius.circular(size_1_r)),
                      clipBehavior: Clip.hardEdge,
                      child: GridView.builder(
                      //  physics: NeverScrollableScrollPhysics(),
                        itemCount: percentageViewModel.computers.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            //childAspectRatio: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            maxCrossAxisExtent: 80),
                        itemBuilder: (BuildContext context, int index) =>
                            ItemApplyKeyBoard(
                          item: percentageViewModel.computers[index],
                          onClickItem: () => percentageViewModel.onClickItem(
                              percentageViewModel.computers[index].number
                                  .toString()),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size_10_h,
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
                              Navigator.pop(context);
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
                              LocaleKeys.dialog_ok.tr(),
                              style: TextStyle(
                                fontSize: text_12,
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
          ),
        ],
      ),
    );
  }
}
