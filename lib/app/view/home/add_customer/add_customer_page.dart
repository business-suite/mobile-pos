import 'package:business_suite_mobile_pos/app/model/customer.dart';
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
  final textEditingController = TextEditingController();
  String? stateValue = LocaleKeys.none.tr();
  String? countryValue = LocaleKeys.none.tr();
  String? languageValue= LocaleKeys.english_us.tr();

  @override
  Widget build(BuildContext context) {
    //appbar
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
                      padding:  EdgeInsets.only(left:size_10_w ),
                      child: InkWell(
                        onTap: () {},
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
                            child: SvgPicture.asset(
                              'assets/icons/ic_floppy.svg',
                              width: size_16_w,
                              height: size_16_w,
                              color: kCBlack,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // cut line
                      Row(
                        children: List.generate(1200~/10, (index) => Expanded(
                          child: Container(
                            color: index%2==0?kCGrey240 :kCGrey102,
                            height: 2,
                          ),
                        )),
                      ),
                      //icon circle
                    InkWell(
                      onTap: (){},
                      child: Padding(
                        padding: EdgeInsets.only(right: size_280_w,top: size_22_w,bottom: size_20_w),
                        child: Container(
                        width: size_60_w,
                        height: size_60_w,
                        decoration: BoxDecoration(
                          color: kCWhite.withOpacity(0.9), // border color
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
                    ),
                      //name
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w, bottom: size_7_w),
                        child: Container(
                          height: size_45_w,
                          width: size_320_w,
                          child: Material(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(size_100_r),
                            child: TextField(
                              maxLines: 1,
                              cursorColor: kCBlack,
                              autocorrect: false,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size_5_r),
                                ),
                                suffixIconConstraints: BoxConstraints(
                                    maxWidth: size_25_w, maxHeight: size_15_w),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(size_5_r),
                                  borderSide: BorderSide(
                                    color: kCBlack,
                                    width: size_2_w,
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
                      ),
                      //Street
                      Padding(
                        padding: EdgeInsets.only(right: size_290_w),
                        child: Text( LocaleKeys.street.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w,right: size_20_w, bottom: size_7_w),
                        child: Container(
                          height: size_45_w,
                          width: size_340_w,
                          decoration: BoxDecoration(
                            color: kCWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
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
                                  color: kCBlack,
                                  width: size_2_w,
                                ),
                              ),
                              hintText:
                              LocaleKeys.street.tr(),
                              hintStyle: TextStyle(fontSize: size_10_w),
                              contentPadding:
                              EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 10.0),
                            ),
                          ),
                        ),
                      ),
                      //City
                      Padding(
                        padding: EdgeInsets.only(right: size_310_w),
                        child: Text( LocaleKeys.city.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w,right: size_20_w, bottom: size_7_w),
                        child: Container(
                          height: size_45_w,
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
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: kCBlack,
                                  width: size_2_w,
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
                        padding: EdgeInsets.only(right: size_255_w),
                        child: Text( LocaleKeys.postcode.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w,right: size_20_w, bottom: size_7_w),
                        child: Container(
                          height: size_45_w,
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
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: kCBlack,
                                  width: size_2_w,
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
                        padding: EdgeInsets.only(right: size_295_w),
                        child: Text( LocaleKeys.state.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:EdgeInsets.only(left: size_10_w, bottom: size_7_w, right: size_18_w),
                        child:  InputDecorator(
                          decoration: InputDecoration(
                              fillColor: kCWhite,
                              filled: true,
                              hintText: LocaleKeys.none.tr(),
                              hintStyle: TextStyle(fontSize: size_20_w,color:kCBlack),
                              contentPadding:
                              EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: kCBlack,
                                  width: size_2_w,
                                ),
                              ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                          isEmpty: stateValue == '',
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: stateValue,
                              icon: Icon(Icons.keyboard_arrow_down_sharp),
                              isExpanded: true,
                              isDense: true,
                              onChanged:
                                  (val) {
                                setState(() {
                                  stateValue = val.toString();
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                    value: LocaleKeys.none.tr(),
                                    child: Text(LocaleKeys.none.tr().toUpperCase(),
                                        style: TextStyle(fontSize: text_15, color: kCBlack))),
                                DropdownMenuItem(
                                    value: LocaleKeys.armed_forces_americas.tr().toUpperCase(),
                                    child: Text(LocaleKeys.armed_forces_americas.tr(),
                                        style: TextStyle(fontSize: text_15, color: kCBlack))),
                                DropdownMenuItem(
                                    value: LocaleKeys.armed_forces_europe.tr().toUpperCase(),
                                    child: Text(LocaleKeys.armed_forces_europe.tr(),
                                        style: TextStyle(fontSize: text_15, color: kCBlack))),
                                DropdownMenuItem(
                                    value: LocaleKeys.alaska.tr().toUpperCase(),
                                    child: Text(LocaleKeys.alaska.tr(),
                                        style: TextStyle(fontSize:text_15, color: kCBlack))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //Country
                      Padding(
                        padding: EdgeInsets.only(right: size_270_w),
                        child: Text( LocaleKeys.country.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size_10_w, bottom: size_7_w,right: size_18_w),
                        child:  InputDecorator(
                          decoration: InputDecoration(
                              fillColor: kCWhite,
                              filled: true,
                              contentPadding:
                              EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 10.0),
                              hintText:
                              LocaleKeys.none.tr(),
                              hintStyle: TextStyle(fontSize: size_20_w),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: kCBlack,
                                  width: size_2_w,
                                ),
                              ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                          isEmpty: countryValue == '',
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: countryValue,
                              icon: Icon(Icons.keyboard_arrow_down_sharp),
                              isDense: true,
                              onChanged: (val) {
                                setState(() {
                                  countryValue = val.toString();
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                    value: LocaleKeys.none.tr(),
                                    child: Text(LocaleKeys.none.tr(),
                                        style: TextStyle(fontSize: text_15, color: kCBlack))),
                                DropdownMenuItem(
                                    value: LocaleKeys.afghanistan.tr(),
                                    child: Text(LocaleKeys.afghanistan.tr(),
                                        style: TextStyle(fontSize: text_15, color: kCBlack))),
                                DropdownMenuItem(
                                    value: LocaleKeys.albania.tr(),
                                    child: Text(LocaleKeys.albania.tr(),
                                        style: TextStyle(fontSize: text_15, color: kCBlack))),
                                DropdownMenuItem(
                                    value: LocaleKeys.algeria.tr(),
                                    child: Text(LocaleKeys.algeria.tr(),
                                        style: TextStyle(fontSize: text_15, color: kCBlack))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //Language
                      Padding(
                        padding: EdgeInsets.only(right: size_250_w),
                        child: Text( LocaleKeys.language.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size_10_w, bottom: size_7_w,right: size_18_w),
                        child:  InputDecorator(
                          decoration: InputDecoration(
                              fillColor: kCWhite,
                              filled: true,
                              contentPadding:
                              EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: kCBlack,
                                  width: size_2_w,
                                ),
                              ),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                          isEmpty: languageValue == '',
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: languageValue,
                              isDense: true,
                              underline: SizedBox(),
                              onChanged: (val) {
                                setState(() {
                                  languageValue = val.toString();
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                    value: LocaleKeys.english_us.tr(),
                                    child: Text(LocaleKeys.english_us.tr(),
                                        style: TextStyle(fontSize: 15, color: kCBlack))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: size_290_w),
                        child: Text( LocaleKeys.email.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w, bottom: size_7_w,right: size_18_w),
                        child: Container(
                          height: size_45_w,
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
                                  color: kCBlack,
                                  width: size_2_w,
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
                        EdgeInsets.only(left: size_10_w, bottom: size_7_w,right: size_18_w),
                        child: Container(
                          height: size_45_w,
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
                                  color: kCBlack,
                                  width: size_2_w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Barcode
                      Padding(
                        padding: EdgeInsets.only(right: size_265_w),
                        child: Text( LocaleKeys.barcode.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w, bottom: size_7_w,right: size_18_w),
                        child: Container(
                          height: size_45_w,
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
                                  color: kCBlack,
                                  width: size_2_w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //Tax ID
                      Padding(
                        padding: EdgeInsets.only(right: size_280_w),
                        child: Text( LocaleKeys.tax_id.tr(),
                          style: TextStyle(
                              fontSize: text_20),),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.only(left: size_10_w, bottom: size_7_w,right: size_18_w),
                        child: Container(
                          height: size_45_w,
                          width: size_340_w,
                          decoration: BoxDecoration(
                            color: kCWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            cursorColor: Colors.grey,
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
                                  color: kCBlack,
                                  width: size_2_w,
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
}

