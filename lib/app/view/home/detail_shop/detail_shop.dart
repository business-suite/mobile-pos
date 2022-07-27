import 'package:business_suite_mobile_pos/app/module/common/navigator_screen.dart';
import 'package:business_suite_mobile_pos/app/module/res/dimens.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/appbar_shop.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/item_category.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/item_menu.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/base_scaffold_safe_area.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../flavors.dart';
import '../../../di/injection.dart';
import '../../../module/res/style.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../widget_utils/custom/custom_sliver_grid_delegate.dart';
import '../../widget_utils/custom/loadmore.dart';
import 'detail_shop_viewmodel.dart';
import 'item_bill.dart';

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

class _SliderView extends StatefulWidget {
  final DetailShopViewModel detailShopViewModel;
  final Function(String)? onItemClick;

  _SliderView({Key? key, this.onItemClick, required this.detailShopViewModel})
      : super(key: key);

  @override
  State<_SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<_SliderView> {
  DetailShopViewModel get detailShopViewModel => widget.detailShopViewModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      // width: size.width/2,
      color: kColorf0eeee,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: size_8_w,
              bottom: size_4_w,
              left: size_10_w,
              right: size_10_w,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: kColorcacaca,
                      borderRadius: BorderRadius.circular(size_2_w)),
                  padding: EdgeInsets.symmetric(
                      horizontal: size_1_w, vertical: size_1_w),
                  child: InkWell(
                    onTap: () {
                      detailShopViewModel.keySlider.currentState!.closeSlider();
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      color: kColorffffff,
                      height: size_35_w,
                      width: size_35_w,
                      padding: EdgeInsets.all(size_10_w),
                      child: SvgPicture.asset(
                        'assets/icons/ic_angles_left.svg',
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: kColorcacaca,
                      borderRadius: BorderRadius.circular(size_2_w)),
                  padding: EdgeInsets.symmetric(
                      horizontal: size_1_w, vertical: size_1_w),
                  child: Container(
                    alignment: Alignment.topRight,
                    color: kColorffffff,
                    height: size_35_w,
                    width: size_35_w,
                    padding: EdgeInsets.all(size_10_w),
                    child: SvgPicture.asset(
                      'assets/icons/ic_search.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size_10_w, top: size_4_w, bottom: size_4_w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: kColor64AF8A,
                      borderRadius: BorderRadius.circular(size_3_w)),
                  padding: EdgeInsets.symmetric(
                      horizontal: size_1_w, vertical: size_1_w),
                  child: Container(
                    height: size_45_w,
                    width: size_100_w,
                    child: FlatButton(
                      onPressed: () {
                        detailShopViewModel.keySlider.currentState!
                            .closeSlider();
                      },
                      child: Text(
                        LocaleKeys.new_order.tr(),
                        style: TextStyle(
                          fontSize: text_14,
                          color: Colors.white,
                        ),
                      ),
                      color: kColor6EC89B,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: InkWell(
                onTap: () {
                  detailShopViewModel.keySlider.currentState!.closeSlider();
                },
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.detailShopViewModel.bills.length,
                  itemBuilder: (context, index) => ItemBill(
                    item: widget.detailShopViewModel.bills[index],
                    onClickItem: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailShopState extends State<_DetailShopContent> {
  DetailShopViewModel get detailShopViewModel => widget._detailShopViewModel;

  @override
  void initState() {
    super.initState();
    detailShopViewModel.getCategoryProducts();
    detailShopViewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldSafeArea(
      transparentStatusBar: 0.2,
      backgroundColor: Colors.white70,
      customAppBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: SliderDrawer(
        key: detailShopViewModel.keySlider,
        appBar: AppBarShop(
          badgeCount: 1,
          onClickAvatar: () => getIt<NavigationService>().signOut(),
          onClickTicKet: () {
            detailShopViewModel.keySlider.currentState!.openSlider();
          },
          avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
        ),
        sliderOpenSize: 179,
        slider: _SliderView(
          detailShopViewModel: detailShopViewModel,
          onItemClick: (title) {
            detailShopViewModel.keySlider.currentState!.closeSlider();
          },
        ),
        child: Consumer<DetailShopViewModel>(builder: (context, value, child) {
          return Container(
            color: kColorBackground,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //List tab title product
                Container(
                  width: double.infinity,
                  height: size_50_w,
                  color: kColorD3D3D3,
                  padding: EdgeInsets.only(left: size_12_w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Ink(
                        child: InkWell(
                          onTap: () {
                            detailShopViewModel.homeMenu();
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: size_8_w),
                            child: SvgPicture.asset(
                              'assets/icons/ic_home.svg',
                              height: size_24_w,
                              width: size_24_w,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: value.isHome
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                child: Container(
                                  height: size_50_w,
                                  padding: EdgeInsets.only(left: size_6_w),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: value.categoryProducts.length,
                                    itemBuilder: (context, index) => ItemMenu(
                                      category: value.categoryProducts[index],
                                      onClickItem: () {

                                        detailShopViewModel.changeMenu(index);
                                      },
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/ic_next.svg',
                                    height: size_50_w,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: size_8_w, right: size_12_w),
                                    child: Text(
                                      value.categoryProducts.length >
                                              value.lastIndexMenu
                                          ? value
                                                  .categoryProducts[
                                                      value.lastIndexMenu]
                                                  .name ??
                                              ''
                                          : '',
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: text_14),
                                    ),
                                  ),
                                  Container(width: 1.0, color: kColorc7c7c7),
                                ],
                              ),
                      )
                    ],
                  ),
                ),

                //Divider green below tab title product
                Container(
                  height: size_2_w,
                  color: Colors.green,
                ),

                Expanded(
                  child: Stack(
                    children: [
                      CustomScrollView(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        controller: value.scrollController,
                        slivers: <Widget>[
                          SliverPadding(
                            padding: EdgeInsets.only(
                                left: size_6_w,
                                right: size_6_w,
                                top: size_6_w,
                                bottom: size_106_w),
                            sliver: SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: size_6_w,
                                      mainAxisSpacing: size_6_w,
                                      height: size_150_w),
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => ItemCategory(
                                  product: value.products[index],
                                ),
                                childCount: value.products.length,
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: value.canLoadMore
                                ? BuildLoadMore()
                                : SizedBox(),
                          ),
                        ],
                      ),
                      //Button PAY + REVIEW
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: size_100_w,
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.all(size_1_w),
                          color: kColorCACACA,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
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
                                          style: TextStyle(
                                              fontSize: text_24,
                                              color: Colors.white),
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
                              Container(
                                width: size_1_w,
                                color: kColorCACACA,
                              ),
                              Expanded(
                                flex: 1,
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
                                              fontSize: text_24,
                                              color: kColor6EC89B),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
