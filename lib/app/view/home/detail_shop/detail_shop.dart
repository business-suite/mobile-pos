import 'package:business_suite_mobile_pos/app/module/common/navigator_screen.dart';
import 'package:business_suite_mobile_pos/app/module/res/dimens.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/appbar_shop.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/item_category.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/base_scaffold_safe_area.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../flavors.dart';
import '../../../di/injection.dart';
import '../../../module/res/style.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../widget_utils/custom/custom_sliver_grid_delegate.dart';
import '../../widget_utils/custom/loadmore.dart';
import '../pay/pay_page.dart';
import 'detail_shop_viewmodel.dart';

class DetailShopPage extends PageProvideNode<DetailShopViewModel> {
  DetailShopPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return _DetailShopContent(viewModel);
  }
}

class _DetailShopContent extends StatefulWidget {
  final DetailShopViewModel _detailShopViewModel;

  _DetailShopContent(this._detailShopViewModel);

  @override
  _DetailShopState createState() => _DetailShopState();
}

class _DetailShopState extends State<_DetailShopContent> {
  DetailShopViewModel get detailShopViewModel => widget._detailShopViewModel;
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffoldSafeArea(
      transparentStatusBar: 0.2,
      backgroundColor: Colors.white70,
      customAppBar: AppBarShop(
        badgeCount: 1,
        onClickAvatar: ()=> getIt<NavigationService>().signOut(),
        avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
      ),
      body: Consumer<DetailShopViewModel>(builder: (context, value, child) {
        return Container(
          color: kColorBackground,
          child: Stack(
            children: [
              Column(
                children: [
                  //List tab title product
                  Container(
                    width: double.infinity,
                    height: size_50_w,
                  color: kColorD3D3D3,
                  padding: EdgeInsets.only(left: size_10_w),
                   child:  Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/icons/ic_home.svg',
                          height: size_28_w,
                          width: size_28_w,
                          color: Colors.black38,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: SvgPicture.asset(
                            'assets/icons/ic_next.svg',
                            height: size_50_w,
                            width: size_50_w,
                            color: Colors.black38,
                          ),
                        ),
                        Container(
                          child: Text(
                            LocaleKeys.chairs.tr(),
                            style: TextStyle(color: Colors.black38, fontSize: text_16),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 10),
                        //   child: Container(
                        //     child: Image.asset('assets/images/image9.png',)
                        //   ),
                        // )
                      ],
                    ),
                  ),

                  //Divider green below tab title product
                  Container(
                    height: size_2_w,
                    color: Colors.green,
                  ),

                  CustomScrollView(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    controller: _controller,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: EdgeInsets.all(size_6_w),
                        sliver: SliverGrid(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            crossAxisSpacing: size_6_w,
                            mainAxisSpacing: size_6_w,
                            height: size_150_w
                          ),
                          delegate: SliverChildBuilderDelegate(
                                (context, index) => ItemCategory(
                                  product: value.products[index],
                                  data: value.products[index],
                                ),
                            childCount: value.products.length,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: value.canLoadMore ? BuildLoadMore() : SizedBox(),
                      ),
                    ],
                  ),
                ],
              ),

              //Button PAY + REVIEW
              Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Expanded(
                      flex:1,
                      child: SizedBox(
                        height: size_100_w,
                        child: FlatButton(
                          color: kColor6EC89B,
                          onPressed: () {
                            value.openPayPage();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: size_20_w),
                            child: Column(
                              children: [
                                Text(
                                  LocaleKeys.pay.tr(),
                                  style:
                                  TextStyle(fontSize: text_24, color: Colors.white),
                                ),
                                Text(
                                  '\$143.39',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: SizedBox(
                        height: size_100_w,
                        child: FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            value.openReviewPage();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: size_20_w),
                            child: Column(
                              children: [
                                Text(
                                  LocaleKeys.review.tr(),
                                  style: TextStyle(
                                      fontSize: text_24, color: kColor6EC89B),
                                ),
                                Text(
                                  '4 items',
                                  style: TextStyle(color: kColor6EC89B),
                                )
                              ],
                            ),
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
