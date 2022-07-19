import 'package:business_suite_mobile_pos/app/view/home/order_list/appbar_order_list.dart';
import 'package:business_suite_mobile_pos/app/view/home/customer_list/appbar_customer_list.dart';
import 'package:business_suite_mobile_pos/app/view/home/customer_list/item_customer.dart';
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
import 'customer_list_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/customer_list/customer_list_viewmodel.dart';

class CustomerListPage extends PageProvideNode<CustomerListViewModel> {
  CustomerListPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return CustomerListContent(viewModel);
  }
}

class CustomerListContent extends StatefulWidget {
  CustomerListViewModel _customerListViewModel;

  CustomerListContent(this._customerListViewModel);

  @override
  State<CustomerListContent> createState() => _CustomerListContentState();
}

class _CustomerListContentState extends State<CustomerListContent> {
  CustomerListViewModel get customerListViewModel => widget._customerListViewModel;

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
      ),
      body: Consumer<CustomerListViewModel>(builder: (context, value, child) {
        return Container(
          color: kColorBackground,
          child: Column(
            children: <Widget>[
              //appbar1
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
                    //add button
                    Padding(
                      padding: const EdgeInsets.only(left:10 ),
                      child: InkWell(
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
                              Icons.add,
                              color: kColor626482,
                              size: size_20_w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // textfield
                    Padding(
                      padding:
                          EdgeInsets.only(left: size_10_w, bottom: size_7_w),
                      child: Container(
                        height: size_35_w,
                        width: size_180_w,
                        decoration: BoxDecoration(
                          color: kCWhite,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          autocorrect: false,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            suffixIconConstraints: BoxConstraints(
                                maxWidth: size_25_w, maxHeight: size_15_w),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              borderSide: BorderSide(
                                color: kColor2947C3,
                              ),
                            ),
                            hintText:
                                'Search Customers',
                            hintStyle: TextStyle(fontSize: size_14_w),
                            contentPadding:
                                EdgeInsets.fromLTRB(12.0, 15.0, 20.0, 10.0),
                          ),
                        ),
                      ),
                    ),
                    //database button
                    Padding(
                      padding: EdgeInsets.only(left: 10),
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
                width: size_400_w,
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