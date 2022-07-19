import 'package:business_suite_mobile_pos/app/view/home/add_customer/add_customer_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/appbar_order_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:business_suite_mobile_pos/app/model/customer_add_country.dart';
import 'package:business_suite_mobile_pos/app/view/home/add_customer/add_customer_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../flavors.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../di/injection.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/style.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../widget_utils/base_scaffold_safe_area.dart';
import '../customer_list/customer_list_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/customer_list/customer_list_viewmodel.dart';

class AddCustomerPage extends PageProvideNode<AddCustomertViewModel> {
  AddCustomerPage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return AddCustomerContent(viewModel);
  }
}

class AddCustomerContent extends StatefulWidget {
  AddCustomertViewModel _addCustomertViewModel;

  AddCustomerContent(this._addCustomertViewModel);

  @override
  State<AddCustomerContent> createState() => _AddCustomerContentState();
}

class _AddCustomerContentState extends State<AddCustomerContent> {
  AddCustomertViewModel get addCustomertViewModel => widget._addCustomertViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldSafeArea(
      transparentStatusBar: 0.2,
      backgroundColor: kColorBackground,
      customAppBar: AppBarOrderList(
        badgeCount: 1,
        avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
      ),
      body: Consumer<AddCustomertViewModel>(builder: (context, value, child) {
        return Container(
          color: kColorBackground,
          child: Column(
            children: <Widget>[
              //appbar1
              Padding(
                padding: EdgeInsets.only(
                    left: size_15_w, top: size_15_w, bottom: size_10_w),
                child: Row(
                  children: <Widget>[
                    // back button
                    InkWell(
                      onTap: () {
                        getIt<NavigationService>().back();
                      },
                      child: Container(
                        height: size_40_w,
                        width: size_40_w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: size_1_w,
                            color: kColorBFBFBF,
                          ),
                          color: kColorE6E6E6,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.keyboard_double_arrow_left,
                            color: kColor626482,
                            size: size_20_w,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:10 ),
                      child: InkWell(
                        onTap: () {
                          getIt<NavigationService>().back();
                        },
                        child: Container(
                          height: size_40_w,
                          width: size_40_w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: size_1_w,
                              color: kColorBFBFBF,
                            ),
                            color: kColorE6E6E6,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: kColor626482,
                              size: size_20_w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _cupertinoPicker(context, addCustomertViewModel.countrys, "_location",
                    addCustomertViewModel.countrys[0],
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: size_20_h,
                    horizontal: size_20_w,
                  ),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: kColor14161E,
                    borderRadius: BorderRadius.circular(size_10_r),
                  ),
                  child: Text(
                    addCustomertViewModel.countrys[0].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      //icon circle
                    Padding(
                      padding: EdgeInsets.only(right: size_280_w),
                      child: Container(
                      width: size_60_w,
                      height: size_60_w,
                      decoration: BoxDecoration(
                        color: kCWhite.withOpacity(0.25), // border color
                        shape: BoxShape.circle,
                      ),
                        child: Center(
                          child: Icon(
                            Icons.photo_camera,
                            color: kCBlack20,
                            size: size_40_w,
                          ),
                        ),
                      ),
                    ),
                      // textfield - name
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w, bottom: size_7_w),
                        child: Container(
                          height: size_45_w,
                          width: size_320_w,
                          decoration: BoxDecoration(
                            color: kCWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            autocorrect: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                  maxWidth: size_25_w, maxHeight: size_15_w),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: kColor2947C3,
                                ),
                              ),
                              hintText:
                              LocaleKeys.pos_name.tr(),
                              hintStyle: TextStyle(fontSize: size_35_w),
                              contentPadding:
                              EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 1.0),
                            ),
                          ),
                        ),
                      ),
                      //Street
                      Padding(
                        padding: EdgeInsets.only(right: size_280_w),
                        child: Text( LocaleKeys.street.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w,right: size_20_w, bottom: size_7_w),
                        child: Container(
                          height: size_35_w,
                          width: size_340_w,
                          decoration: BoxDecoration(
                            color: kCWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            autocorrect: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                  maxWidth: size_25_w, maxHeight: size_15_w),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: kColor2947C3,
                                ),
                              ),
                              hintText:
                              LocaleKeys.street.tr(),
                              hintStyle: TextStyle(fontSize: size_20_w),
                              contentPadding:
                              EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 10.0),
                            ),
                          ),
                        ),
                      ),
                      //City
                      Padding(
                        padding: EdgeInsets.only(right: size_280_w),
                        child: Text( LocaleKeys.city.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w,right: size_20_w, bottom: size_7_w),
                        child: Container(
                          height: size_35_w,
                          width: size_340_w,
                          decoration: BoxDecoration(
                            color: kCWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            autocorrect: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                  maxWidth: size_25_w, maxHeight: size_15_w),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: kColor2947C3,
                                ),
                              ),
                              hintText:
                              LocaleKeys.city.tr(),
                              hintStyle: TextStyle(fontSize: size_20_w),
                              contentPadding:
                              EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 10.0),
                            ),
                          ),
                        ),
                      ),
                      //Postcode
                      Padding(
                        padding: EdgeInsets.only(right: size_240_w),
                        child: Text( LocaleKeys.postcode.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w,right: size_20_w, bottom: size_7_w),
                        child: Container(
                          height: size_35_w,
                          width: size_340_w,
                          decoration: BoxDecoration(
                            color: kCWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            autocorrect: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                  maxWidth: size_25_w, maxHeight: size_15_w),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: kColor2947C3,
                                ),
                              ),
                              hintText:
                              LocaleKeys.zip.tr(),
                              hintStyle: TextStyle(fontSize: size_20_w),
                              contentPadding:
                              EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 10.0),
                            ),
                          ),
                        ),
                      ),
                      //State
                      Padding(
                        padding: EdgeInsets.only(right: size_280_w),
                        child: Text( LocaleKeys.state.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      //Country
                      Padding(
                        padding: EdgeInsets.only(right: size_280_w),
                        child: Text( LocaleKeys.country.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      //Language
                      Padding(
                        padding: EdgeInsets.only(right: size_240_w),
                        child: Text( LocaleKeys.language.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      //Email
                      Padding(
                        padding: EdgeInsets.only(right: size_280_w),
                        child: Text( LocaleKeys.email.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w, bottom: size_7_w),
                        child: Container(
                          height: size_35_w,
                          width: size_340_w,
                          decoration: BoxDecoration(
                            color: kCWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            autocorrect: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                  maxWidth: size_25_w, maxHeight: size_15_w),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: kColor2947C3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Phone
                      Padding(
                        padding: EdgeInsets.only(right: size_280_w),
                        child: Text( LocaleKeys.phone.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w, bottom: size_7_w),
                        child: Container(
                          height: size_35_w,
                          width: size_340_w,
                          decoration: BoxDecoration(
                            color: kCWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            autocorrect: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                  maxWidth: size_25_w, maxHeight: size_15_w),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: kColor2947C3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Barcode
                      Padding(
                        padding: EdgeInsets.only(right: size_260_w),
                        child: Text( LocaleKeys.barcode.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w, bottom: size_7_w),
                        child: Container(
                          height: size_35_w,
                          width: size_340_w,
                          decoration: BoxDecoration(
                            color: kCWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            autocorrect: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                  maxWidth: size_25_w, maxHeight: size_15_w),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: kColor2947C3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Tax ID
                      Padding(
                        padding: EdgeInsets.only(right: size_275_w),
                        child: Text( LocaleKeys.tax_id.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w, bottom: size_7_w),
                        child: Container(
                          height: size_35_w,
                          width: size_340_w,
                          decoration: BoxDecoration(
                            color: kCWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            autocorrect: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                  maxWidth: size_25_w, maxHeight: size_15_w),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: kColor2947C3,
                                ),
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
        );
      }),
    );
  }
void _cupertinoPicker(BuildContext context, list, String target, decision) {
  int _selectedIndex = 0;
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return Container(
        height: size_300_h,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: size_10_w,
              ),
              child: Row(
                children: [
                  TextButton(
                      child: const Text('閉じる'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Spacer(),
                  TextButton(
                    child: const Text('決定'),
                    onPressed: () {
                      decision(target, list[_selectedIndex]);
                      Navigator.of(context).pop(list[_selectedIndex]);
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: CupertinoPicker(
                looping: false,
                itemExtent: size_40_h,
                children:
                    list.map((item) => new Text(item.name!)).toList(),
                onSelectedItemChanged: (index) {
                  _selectedIndex = index;
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

}

