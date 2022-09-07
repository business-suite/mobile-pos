import 'package:business_suite_mobile_pos/app/view/home/customer_tablet_list/item_tablet_customer.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/appbar_order_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../di/injection.dart';
import '../../../module/common/config.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/repository/data_repository.dart';
import '../../../module/res/style.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../empty/empty_page.dart';
import '../../widget_utils/base_scaffold_safe_area.dart';
import '../../widget_utils/bottom_sheet/bottom_sheet_utils.dart';
import '../../widget_utils/custom/default_loading_progress.dart';
import '../../widget_utils/custom/loadmore.dart';
import 'customer_tablet_list_viewmodel.dart';

class CustomerTabletListPage
    extends PageProvideNode<CustomerTabletListViewModel> {
  CustomerTabletListPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return CustomerTabletListContent(viewModel);
  }
}

class CustomerTabletListContent extends StatefulWidget {
  CustomerTabletListViewModel _customerListViewModel;

  CustomerTabletListContent(this._customerListViewModel);

  @override
  State<CustomerTabletListContent> createState() =>
      _CustomerTabletListContentState();
}

class _CustomerTabletListContentState extends State<CustomerTabletListContent>
    with SingleTickerProviderStateMixin {
  CustomerTabletListViewModel get customerListViewModel =>
      widget._customerListViewModel;

  FocusNode node1 = FocusNode();

  @override
  void initState() {
    node1.addListener(() {
      print(node1.hasFocus);
    });
    customerListViewModel.scrollController.addListener(() {
      customerListViewModel.onScroll();
    });
    customerListViewModel.getCustomersApi();
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
        onClickAvatar: () => ButtomSheetUtils.bottomSheetActionAccount(
          context,
          onPreferences: () {
            getIt<NavigationService>().openPreferencesPage();
          },
          onLogout: () {
            getIt<DataRepository>().logout();
          },
        ),
      ),
      body: Consumer<CustomerTabletListViewModel>(
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
                emptyText: LocaleKeys.there_are_no_customers.tr(),
              );
            case LoadingState.DONE:
              return RefreshIndicator(
                  color: kColorPrimary,
                  onRefresh: () {
                    value.refreshData();
                    return value.completer.future;
                  },
                  child: CustomScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    controller: value.scrollController,
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return ItemCustomer(
                              index: index,
                              item: value.customers[index],
                              onClickItem: () {},
                            );
                          },
                          childCount: value.customers.length,
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
    );
  }
}
