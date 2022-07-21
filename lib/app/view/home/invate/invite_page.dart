// ignore_for_file: prefer_const_constructors

import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/app/view/home/invate/invite_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/invate/item_invite.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/base_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../module/res/colors.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../detail_shop/detail_shop_viewmodel.dart';
import '../detail_shop/review/review_viewmodel.dart';
import 'invite_viewmodel.dart';
import 'invite_viewmodel.dart';
import 'invite_viewmodel.dart';
import 'invite_viewmodel.dart';

class InVitePage extends PopupInvoicePage<InViteViewModel> {
  InVitePage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return InViteContent(viewModel);
  }
}

class InViteContent extends StatefulWidget {
  final InViteViewModel _inViteViewModel;

  InViteContent(this._inViteViewModel);

  @override
  State<InViteContent> createState() => _InViteContentState();
}

class _InViteContentState extends State<InViteContent> {
  InViteViewModel get inViteViewModel => widget._inViteViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      transparentStatusBar: 0.0,
      title: LocaleKeys.invoice.tr(),
      hideBackButton: false,
      body: Consumer<InViteViewModel>(builder: (context, value, child) {
        return Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: kColorf0eeee,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: size_10_w,bottom: size_5_w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.only(left: size_10_w),
                                  child: Text(
                                    LocaleKeys.name.tr(),
                                    style: TextStyle(color: kColor585858),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: size_6_w, left: size_15_w),
                                    child: Text(
                                      LocaleKeys.quantity.tr(),
                                      style: TextStyle(color: kColor585858),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: size_6_w, left: size_15_w),
                                  child: Text(
                                    LocaleKeys.price.tr(),
                                    style: TextStyle(color: kColor585858),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: size_5_w,
                            right: size_5_w,
                          ),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: value.invites.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => ItemInVite(
                              item: value.invites[index],
                              onClickItem: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: kColor3E3E3E,
                  height: size_1_w,
                  width: double.infinity,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: kColorf0eeee,
                    child: Padding(
                      padding: EdgeInsets.only(left: size_15_w, top: size_25_w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    LocaleKeys.total.tr(),
                                    style: TextStyle(
                                        fontSize: size_25_w,
                                        color: kColor3E3E3E,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "\$ 151.20",
                                    style: TextStyle(
                                        fontSize: size_25_w,
                                        color: kColor3E3E3E,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size_20_w,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    LocaleKeys.cash.tr(),
                                    style: TextStyle(
                                        fontSize: size_10_w,
                                        color: kColor3E3E3E),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "\$ -39.40",
                                    style: TextStyle(
                                        fontSize: size_12_w,
                                        color: kColor3E3E3E,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    LocaleKeys.name_change.tr(),
                                    style: TextStyle(
                                        fontSize: size_10_w,
                                        color: kColor3E3E3E),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    "\$ 0.00",
                                    style: TextStyle(
                                        fontSize: size_12_w,
                                        color: kColor3E3E3E,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
