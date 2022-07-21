// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:business_suite_mobile_pos/app/view/home/shop_list/appbar_shop_list.dart';
import 'package:business_suite_mobile_pos/app/viewmodel/base_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../flavors.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../di/injection.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/style.dart';
import '../../widget_utils/base_scaffold_safe_area.dart';
import 'item_shop.dart';
import 'shop_list_viewmodel.dart';

class ShopListPage extends PopupInvoicePage<ShopListViewModel> {
  ShopListPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return ShopListContent(viewModel);
  }
}

class ShopListContent extends StatefulWidget {
  final ShopListViewModel _shopListViewModel;

  ShopListContent(this._shopListViewModel);

  @override
  State<ShopListContent> createState() => _ShopListContentState();
}

class _ShopListContentState extends State<ShopListContent> {
  ShopListViewModel get shopListViewModel => widget._shopListViewModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffoldSafeArea(
      transparentStatusBar: 0.2,
      backgroundColor: kColorf0eeee,
      customAppBar: AppBarShopList(
        badgeCount: 1,
        avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
        onClickAvatar: ()=> getIt<NavigationService>().signOut(),
      ),
      body: Consumer<ShopListViewModel>(builder: (context, value, child) {
        return SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              //appbar2
              Container(
                height: size_40_w,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: size_10_w ,
                      height: size_10_w,
                    ),
                    Text(
                      LocaleKeys.point_of_sale.tr(),
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
                                size: size_18_w,
                                color: Colors.black38,
                              ),
                              label: Text(LocaleKeys.filters.tr(),
                                  style: TextStyle(
                                      fontSize: text_12, color: Colors.black87)),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white, elevation: 0),
                            ),
                          ),
                          Container(
                            height: size_20_w,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(right: size_1_w),
                              child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.table_rows,
                                  size: size_18_w,
                                  color: Colors.black38,
                                ),
                                label: Text(LocaleKeys.group_by.tr(),
                                    style: TextStyle(
                                        fontSize: text_12,
                                        color: Colors.black87)),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white, elevation: 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //body
              Container(
                padding: EdgeInsets.only(top: size_4_w),
                color: Color(0xF8F9FA),
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: shopListViewModel.shops.length,
                    itemBuilder: (context, index) => ItemShop(
                      shop: shopListViewModel.shops[index],
                      onClickItem: () {
                        shopListViewModel.gotoDetailShop();
                      },

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
