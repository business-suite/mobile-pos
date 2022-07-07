import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../generated/locale_keys.g.dart';
import '../../module/res/dimens.dart';
import '../../module/res/style.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../../viewmodel/life_cycle_base.dart';
import '../widget_utils/anims/touchable_opacity.dart';
import '../widget_utils/base_scaffold.dart';
import '../widget_utils/buttons/filled_button.dart';
import '../widget_utils/outline_text_form_field.dart';
import 'sign_in_viewmodel.dart';

class SignInPage extends PageProvideNode<SignInViewModel> {
  SignInPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _SignInContentPage(viewModel);
  }
}

class _SignInContentPage extends StatefulWidget {
  final SignInViewModel _signInViewModel;

  _SignInContentPage(this._signInViewModel);

  @override
  _SignInContentState createState() => _SignInContentState();
}

class _SignInContentState extends LifecycleState<_SignInContentPage> {
  SignInViewModel get signInViewModel => widget._signInViewModel;

  @override
  void initState() {
  }

  @override
  void dispose() {
    super.dispose();
    signInViewModel.emailFC.dispose();
    signInViewModel.passwordFC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BaseScaffold(
      title: LocaleKeys.sign_in.tr(),
      hideBackButton: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size_26_w,
            vertical: size_50_h,
          ),
          child: Column(
            children: [
              Container(
                //height: size_174_h,
                child: Column(
                  children: [
                    OutlineTextFormField(
                      focusNode: signInViewModel.emailFC,
                      hintText: LocaleKeys.email.tr(),
                      onChanged: (value) =>
                          signInViewModel.onChangeEmail(value),
                      validator: (value) => signInViewModel.invalidEmail(value),
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: size_28_h,
                    ),
                    OutlineTextFormField(
                      focusNode: signInViewModel.passwordFC,
                      hintText: LocaleKeys.password.tr(),
                      obscureText: true,
                      onChanged: (value) =>
                          signInViewModel.onChangePassword(value),
                      validator: (value) => signInViewModel.passwordValidator(
                          value, LocaleKeys.password.tr()),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => signInViewModel.signIn(),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TouchableOpacity(
                      onPressed: () {
                        //TODO: go to Forgot password
                        signInViewModel.gotoForgotPassPage();
                      },
                      child: Text(
                        LocaleKeys.forgot_password_question.tr(),
                        textAlign: TextAlign.right,
                        style:
                            TextStyle(fontSize: text_16, color: kColorPrimary),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size_20_h,
                  ),
                  Consumer<SignInViewModel>(
                    builder: (context, value, child) {
                      return FilledButton(
                        text: LocaleKeys.sign_in.tr().toUpperCase(),
                        enable: value.validate,
                        onPress: () => signInViewModel.signIn(),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
