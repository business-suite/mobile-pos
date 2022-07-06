import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../di/injection.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/res/colors.dart';
import '../../module/res/dimens.dart';
import '../../module/res/string.dart';
import '../../module/res/text.dart';

class ErrorPage extends StatefulWidget {
  late String? message;

  ErrorPage({Key? key, this.message}) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  String get message => widget.message ?? txt_an_unexpected_error_has_occurred;

  NavigationService get _navigationService => getIt<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, //disable back press
      child: Scaffold(
        backgroundColor: kColor202330,
        body: Container(
          padding:
              EdgeInsets.symmetric(vertical: size_20_w, horizontal: size_20_w),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kWhite,
                    fontSize: text_16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  height: size_10_h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size_40_w),
                  child: BouncingWidget(
                    duration: Duration(milliseconds: 100),
                    scaleFactor: 1.0,
                    onPressed: () {
                      _navigationService.refreshApp();
                    },
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: size_10_h),
                        child: Center(
                          child: Text(
                            txt_refresh,
                            style: kTSSVNGilroy.copyWith(
                                color: kColor247EF1,
                                fontSize: text_16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal),
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
      ),
    );
  }
}
