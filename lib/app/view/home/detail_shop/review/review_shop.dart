import 'package:business_suite_mobile_pos/app/view/home/detail_shop/review/review_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/home_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/home_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/pay/pay_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../../../../flavors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../di/injection.dart';
import '../../../../module/common/navigator_screen.dart';
import '../../../../module/res/style.dart';
import '../../../../viewmodel/base_viewmodel.dart';
import '../../../widget_utils/base_scaffold_safe_area.dart';
import '../../../widget_utils/custom/custom_card.dart';
import '../../pay/item_keyboard.dart';
import '../appbar_shop.dart';
import 'review_item_keyboard.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
  ReviewViewModel get reviewViewModel => widget._reviewViewModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //appbar
    return BaseScaffoldSafeArea(
      backgroundColor: kColorf0eeee,
      customAppBar: AppBarShop(
        badgeCount: 1,
        avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
      ),
      body: Consumer<ReviewViewModel>(builder: (context, value, child) {
        return Column(
          children: <Widget>[
            //List order
            Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size_16_w,
                      right: size_16_w,
                      top: size_30_w,
                      bottom: size_16_w),
                  child: Container(
                    child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: size_5_w),
                          child: SvgPicture.asset(
                            'assets/icons/ic_shopping_cart.svg',
                            color: kColorDDDDDD,
                            height: size_90_w,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: size_5_w),
                          child: Padding(
                            padding: EdgeInsets.only(right: size_10_w),
                            child: Text(
                              LocaleKeys.this_order_is_empty.tr(),
                              style:
                                  TextStyle(color: kColorDDDDDD, fontSize: text_20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 110,
            ),
            //Keyboard
            Container(
              color: kColor6EC89B,
              height: size_3_w,
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorE2E2E2,
                child: Column(
                  children: [
                    //Button Info & Refund
                    Padding(
                      padding: EdgeInsets.all(size_10_r),
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: kColorE2E2E2,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: kColorBFBFBF,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: size_10_w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // icon
                                    Icon(
                                      Icons.info_outlined,
                                      size: size_20_w,
                                      color: kColor555555,
                                    ),
                                    SizedBox(
                                      width: size_6_w,
                                    ),
                                    Text(
                                      LocaleKeys.info.tr(),
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
                                padding:
                                    EdgeInsets.symmetric(vertical: size_10_w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                        color: kColorE2E2E2,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: kColorBFBFBF,
                          ),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: size_40_w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/icons/ic_chain.svg',
                                color: kColor555555,
                                height: size_18_w,
                              ),
                              SizedBox(width: size_6_w),
                              Text(
                                LocaleKeys.quotation_order.tr(),
                                style: TextStyle(
                                  color: kColor555555,
                                  fontSize: text_20,
                                ),
                              ),
                              // text
                            ],
                          ),
                        ),
                      ),
                    ),

                    //smallkeybroad
                    Expanded(
                      child:Padding(
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
                                    onClickItem: () => value.onClickItem,
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
                                        decoration: BoxDecoration(
                                            color: kColorE2E2E2),
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
                                                    onTap: () {},
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
                                      onTap: ()=>  Navigator.of(context).pop(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: kColorE2E2E2),
                                        child: SizedBox(
                                          width: size.width / 2,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.keyboard_double_arrow_left,
                                                color: kColor626482,
                                                size: size_15_w,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  getIt<NavigationService>()
                                                      .pushScreenWithSlideUp(
                                                      HomePage());
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
                            ))),
                      ),
                      // child: Padding(
                      //   padding: EdgeInsets.only(bottom: size_10_h),
                      //   child: CustomCard(
                      //     borderRadiusValue: 6,
                      //     shadow: Shadow.none,
                      //     padding: EdgeInsets.symmetric(horizontal: size_10_w),
                      //     backgroundColor: transparent,
                      //     child: Row(
                      //       children: [
                      //         Flexible(
                      //           child: Padding(
                      //             padding:
                      //                 EdgeInsets.symmetric(vertical: size_8_w),
                      //             child: Column(
                      //               children: [
                      //                 //customer
                      //                 Expanded(
                      //                   flex: 1,
                      //                   child: Container(
                      //                     decoration: BoxDecoration(
                      //                         border: Border(
                      //                           top: BorderSide(
                      //                               width: 1.0,
                      //                               color: kColorBFBFBF),
                      //                           left: BorderSide(
                      //                               width: 1.0,
                      //                               color: kColorBFBFBF),
                      //                           bottom: BorderSide(
                      //                               width: 1.0,
                      //                               color: kColorBFBFBF),
                      //                         ),
                      //                         color: Color(0xffE2E2E2)),
                      //                     child: SizedBox(
                      //                       width: size.width / 2,
                      //                       child: Align(
                      //                         alignment: Alignment.center,
                      //                         child: Text(
                      //                           LocaleKeys.customer.tr(),
                      //                           style: TextStyle(
                      //                             fontWeight: FontWeight.bold,
                      //                             color: kColor555555,
                      //                             fontSize: text_15,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 //payment and icon
                      //                 Expanded(
                      //                   flex: 2,
                      //                   child: Container(
                      //                     decoration: BoxDecoration(
                      //                         border: Border(
                      //                           left: BorderSide(
                      //                               width: 1.0,
                      //                               color: kColorBFBFBF),
                      //                         ),
                      //                         color: kColorE2E2E2),
                      //                     child: SizedBox(
                      //                       width: size.width / 2,
                      //                       child: Column(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.center,
                      //                         children: <Widget>[
                      //                           ClipOval(
                      //                             child: Material(
                      //                               color: kColor565656,
                      //                               child: InkWell(
                      //                                 onTap: () {},
                      //                                 child: SizedBox(
                      //                                   width: size_56_w,
                      //                                   height: size_56_w,
                      //                                   child: Icon(
                      //                                     Icons
                      //                                         .arrow_forward_ios,
                      //                                     color: kCWhite,
                      //                                     size: size_36_w,
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ), // icon
                      //                           Text(
                      //                             LocaleKeys.payment.tr(),
                      //                             textAlign: TextAlign.center,
                      //                             style: TextStyle(
                      //                               fontWeight: FontWeight.bold,
                      //                               color: kColor555555,
                      //                               fontSize: text_15,
                      //                             ),
                      //                           ), // text
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 //back and icon
                      //                 Expanded(
                      //                   flex: 1,
                      //                   child: Container(
                      //                     decoration: BoxDecoration(
                      //                         border: Border(
                      //                           top: BorderSide(
                      //                               width: 1.0,
                      //                               color: kColorBFBFBF),
                      //                           left: BorderSide(
                      //                               width: 1.0,
                      //                               color: kColorBFBFBF),
                      //                           bottom: BorderSide(
                      //                               width: 1.0,
                      //                               color: kColorBFBFBF),
                      //                         ),
                      //                         color: kColorE2E2E2),
                      //                     child: SizedBox(
                      //                       width: size.width / 2,
                      //                       child: Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.center,
                      //                         children: <Widget>[
                      //                           Icon(
                      //                             Icons
                      //                                 .keyboard_double_arrow_left,
                      //                             color: kColor626482,
                      //                             size: size_15_w,
                      //                           ),
                      //                           InkWell(
                      //                             onTap: () {
                      //                               getIt<NavigationService>()
                      //                                   .pushScreenWithSlideUp(
                      //                                       HomePage());
                      //                             },
                      //                             child: Text(
                      //                               LocaleKeys.back.tr(),
                      //                               textAlign: TextAlign.center,
                      //                               style: TextStyle(
                      //                                 fontWeight:
                      //                                     FontWeight.bold,
                      //                                 color: kColor555555,
                      //                                 fontSize: text_15,
                      //                               ),
                      //                             ),
                      //                           ), // text
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         //numberkeybroad
                      //         Flexible(
                      //           child: CustomCard(
                      //             borderRadiusValue: 0,
                      //             shadow: Shadow.none,
                      //             padding: EdgeInsets.zero,
                      //             backgroundColor: kColorBFBFBF,
                      //             child: GridView.builder(
                      //               physics: NeverScrollableScrollPhysics(),
                      //               itemCount: value.computers.length,
                      //               shrinkWrap: true,
                      //               padding: EdgeInsets.all(1),
                      //               gridDelegate:
                      //                   SliverGridDelegateWithFixedCrossAxisCount(
                      //                 childAspectRatio: 1,
                      //                 crossAxisSpacing: 1,
                      //                 mainAxisSpacing: 1,
                      //                 crossAxisCount: 4,
                      //               ),
                      //               itemBuilder:
                      //                   (BuildContext context, int index) =>
                      //                       ItemReviewKeyBoard(
                      //                 item: value.computers[index],
                      //                 onClickItem: () => value.onClickItem,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
