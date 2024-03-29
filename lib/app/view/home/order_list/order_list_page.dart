import 'package:business_suite_mobile_pos/app/view/home/order_list/appbar_order_list.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/item_order.dart';
import 'package:business_suite_mobile_pos/app/view/home/popup_quotation_order_page/popup_quotation_order.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../di/injection.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/repository/data_repository.dart';
import '../../../module/res/style.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../widget_utils/base_scaffold_safe_area.dart';
import '../../widget_utils/bottom_sheet/bottom_sheet_utils.dart';
import 'order_list_viewmodel.dart';

class OrderListPage extends PageProvideNode<OrderListViewModel> {
  OrderListPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return OrderListContent(viewModel);
  }
}

class OrderListContent extends StatefulWidget {
  OrderListViewModel _orderListViewModel;

  OrderListContent(this._orderListViewModel);

  @override
  State<OrderListContent> createState() => _OrderListContentState();
}

class _OrderListContentState extends State<OrderListContent> {
  OrderListViewModel get orderListViewModel => widget._orderListViewModel;

  FocusNode node1 = FocusNode();

  @override
  void initState() {
    node1.addListener(() {
      print(node1.hasFocus);
    });
    /*eventBus.on<CloseScreenSettleOrder>().listen((event) {
      getIt<NavigationService>().back();
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldSafeArea(
      transparentStatusBar: 0.2,
      backgroundColor: kColorBackground,
      customAppBar: AppBarOrderList(
        badgeCount: 1,
        avatarUrl: getAvatarProfile(),
        onClickAvatar: () => ButtomSheetUtils.bottomSheetActionAccount(
          context,
          onPreferences: () {
            getIt<NavigationService>().openPreferencesPage();
          },
          onLogout: () {
            getIt<DataRepository>().logout();
          },
        ),
      ),
      body: Consumer<OrderListViewModel>(builder: (context, value, child) {
        return Container(
          color: kColorBackground,
          child: Column(
            children: <Widget>[
              //appbar2
              Padding(
                padding: EdgeInsets.only(
                    left: size_15_w, top: size_15_w, bottom: size_10_w),
                child: Row(
                  children: <Widget>[
                    // back button
                    InkWell(
                      onTap: () {
                        getIt<NavigationService>().back();
                      },
                      child: Container(
                        height: size_40_w,
                        width: size_40_w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: size_1_w,
                            color: kColorBFBFBF,
                          ),
                          color: kColorE6E6E6,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.keyboard_double_arrow_left,
                            color: kColor626482,
                            size: size_20_w,
                          ),
                        ),
                      ),
                    ),
                    // textfield
                    Expanded(
                      child: Container(
                        height: size_35_w,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size_50_w,
                              right: size_70_w,
                              bottom: size_7_w),
                          child: Material(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(size_100_r),
                            child: TextField(
                              maxLines: 1,
                              cursorColor: Colors.black,
                              autocorrect: false,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size_100_r),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: kColor808080,
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: size_10_w),
                                  child: SvgPicture.asset(
                                    'assets/icons/vector.svg',
                                    fit: BoxFit.fill,
                                    color: kColor808080,
                                  ),
                                ),
                                suffixIconConstraints: BoxConstraints(
                                    maxWidth: size_25_w, maxHeight: size_15_w),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size_100_r),
                                  borderSide: BorderSide(
                                    color: kColor2947C3,
                                  ),
                                ),
                                hintText: LocaleKeys.E_g_customer.tr(),
                                hintStyle: TextStyle(fontSize: size_14_w),
                                contentPadding:
                                    EdgeInsets.fromLTRB(12.0, 5.0, 0, 1.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: InkWell(
                      onTap: () {
                        getIt<NavigationService>()
                            .pushScreenWithFade(PopupQuotationOrderPage());
                      },
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: value.orders.length,
                        itemBuilder: (context, index) => ItemOrder(
                          item: value.orders[index],
                          onClickItem: () {},
                        ),
                      ),
                    ),
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
