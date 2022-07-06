import 'package:business_suite_mobile_pos/app/view/home/detail_shop/review/review_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../flavors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../module/res/style.dart';
import '../../../../viewmodel/base_viewmodel.dart';
import '../../../widget_utils/base_scaffold_safe_area.dart';
import '../../../widget_utils/custom/custom_card.dart';
import '../../pay/item_keyboard.dart';
import '../appbar_shop.dart';
import 'item_review_keyboard.dart';

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
    return BaseScaffoldSafeArea(
      backgroundColor: kColorf0eeee,
      customAppBar: AppBarShop(
        badgeCount: 1,
        avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
      ),
      body: Consumer<ReviewViewModel>(builder: (context, value, child) {
        return Column(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: size_5_w),
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: kColorDDDDDD,
                      ),
                      iconSize: size_90_w,
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size_10_w),
                    child: Text(
                      LocaleKeys.this_order_is_empty.tr(),
                      style: TextStyle(color: kColorDDDDDD, fontSize: text_20),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorE2E2E2,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(size_10_r),
                      child: Row(
                        children: [
                          SizedBox(
                            height: size_10_w,
                          ),
                          Expanded(
                            child: Card(
                              color: kColorE2E2E2,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.outline,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(1, 1)),
                              ),
                              child: SizedBox(
                                width: size.width / 2,
                                height: size_20_w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.info_outlined,
                                      size: size_20_w,
                                      color: Colors.grey,
                                    ), // icon
                                    Text(
                                      LocaleKeys.info.tr(),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: text_20,
                                      ),
                                    ), // text
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              color: kColorE2E2E2,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.outline,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(1, 1)),
                              ),
                              child: SizedBox(
                                width: size_150_w,
                                height: size_40_w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.refresh,
                                      size: size_20_w,
                                      color: Colors.grey,
                                    ), // icon
                                    Text(
                                      LocaleKeys.refund.tr(),
                                      style: TextStyle(
                                        color: Colors.grey,
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
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Card(
                        color: kColorE2E2E2,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(1, 1)),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.refresh,
                                size: 20,
                                color: Colors.grey,
                              ),
                              // icon
                              Text(
                                LocaleKeys.quotation_order.tr(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              // text
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Card(
                                    color: Color(0xffE2E2E2),
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(1, 1)),
                                    ),
                                    child: SizedBox(
                                      width: size.width / 2,
                                      child: Text(
                                        LocaleKeys.info.tr(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: kColorE2E2E2,
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(1, 1)),
                                    ),
                                    child: SizedBox(
                                      width: size.width / 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.refresh,
                                            size: 20,
                                            color: Colors.grey,
                                          ), // icon
                                          Text(
                                            LocaleKeys.payment.tr(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                            ),
                                          ), // text
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    color: kColorE2E2E2,
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(1, 1)),
                                    ),
                                    child: SizedBox(
                                      width: size.width / 2,
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // icon
                                          Text(
                                            "<< Back",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                            ),
                                          ), // text
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: CustomCard(
                                borderRadiusValue: size_4_r,
                                shadow: Shadow.none,
                                backgroundColor: kColorBFBFBF,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(size_4_r)),
                                  clipBehavior: Clip.hardEdge,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: value.computers.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(1),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio: 1,
                                            crossAxisSpacing: 1,
                                            mainAxisSpacing: 1, crossAxisCount: 4,
                                            ),
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            ItemReviewKeyBoard(
                                      item: value.computers[index],
                                      onClickItem: () => value.onClickItem,
                                    ),
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
              ),
            ),
          ],
        );
      }),
    );
  }
}
