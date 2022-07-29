import 'package:business_suite_mobile_pos/app/view/home/customer_tablet_list/customer_tablet_list_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/review/detail_item_review_customer.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/review/item_review_customer.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/review/review_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../../../main.dart';
import '../../../../di/injection.dart';
import '../../../../module/common/extension.dart';
import '../../../../module/common/navigator_screen.dart';
import '../../../../module/event_bus/event_bus.dart';
import '../../../../module/res/style.dart';
import '../../../../viewmodel/base_viewmodel.dart';
import '../../../widget_utils/base_scaffold_safe_area.dart';
import '../../../widget_utils/custom/custom_card.dart';
import '../../info/bottom_sheet_product_info.dart';
import '../../pay/pay_page.dart';
import '../appbar_shop.dart';
import 'review_item_keyboard.dart';

class ReviewPage extends PageProvideNode<ReviewViewModel> {
  ReviewPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return ReviewContent(viewModel);
  }
}

class ReviewContent extends StatefulWidget {
  final ReviewViewModel _reviewViewModel;

  ReviewContent(this._reviewViewModel);

  @override
  State<ReviewContent> createState() => _ReviewContentState();
}
class _ReviewContentState extends State<ReviewContent> {

  bool _hasBeenPressed = false;
  bool _hasBeenTextInfo = false;

  bool _hasBeenQuotationOrder = false;
  bool _hasBeenTextQuotatiOrder = false;


  @override
  void initState() {
    eventBus.on<CloseScreenSettleOrder>().listen((event) {
      getIt<NavigationService>().back();
    });
    super.initState();
  }

  ReviewViewModel get reviewViewModel => widget._reviewViewModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    //appbar
    return BaseScaffoldSafeArea(
      transparentStatusBar: 0.2,
      backgroundColor: kColorf0eeee,
      customAppBar: AppBarShop(
        badgeCount: 1,
        avatarUrl: getAvatarProfile(),
        onClickAvatar: ()=> getIt<NavigationService>().signOut(),
      ),
      body: Consumer<ReviewViewModel>(builder: (context, value, child) {
        return Stack(
          children: [
            //List order
            // SingleChildScrollView(
            //   child: Padding(
            //     padding: EdgeInsets.only(
            //       left: size_16_w,
            //       right: size_16_w,
            //       top: size_30_w,
            //     ),
            //     child: Center(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: <Widget>[
            //           Container(
            //             padding: EdgeInsets.only(bottom: size_5_w),
            //             child: SvgPicture.asset(
            //               'assets/icons/ic_shopping_cart.svg',
            //               color: kColorDDDDDD,
            //               height: size_80_w,
            //             ),
            //           ),
            //           Container(
            //             padding: EdgeInsets.only(bottom: size_5_w),
            //             child: Padding(
            //               padding: EdgeInsets.only(right: size_10_w),
            //               child: Text(
            //                 LocaleKeys.this_order_is_empty.tr(),
            //                 style: TextStyle(
            //                     color: kColorDDDDDD, fontSize: text_20),
            //               ),
            //             ),
            //           ),
            //
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding:  EdgeInsets.only(top: size_1_w,bottom: size_360_w),
              child: Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: value.reviews.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Material(
                              color: kColorf0eeee,
                              child: ItemReview(
                                item: value.reviews[index],
                                onClickItem: () => value.onClickItem,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: size_250_w),
                              child: Text(
                                LocaleKeys.s00041.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kColor6F6F6F,
                                  fontWeight: FontWeight.w300,
                                  fontSize: text_18,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: value.detailreviews.length,
                              itemBuilder: (context, index) =>
                                  Material(
                                color: kColorf0eeee,
                                child: DetailItemReview(
                                  item: value.detailreviews[index],
                                  onClickItem: () => value.onClickItem,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size_180_w,top: size_10_w),
                        child: Container(
                          height: size_2_w,
                          width: size_130_w,
                          color: kColor777777,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size_180_w),
                        child: Text(
                          LocaleKeys.total_review.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kColor6F6F6F,
                            fontWeight: FontWeight.w500,
                            fontSize: text_20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size_180_w),
                        child: Text(
                          LocaleKeys.taxes_review.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kColor6F6F6F,
                            fontWeight: FontWeight.w300,
                            fontSize: text_15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Wrap(
                children: <Widget>[
                  //Keyboard
                  Container(
                    color: kColor6EC89B,
                    height: size_3_w,
                  ),
                  Container(
                    color: kColorE2E2E2,
                    child: Wrap(
                      /* mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,*/
                      children: [
                        //Button Info & Refund
                        Padding(
                          padding: EdgeInsets.all(size_10_r),
                          child: Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: Card(
                                  color: _hasBeenPressed ? Colors.black : kColorE2E2E2,
                                  elevation: 1,
                                  shape:  RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: kColorBFBFBF,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size_10_w),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _hasBeenPressed = !_hasBeenPressed;
                                          _hasBeenTextInfo = !_hasBeenTextInfo;

                                        });
                                        prductInfoBottomSheet(
                                            onCloseClick: null,
                                          statusBarHeight: statusBarHeight
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // icon
                                          Icon(
                                            Icons.info_outlined,
                                            size: size_20_w,
                                            color: _hasBeenTextInfo ? Colors.white : kColor555555,
                                          ),
                                          SizedBox(
                                            width: size_6_w,
                                          ),
                                          Text(
                                            LocaleKeys.info.tr(),
                                            style: TextStyle(
                                              color: _hasBeenTextInfo ? Colors.white : kColor555555,
                                              fontSize: text_20,
                                            ),
                                          ), // text
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size_10_w,
                              ),
                              Expanded(
                                flex: 1,
                                child: Card(
                                  color: kColorE2E2E2,
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: kColorBFBFBF,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: size_10_w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.refresh,
                                          size: size_20_w,
                                          color: kColor555555,
                                        ),
                                        SizedBox(
                                          width: size_6_w,
                                        ),
                                        // icon
                                        Text(
                                          LocaleKeys.refund.tr(),
                                          style: TextStyle(
                                            color: kColor555555,
                                            fontSize: text_20,
                                          ),
                                        ), // text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //quotation/oder
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size_10_w),
                          child: Card(
                            color: _hasBeenQuotationOrder ? Colors.black : kColorE2E2E2,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: kColorBFBFBF,
                              ),
                            ),
                            child: Ink(
                              child: InkWell(
                                //goto order list page
                                onTap: () {
                                  reviewViewModel.gotoOrderListpage();
                                  setState(() {
                                    _hasBeenQuotationOrder = !_hasBeenQuotationOrder;
                                    _hasBeenTextQuotatiOrder = !_hasBeenTextQuotatiOrder;

                                  });

                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  height: size_40_w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        'assets/icons/ic_chain.svg',
                                        color: _hasBeenTextQuotatiOrder ? Colors.white : kColor555555,
                                        height: size_18_w,
                                      ),
                                      SizedBox(width: size_6_w),
                                      Text(
                                        LocaleKeys.quotation_order.tr(),
                                        style: TextStyle(
                                          color: _hasBeenTextQuotatiOrder ? Colors.white : kColor555555,
                                          fontSize: text_20,
                                        ),
                                      ),
                                      // text
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        //smallkeybroad
                        Padding(
                          padding: EdgeInsets.all(size_15_r),
                          child: CustomCard(
                            borderRadiusValue: 0,
                            shadow: Shadow.none,
                            padding: EdgeInsets.all(size_1_r),
                            backgroundColor: kColorBFBFBF,
                            child: StaggeredGrid.count(
                              crossAxisCount: 6,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1,
                              children: [
                                //customer
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[0],
                                    onClickItem: () {
                                      getIt<NavigationService>()
                                          .pushScreenWithFade(
                                              CustomerTabletListPage());
                                    },
                                  ),
                                ),
                                //1
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[1],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),
                                //2
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[2],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),
                                //3
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[3],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),
                                //Qty
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[4],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //payment chiếm 2 hàng 2 cột
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 2,
                                  child: Ink(
                                    child: InkWell(
                                      onTap: () => value.onClickItem,
                                      child: Container(
                                        decoration:
                                            BoxDecoration(color: kColorE2E2E2),
                                        child: SizedBox(
                                          width: size.width / 2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipOval(
                                                child: Material(
                                                  color: kColor565656,
                                                  child: InkWell(
                                                    onTap: () {
                                                      getIt<NavigationService>()
                                                          .pushScreenWithFade(
                                                              PayPage());
                                                    },
                                                    child: SizedBox(
                                                      width: size_56_w,
                                                      height: size_56_w,
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: kCWhite,
                                                        size: size_36_w,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ), // icon
                                              Text(
                                                LocaleKeys.payment.tr(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: kColor555555,
                                                  fontSize: text_15,
                                                ),
                                              ), // text
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                //4
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[5],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //5
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[6],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //6
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[7],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //Disc
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[8],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //7
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[9],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //8
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[10],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //9
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[11],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //Price
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[12],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //back and icon
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 2,
                                  mainAxisCellCount: 1,
                                  child: Ink(
                                    child: InkWell(
                                      onTap: () {
                                        getIt<NavigationService>().back();
                                        eventBus.fire(CloseScreenSettleOrder());
                                      },
                                      child: Container(
                                        decoration:
                                            BoxDecoration(color: kColorE2E2E2),
                                        child: SizedBox(
                                          width: size.width / 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons
                                                    .keyboard_double_arrow_left,
                                                color: kColor626482,
                                                size: size_15_w,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  getIt<NavigationService>()
                                                      .back();
                                                },
                                                child: Text(
                                                  LocaleKeys.back.tr(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: kColor555555,
                                                    fontSize: text_15,
                                                  ),
                                                ),
                                              ), // text
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                //+/-
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[13],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //0
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[14],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //.
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[15],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),

                                //clear x
                                StaggeredGridTile.count(
                                  crossAxisCellCount: 1,
                                  mainAxisCellCount: 1,
                                  child: ItemReviewKeyBoard(
                                    item: value.computers[16],
                                    onClickItem: () => value.onClickItem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
