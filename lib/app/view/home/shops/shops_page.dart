import 'package:business_suite_mobile_pos/app/view/home/shops/list_shop/item_list_shop.dart';
import 'package:business_suite_mobile_pos/app/viewmodel/base_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../di/injection.dart';
import '../../../module/common/config.dart';
import '../../../module/common/extension.dart';
import '../../../module/repository/data_repository.dart';
import '../../../module/res/style.dart';
import '../../empty/empty_page.dart';
import '../../widget_utils/anims/touchable_opacity.dart';
import '../../widget_utils/base_scaffold_safe_area.dart';
import '../../widget_utils/bottom_sheet/bottom_sheet_utils.dart';
import '../../widget_utils/custom/default_loading_progress.dart';
import '../../widget_utils/custom/loadmore.dart';
import 'appbar_shops.dart';
import 'grid_shop/item_grid_shop.dart';
import 'shops_viewmodel.dart';

class ShopsPage extends PageProvideNode<ShopsViewModel> {
  ShopsPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return ShopsContent(viewModel);
  }
}

class ShopsContent extends StatefulWidget {
  final ShopsViewModel _shopListViewModel;

  ShopsContent(this._shopListViewModel);

  @override
  State<ShopsContent> createState() => _ShopsContentState();
}

class _ShopsContentState extends State<ShopsContent>
    with SingleTickerProviderStateMixin {
  ShopsViewModel get shopListViewModel => widget._shopListViewModel;

  @override
  void initState() {
    shopListViewModel.scrollController.addListener(() {
      shopListViewModel.onScroll();
    });
    shopListViewModel.checkModulePOSApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScaffoldSafeArea(
      transparentStatusBar: 0.2,
      backgroundColor: kColorF8F9FA,
      customAppBar: AppBarShops(
        badgeCount: 1,
        avatarUrl: getAvatarProfile(),
        onClickAvatar: () => ButtomSheetUtils.bottomSheetActionAccount(
          context,
          onPreferences: () {},
          onLogout: () {
            getIt<DataRepository>().logout();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          //appbar2
          Container(
            height: size_46_w,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: size_10_w,
                ),
                Row(
                  children: [
                    Container(
                        height: size_32_w,
                        decoration: BoxDecoration(
                          color: kColor71639e,
                          borderRadius: BorderRadius.circular(size_2_r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: size_10_w),
                          child: Center(
                            child: Text(
                              LocaleKeys.create.tr(),
                              style: TextStyle(
                                  fontSize: text_12, color: Colors.white),
                            ),
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: size_1_w,
                            color: kColorBFBFBF,
                          ),
                          borderRadius: BorderRadius.circular(size_2_r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size_10_w, vertical: size_6_w),
                          child: Container(
                            height: size_18_w,
                            width: size_18_w,
                            child: SvgPicture.asset(
                              'assets/icons/ic_download.svg',
                              width: size_18_w,
                              height: size_18_w,
                              color: Colors.black54,
                            ),
                          ),
                        )),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: size_20_w,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.filter_alt,
                            size: size_18_w,
                            color: Colors.black54,
                          ),
                          label: Text(LocaleKeys.filters.tr(),
                              style: TextStyle(
                                  fontSize: text_12, color: Colors.black87)),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 0,
                              padding:
                                  EdgeInsets.symmetric(horizontal: size_6_w)),
                        ),
                      ),
                      Container(
                        height: size_20_w,
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.table_rows,
                            size: size_18_w,
                            color: Colors.black54,
                          ),
                          label: Text(LocaleKeys.group_by.tr(),
                              style: TextStyle(
                                  fontSize: text_12, color: Colors.black87)),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 0,
                              padding:
                                  EdgeInsets.symmetric(horizontal: size_6_w)),
                        ),
                      ),
                      TouchableOpacity(
                        onPressed: () => shopListViewModel.changeListUI(),
                        child: Consumer<ShopsViewModel>(
                            builder: (context, value, child) {
                          return Container(
                            height: size_18_w,
                            width: size_18_w,
                            child: SvgPicture.asset(
                              value.isGrid
                                  ? 'assets/icons/ic_gridview.svg'
                                  : 'assets/icons/ic_listview.svg',
                              width: size_18_w,
                              height: size_18_w,
                              color: Colors.black54,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          Consumer<ShopsViewModel>(builder: (context, value, child) {
            if (value.isGrid) {
              return Container();
            } else {
              return Container(
                color: kColorE6E6E6,
                height: size_40_w,
                width: double.infinity,
                child: Row(
                  children: [
                    //text Point of Sale
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: size_36_w,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Transform.scale(
                                  scale: 0.8,
                                  child: Checkbox(
                                    side: BorderSide(
                                        color: Colors.black54, width: size_2_w),
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.all(kColor875a7b),
                                    hoverColor: kColor875a7b,
                                    value: value.isSelectAll,
                                    onChanged: (bool? value) =>
                                        shopListViewModel.onSelectChange(value),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              width: size_1_w,
                              color: kColordfdfdf,
                            ),
                            SizedBox(
                              width: size_6_w,
                            ),
                            Text(
                              LocaleKeys.point_of_sale.tr(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: text_14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: size_1_w,
                      color: kColordfdfdf,
                    ),
                    //text Company
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: size_6_w),
                        child: Text(
                          LocaleKeys.company.tr(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: text_14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),

          //body
          Expanded(
            child: Consumer<ShopsViewModel>(
              builder: (context, value, child) {
                switch (value.loadingState) {
                  case LoadingState.LOADING:
                    return BuildProgressLoading();
                  case LoadingState.EMPTY:
                    return EmptyWidget(
                      onRefresh: () {
                        value.refreshData();
                        return value.completer.future;
                      },
                      imgEmpty: 'assets/images/img_empty_shop.svg',
                      emptyText: LocaleKeys.there_are_no_shops.tr(),
                    );
                  case LoadingState.DONE:
                    return RefreshIndicator(
                        color: kColorPrimary,
                        onRefresh: () {
                          value.refreshData();
                          return value.completer.future;
                        },
                        child: value.isGrid
                            ? CustomScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                controller: value.scrollController,
                                slivers: <Widget>[
                                  SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        return ItemGridShop(
                                          shop: value.shops[index],
                                          onClickItem: () {
                                            value.userSharePref
                                                .saveShop(value.shops[index]);
                                            value.openDetailShop();
                                          },
                                        );
                                      },
                                      childCount: value.shops.length,
                                    ),
                                  ),
                                  SliverToBoxAdapter(
                                    child: value.canLoadMore && value.isLoading
                                        ? BuildLoadMore()
                                        : SizedBox(),
                                  ),
                                ],
                              )
                            : CustomScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                controller: value.scrollController,
                                slivers: <Widget>[
                                  SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        return ItemListShop(
                                          index: index,
                                          shop: value.shops[index],
                                          onClickItem: () {
                                            value.userSharePref
                                                .saveShop(value.shops[index]);
                                            value.openDetailShop();
                                          },
                                          onCheckItem: (bool value) {},
                                        );
                                      },
                                      childCount: value.shops.length,
                                    ),
                                  ),
                                  SliverToBoxAdapter(
                                    child: value.canLoadMore && value.isLoading
                                        ? BuildLoadMore()
                                        : SizedBox(),
                                  ),
                                ],
                              ));
                  default:
                    return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
