import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/locale_keys.g.dart';
import '../../module/res/colors.dart';
import '../../module/res/dimens.dart';
import '../../module/res/style.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../../viewmodel/life_cycle_base.dart';
import '../widget_utils/anims/touchable_opacity.dart';
import '../widget_utils/base_scaffold.dart';
import '../widget_utils/buttons/filled_button.dart';
import '../widget_utils/outline_text_form_field.dart';
import 'sign_up_viewmodel.dart';

class SignUpPage extends PageProvideNode<SignUpViewModel> {
  SignUpPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _SignUpContent(viewModel);
  }
}

class _SignUpContent extends StatefulWidget {
  final SignUpViewModel _signUpViewModel;

  _SignUpContent(this._signUpViewModel);

  @override
  _SignUpContentState createState() => _SignUpContentState();
}

class _SignUpContentState extends LifecycleState<_SignUpContent> {
  SignUpViewModel get signUpViewModel => widget._signUpViewModel;

  @override
  void initState() {
    /*FirebaseAuth.instance.signOut();
    loginViewModel.signOut();*/
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      transparentStatusBar: 0.0,
      title: LocaleKeys.sign_up.tr(),
      hideBackButton: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: size_26_w,
        ),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: signUpViewModel.formKey,
          child: Column(
            children: [
              SizedBox(
                height: size_40_h,
              ),

              //FULLNAME
              OutlineTextFormField(
                focusNode: signUpViewModel.fullNameFC,
                nextFocusNode: signUpViewModel.emailFC,
                hintText: LocaleKeys.full_name.tr(),
                onChanged: (value) => signUpViewModel.fullName = value,
                validator: (value) => signUpViewModel.requiredField(
                    value, LocaleKeys.full_name.tr()),
              ),
              SizedBox(
                height: size_12_h,
              ),

              //EMAIL
              OutlineTextFormField(
                focusNode: signUpViewModel.emailFC,
                nextFocusNode: signUpViewModel.passwordFC,
                hintText: LocaleKeys.email.tr(),
                onChanged: (value) => signUpViewModel.email = value,
                validator: (value) => signUpViewModel.invalidEmail(value),
              ),
              SizedBox(
                height: size_12_h,
              ),

              //PASSWORD
              OutlineTextFormField(
                focusNode: signUpViewModel.passwordFC,
                hintText: LocaleKeys.password.tr(),
                obscureText: true,
                onChanged: (value) => signUpViewModel.password = value,
                validator: (value) => signUpViewModel.passwordValidator(
                    value, LocaleKeys.password.tr()),
              ), SizedBox(
                height: size_12_h,
              ),

              //COMPANY NAME
              OutlineTextFormField(
                focusNode: signUpViewModel.companyNameFC,
                hintText: LocaleKeys.company_name.tr(),
                onChanged: (value) => signUpViewModel.companyName = value,
                validator: (value) => signUpViewModel.requiredField(
                    value, LocaleKeys.company_name.tr()),
              ),
              SizedBox(
                height: size_20_h,
              ),


              //PHONE MUMBER
              Consumer<SignUpViewModel>(
                builder: (BuildContext context, value, Widget? child) {
                  return Container(
                      alignment: Alignment.center,
                      //color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              //color: Colors.red,
                              // height: 60,
                              padding: EdgeInsets.all(0),
                              alignment: Alignment.topCenter,
                              //width: 50,
                              child: Checkbox(
                                checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.all(kColorPrimary),
                                value: value.agreeTermsOfService,
                                onChanged: (bool? data) =>
                                    signUpViewModel.onCheckChangeAgree(data),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 9,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  //color: Colors.red,
                                  alignment: Alignment.topLeft,
                                  //height: 60,
                                  child: Wrap(
                                    spacing: 0,
                                    direction: Axis.horizontal, //default
                                    alignment: WrapAlignment.start, //
                                    children: [
                                      Text(
                                        LocaleKeys.i_agree_to_the.tr() + ' ',
                                        style: TextStyle(
                                          fontSize: text_14,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          signUpViewModel.gotoTermOfService();
                                        },
                                        child: Text(
                                          LocaleKeys.term_of_service.tr() + ' ',
                                          style: TextStyle(
                                            fontSize: text_14,
                                            color: kColorPrimary,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        LocaleKeys.and.tr() + ' ',
                                        style: TextStyle(
                                          fontSize: text_14,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          signUpViewModel.gotoPrivacyPolicy();
                                        },
                                        child: Text(
                                          LocaleKeys.privacy_policy.tr() + ' ',
                                          style: TextStyle(
                                            fontSize: text_14,
                                            color: kColorPrimary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )))
                        ],
                      ));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    LocaleKeys.already_have_account.tr(),
                    style: TextStyle(
                        fontSize: text_14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: size_4_w,
                  ),
                  TouchableOpacity(
                    onPressed: () {
                      signUpViewModel.gotoSignInPage();
                    },
                    child: Text(
                      LocaleKeys.sign_in.tr(),
                      style: TextStyle(
                          fontSize: text_14,
                          fontWeight: FontWeight.w500,
                          color: kColorPrimary),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size_10_h,
              ),
              Consumer<SignUpViewModel>(
                builder: (context, value, child) {
                  return FilledButton(
                    text: LocaleKeys.sign_up.tr().toUpperCase(),
                    enable: value.validate,
                    onPress: () {
                      signUpViewModel.signUp();
                    },
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
