import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/locale_keys.g.dart';
import '../../di/injection.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/res/colors.dart';
import '../../module/res/dimens.dart';
import '../../module/res/text.dart';

class ErrorPage extends StatefulWidget {
  late String? message;

  ErrorPage({Key? key, this.message}) : super(key: key);

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  String get message =>
      widget.message ?? LocaleKeys.an_unexpected_error_has_occurred.tr();

  NavigationService get _navigationService => getIt<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, //disable back press
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding:
              EdgeInsets.symmetric(vertical: size_20_w, horizontal: size_20_w),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/img_error.svg',
                  width: size_200_w,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(height: size_20_w,),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: text_14,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  height: size_60_h,
                ),
                BouncingWidget(
                  duration: Duration(milliseconds: 100),
                  scaleFactor: 1.0,
                  onPressed: () {
                    _navigationService.refreshApp();
                  },
                  child: Container(
                    width: size_150_w,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(size_100_r),
                        color: kColorPrimary),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: size_10_w),
                      child: Center(
                        child: Text(
                          LocaleKeys.refresh.tr(),
                          style: kTSSVNGilroy.copyWith(
                              color: Colors.white,
                              fontSize: text_14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
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
