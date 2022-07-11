import 'package:business_suite_mobile_pos/app/view/home/order_list/appbar_order_list.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/item_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../flavors.dart';
import '../../../module/res/style.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../widget_utils/base_scaffold_safe_area.dart';
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

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldSafeArea(
      transparentStatusBar: 0.2,
      backgroundColor: kColorBackground,
      customAppBar: AppBarOrderList(
        badgeCount: 1,
        avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
      ),
      body: Consumer<OrderListViewModel>(builder: (context, value, child) {
        return Container(
          color: kColorBackground,
          child: Column(
            children: <Widget>[
              //appbar2
              Container(
                height: size_40_w,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                      height: 10.0,
                    ),
                    Text(
                      'Point of Sale',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 20.0,
                            color: Colors.white,
                            child: ElevatedButton.icon(
                              icon: Icon(
                                Icons.filter_alt,
                                size: 18,
                                color: Colors.black38,
                              ),
                              label: Text('Filters',
                                  style: TextStyle(
                                      fontSize: text_12,
                                      color: Colors.black87)),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white, elevation: 0.0),
                            ),
                          ),
                          Container(
                            height: 20.0,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(right: 1),
                              child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.table_rows,
                                  size: 18,
                                  color: Colors.black38,
                                ),
                                label: Text('Group By',
                                    style: TextStyle(
                                        fontSize: text_12,
                                        color: Colors.black87)),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white, elevation: 0.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: value.orders.length,
                itemBuilder: (context, index) => ItemOrder(
                  item: value.orders[index],
                  onClickItem: () {},
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
