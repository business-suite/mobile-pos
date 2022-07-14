import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../generated/locale_keys.g.dart';
import '../../module/res/dimens.dart';
import '../../module/res/style.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../../viewmodel/life_cycle_base.dart';
import '../widget_utils/base_scaffold.dart';
import '../widget_utils/buttons/filled_button.dart';
import '../widget_utils/buttons/outline_button.dart';
import '../widget_utils/outline_text_form_field.dart';
import 'authentication_viewmodel.dart';

class AuthenticationPage extends PageProvideNode<AuthenticationViewModel> {
  AuthenticationPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _AuthenticationContentPage(viewModel);
  }
}

class _AuthenticationContentPage extends StatefulWidget {
  final AuthenticationViewModel _authenticationViewModel;

  _AuthenticationContentPage(this._authenticationViewModel);

  @override
  _AuthenticationContentState createState() => _AuthenticationContentState();
}

class _AuthenticationContentState
    extends LifecycleState<_AuthenticationContentPage> {
  AuthenticationViewModel get authenticationViewModel =>
      widget._authenticationViewModel;

  @override
  void initState() {}

  @override
  void dispose() {
    super.dispose();
    authenticationViewModel.emailFC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      transparentStatusBar: 0.0,
      onBackPress:  () => authenticationViewModel.cancel(),
      title: LocaleKeys.two_factor_authentication.tr(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size_26_w),
        child: Column(
          children: [
            buildSizeBox(),
            Text(
              LocaleKeys.msg_enter_six_digit_code.tr(),
              style: TextStyle(
                  fontSize: text_14,
                  color: kCGrey136,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            buildSizeBox(),
            OutlineTextFormField(
              obscureText: false,
              keyboardType: TextInputType.text,
              onChanged: (value) =>
                  authenticationViewModel.onChangeAuthenCode(value),
              hintText: LocaleKeys.authentication_code.tr(),
              validator: (value) =>
                  authenticationViewModel.invalidAuthenCode(value),
              onFieldSubmitted: (_) => authenticationViewModel.submit(),
            ),
            buildSizeBox(),
            _buildCheckBoxDontAskAgain(),
            buildSizeBox(),
            Consumer<AuthenticationViewModel>(
              builder: (context, value, child) {
                return FilledButton(
                  enable: authenticationViewModel.validate,
                  text: LocaleKeys.sign_in.tr(),
                  onPress: () => authenticationViewModel.submit(),
                );
              },
            ),
            Consumer<AuthenticationViewModel>(
              builder: (context, value, child) {
                return OutlineButton(
                  color: transparent,
                  text: LocaleKeys.cancel.tr(),
                  textStyle: (Theme.of(context).textTheme.button ?? TextStyle())
                      .copyWith(
                    fontSize: text_14,
                    color: kColorPrimary,
                  ),
                  onPress: () => authenticationViewModel.cancel(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Consumer<AuthenticationViewModel> _buildCheckBoxDontAskAgain() {
    return Consumer<AuthenticationViewModel>(
      builder: (context, value, child) {
        return BouncingWidget(
          duration: Duration(milliseconds: 65),
          onPressed: () {
            value.changeDontAskAgain();
          },
          child: SizedBox(
            height: size_36_h,
            child: Card(
              margin: EdgeInsets.only(top: size_10_h),
              color: transparent,
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(size_5_r)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      value.changeDontAskAgain();
                    },
                    child: Container(
                      height: size_16_w,
                      width: size_16_w,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: kColor7e7e7e, width: size_1_w),
                          shape: BoxShape.circle,
                          color: Colors.transparent),
                      child: Padding(
                        padding: EdgeInsets.all(size_1_w),
                        child: value.dontAskAgain
                            ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kColorPrimary),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: transparent),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size_5_h,
                  ),
                  Text(LocaleKeys.don_t_ask_again_on_this_device.tr(),
                      style:
                          TextStyle(color: Colors.black54, fontSize: text_14))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildSizeBox() => SizedBox(
        height: size_26_h,
      );
}
