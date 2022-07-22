import 'package:business_suite_mobile_pos/app/view/home/customer_tablet_list/item_tablet_customer.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/appbar_order_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../flavors.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../../main.dart';
import '../../../di/injection.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/event_bus/event_bus.dart';
import '../../../module/res/style.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../widget_utils/base_scaffold_safe_area.dart';
import 'customer_tablet_list_viewmodel.dart';

class CustomerTabletListPage extends PageProvideNode<CustomerTabletListViewModel> {
  CustomerTabletListPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return CustomerListContent(viewModel);
  }
}

class CustomerListContent extends StatefulWidget {
  CustomerTabletListViewModel _customerListViewModel;

  CustomerListContent(this._customerListViewModel);

  @override
  State<CustomerListContent> createState() => _CustomerListContentState();
}

class _CustomerListContentState extends State<CustomerListContent> {
  CustomerTabletListViewModel get customerListViewModel => widget._customerListViewModel;

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
        avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
        onClickAvatar: ()=> getIt<NavigationService>().signOut(),
      ),
      body: Consumer<CustomerTabletListViewModel>(builder: (context, value, child) {
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
                      padding: const EdgeInsets.only(left:10 ),
                      child: InkWell(
                        onTap: () {
                            customerListViewModel.gotoAddCustomerPage();
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
                          padding:
                              EdgeInsets.only(left: size_10_w,right: size_5_w,bottom: size_7_w),
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
                                  borderRadius: BorderRadius.circular(size_100_r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size_100_r),
                                  borderSide: BorderSide(
                                    color: kColor2947C3,
                                  ),
                                ),
                                hintText: LocaleKeys.search_customers.tr(),
                                hintStyle: TextStyle(fontSize: text_12),
                                contentPadding:
                                    EdgeInsets.fromLTRB(22.0, 5.0, 20.0, 5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //database button
                    Padding(
                      padding: EdgeInsets.only(left: size_10_w,right: size_10_w),
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
              Container(
                color: kColorF7F7F7,
                height: size_40_w,
                width: double.infinity,
                child: Row(
                  children: [
                    //text name
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: size_10_w),
                          child: Text(
                            LocaleKeys.pos_name.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kColor666666,
                              fontSize: text_15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //text ZIP
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: size_35_w),
                        child: Text(
                          LocaleKeys.zip.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kColor666666,
                            fontSize: text_15,
                          ),
                        ),
                      ),
                    ),
                    //text EMAIL
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(right: size_140_w),
                        child: Text(
                          LocaleKeys.email.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kColor666666,
                            fontSize: text_15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //ListView
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.customers.length,
                    itemBuilder: (context, index) => Container(
                      height: size_40_w,
                      width: double.infinity,
                      color: index % 2 == 0 ? kColorE6E6E6 : kColorF7F7F7,
                      child: ItemCustomer(
                        item: value.customers[index],
                        onClickItem: () {},
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
