import 'package:business_suite_mobile_pos/app/view/home/customer_phone_list/item_phone_customer.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/appbar_order_list.dart';
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
import 'customer_phone_list_viewmodel.dart';

class CustomerPhoneListPage
    extends PageProvideNode<CustomerPhoneListViewModel> {
  CustomerPhoneListPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return CustomerPhoneListContent(viewModel);
  }
}

class CustomerPhoneListContent extends StatefulWidget {
  CustomerPhoneListViewModel _customerListViewModel;

  CustomerPhoneListContent(this._customerListViewModel);

  @override
  State<CustomerPhoneListContent> createState() =>
      _CustomerPhoneListContentState();
}

class _CustomerPhoneListContentState extends State<CustomerPhoneListContent> {
  CustomerPhoneListViewModel get customerListViewModel =>
      widget._customerListViewModel;

  FocusNode node1 = FocusNode();

  @override
  void initState() {
    node1.addListener(() {
      print(node1.hasFocus);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //custorm appbar
    return BaseScaffoldSafeArea(
      transparentStatusBar: 0.2,
      backgroundColor: kColorBackground,
      customAppBar: AppBarOrderList(
        badgeCount: 1,
        avatarUrl: getAvatarProfile(),
        onClickAvatar: () =>
            ButtomSheetUtils.bottomSheetActionAccount(
              context,
              onPreferences: (){},
              onLogout: ()=>  getIt<DataRepository>().logout(),
            ),
      ),
      body: Consumer<CustomerPhoneListViewModel>(
          builder: (context, value, child) {
        return Container(
          color: kColorBackground,
          child: Column(
            children: <Widget>[
              //appbar1
              Padding(
                padding: EdgeInsets.only(
                    left: size_15_w, top: size_15_w, bottom: size_10_w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    //add button
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {
                          // customerListViewModel.openAddCustomerPage();
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
                              Icons.add,
                              color: kColor626482,
                              size: size_20_w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // textfield-search
                    Expanded(
                      child: Container(
                        height: size_35_w,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size_10_w,
                              right: size_5_w,
                              bottom: size_1_w),
                          child: Material(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(size_100_r),
                            child: TextField(
                              maxLines: 1,
                              cursorColor: kCBlack,
                              autocorrect: false,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                fillColor: kWhite,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size_100_r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(size_100_r),
                                  borderSide: BorderSide(
                                    color: kColor2947C3,
                                  ),
                                ),
                                hintText: LocaleKeys.search_customers.tr(),
                                hintStyle: TextStyle(fontSize: text_15),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //database button
                    Padding(
                      padding:
                          EdgeInsets.only(left: size_10_w, right: size_10_w),
                      child: InkWell(
                        // onTap: () {
                        //   getIt<NavigationService>().back();
                        // },
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
                            child: SvgPicture.asset(
                              'assets/icons/ic_database.svg',
                              width: size_16_w,
                              height: size_16_w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //ListView
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: InkWell(
                      onTap: () {
                        // getIt<NavigationService>().pushScreenWithFade(PopupQuotationOrderPage());
                      },
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: value.customersphone.length,
                        itemBuilder: (context, index) => Container(
                          color: index % 2 == 0 ? kColorE6E6E6 : kColorF7F7F7,
                          child: ItemPhoneCustomer(
                            itemphone: value.customersphone[index],
                            onClickItem: () {},
                          ),
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
