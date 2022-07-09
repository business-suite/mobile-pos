import 'package:business_suite_mobile_pos/app/view/home/detail_shop/appbar_shop.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/review/review_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  List Is = [
    Order(
        itemName: 'S00041',
        date: '2022-06-20 02:44PM',
        customer: 'Lumber Inc',
        salesMan: 'OdooBot',
        total: '\$ 1,325.00',
        state:'Quotation'),
    Order(
        itemName: 'S00033',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 66.00',
        state:'Quotation'),
    Order(
        itemName: 'S00036',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 25.00',
        state:'Sales Order'),
    Order(
        itemName: 'S00031',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 1,799.00',
        state:'Sales Order'),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldSafeArea(
      backgroundColor: kColorf0eeee,
      customAppBar: AppBarShop(
        badgeCount: 1,
        avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
      ),
      body: Consumer<ReviewViewModel>(builder: (context, value, child) {
        return Container(
          child: Column(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Container(
                      color: kColorf0eeee,
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: Is.length,
                          itemBuilder: (context, index) => ItemOrder(
                            item: Is[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

