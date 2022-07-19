// ignore_for_file: prefer_const_constructors

import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../di/injection.dart';
import '../../../../module/common/extension.dart';
import '../../../../module/common/navigator_screen.dart';
import '../../../../module/res/colors.dart';
import '../../../../module/res/dimens.dart';
import '../../../../module/res/text.dart';

void acceptScoreInputDialog() {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return CashInOutPage();
      });
}

class CashInOutPage extends StatefulWidget {
  CashInOutPage({Key? key}) : super(key: key);

  @override
  State<CashInOutPage> createState() => _CashInOutPageState();
}

class _CashInOutPageState extends State<CashInOutPage> {
  TextEditingController _reasonController = new TextEditingController();
  var _reasonErr =
      LocaleKeys.select_either_cash_in_or_cash_out_before_confirming.tr();
  var _reasonInvalid = false;

  int index = -1; //index: 0: cash in, 1: cash out, -1: none

  @override
  void initState() {
    super.initState();
  }

  changeFocusCash(int index) {
    setState(() {
      this.index = index;
    });
  }

  ReasonOnclick() {
    setState(() {
      if (_reasonController.text.length < 6) {
        _reasonInvalid = true;
      } else {
        _reasonInvalid = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26.withOpacity(0.5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kColorE0E0E0,
              borderRadius: BorderRadius.circular(size_10_w),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: size_10_w,
            ),
            padding: EdgeInsets.symmetric(
              vertical: size_10_w,
              horizontal: size_10_w,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: size_5_w,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, size_2_w, 0, size_2_w),
                  child: Row(
                    children: [
                      _buildBtnCash(LocaleKeys.cash_in.tr(), 0),
                      SizedBox(
                        width: size_5_w,
                      ),
                      _buildBtnCash(LocaleKeys.cash_out.tr(), 1),
                      SizedBox(
                        width: size_5_w,
                      ),
                      Expanded(
                        flex: 1,
                        child: Material(
                          color: kColorf0eeee,
                          child: Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              cursorHeight: size_25_w,
                              cursorColor: kColor565656,
                              decoration: InputDecoration(
                                suffixText: "\$",
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: kColor64AF8A, width: size_2_w),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kColorf0eeee, width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                ),
                              ),
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size_5_h,
                ),

                SizedBox(
                  height: size_15_h,
                ),
                Column(
                  children: [
                    Material(
                      child: TextFormField(
                        onChanged:  (value) {
                          setState(() {
                            if (value.contains(' ')) {
                              _reasonErr = value;
                            } else {
                              _reasonErr = '';
                            }
                          });
                        },
                        cursorHeight: size_25_w,
                        cursorColor: Colors.black87,
                        controller: _reasonController,
                        minLines: 2,
                        maxLines: 3,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                        //    errorText: _reasonInvalid ? _reasonErr : null,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kColor64AF8A, width: size_2_w),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size_1_r),
                              borderSide: BorderSide(
                                  color: Colors.black26.withOpacity(0.5),
                                  width: 1.0),
                            ),
                            hintText: 'Reason'),


                      ),
                    ),
                    _reasonInvalid ? Text(_reasonErr,style: TextStyle(color: Colors.red,fontWeight: FontWeight.normal),) : Container(),
                  ],
                ),
                SizedBox(
                  height: size_15_w,
                ),
                Container(
                  height: size_1_w,
                  color: kColorCACACA,
                ),
                SizedBox(
                  height: size_15_h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(size_1_w)),
                      padding: EdgeInsets.symmetric(
                          horizontal: size_1_w, vertical: size_1_w),
                      child: Container(
                        height: size_50_w,
                        width: size_100_w,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            LocaleKeys.cancel.tr(),
                            style: TextStyle(
                              fontSize: text_12,
                              color: kColor555555,
                            ),
                          ),
                          color: kColorE4E2E2,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size_5_w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(size_1_w)),
                      padding: EdgeInsets.symmetric(
                          horizontal: size_1_w, vertical: size_1_w),
                      child: Container(
                        height: size_50_w,
                        width: size_100_w,
                        child: FlatButton(
                          onPressed: () {
                            if (_reasonInvalid == false) {
                              _reasonErr;
                            } else {
                              Navigator.pop(context);
                            }
                            //TO DO: Logic confirm
                            ReasonOnclick();
                          },
                          child: Text(
                            LocaleKeys.confirm.tr(),
                            style: TextStyle(
                              fontSize: text_12,
                              color: kColor555555,
                            ),
                          ),
                          color: kColorE4E2E2,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBtnCash(String title, int indexSelect) {
    return Ink(
      child: InkWell(
        onTap: () => changeFocusCash(indexSelect),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(size_3_w)),
          padding:
              EdgeInsets.symmetric(horizontal: size_1_w, vertical: size_1_w),
          child: Container(
            color: index == indexSelect ? kColor64AF8A : kColorE4E2E2,
            height: size_50_w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size_12_w),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: text_12,
                    color: kColor555555,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
