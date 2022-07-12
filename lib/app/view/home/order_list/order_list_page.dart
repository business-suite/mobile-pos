import 'package:business_suite_mobile_pos/app/di/injection.dart';
import 'package:business_suite_mobile_pos/app/module/common/navigator_screen.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/appbar_shop.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/review/review_shop.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/review/review_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/item_order.dart';
import '../../../../flavors.dart';
import '../../../module/res/style.dart';
import '../../widget_utils/base_scaffold_safe_area.dart';
import 'package:business_suite_mobile_pos/app/model/order.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderListState();
}

class _OrderListState extends State<OrderPage> {
  List listItem = [
    Order(
        itemName: 'S00041',
        date: '2022-06-20 02:44PM',
        customer: 'Lumber Inc',
        salesMan: 'OdooBot',
        total: '\$ 1,325.00',
        state: 'Quotation'),
    Order(
        itemName: 'S00033',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 66.00',
        state: 'Quotation'),
    Order(
        itemName: 'S00036',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 25.00',
        state: 'Sales Order'),
    Order(
        itemName: 'S00031',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 1,799.00',
        state: 'Sales Order'),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldSafeArea(
        backgroundColor: kColorf0eeee,
        //appbar custom
        customAppBar: AppBarShop(
          badgeCount: 1,
          avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
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
                          getIt<NavigationService>()
                              .pushScreenWithSlideUp(
                              ReviewPage());
                        },
                        child: Container(
                          height: size_40_w,
                          width: size_40_w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: size_1_w,
                              color: kColorBFBFBF, //                   <--- border width here
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
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Container(
                          height: size_40_w,
                          width: size_260_w,
                          decoration: BoxDecoration(
                            color: kCWhite,
                            borderRadius: BorderRadius.circular(20),
                            // boxShadow: [
                            //   // BoxShadow(
                            //   //   color: Colors.blue,
                            //   //   offset: Offset(0, 0),
                            //   //   blurRadius: 10.0,
                            //   //   spreadRadius: 5.0,
                            //   // )
                            // ],
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            autocorrect: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: kColor555555,
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: size_10_w),
                                child: SvgPicture.asset(
                                  'assets/icons/vector.svg',
                                  fit: BoxFit.fill,
                                  color: kColorDDDDDD,
                                ),
                              ),
                              suffixIconConstraints: BoxConstraints(maxWidth: size_25_w,maxHeight: size_15_w),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              hintText:
                                  'E.g. customer: Steward, date: 2020-05-09',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //list view
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: size_10_w,
                        bottom: size_10_w,
                        left: size_10_w,
                        right: size_10_w),
                    child: Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listItem.length,
                        itemBuilder: (context, index) => ItemOrder(
                          item: listItem[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
