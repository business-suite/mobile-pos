import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../generated/locale_keys.g.dart';
import '../../module/res/dimens.dart';
import '../../module/res/style.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../../viewmodel/life_cycle_base.dart';
import '../widget_utils/anims/touchable_opacity.dart';
import '../widget_utils/base_scaffold.dart';
import '../widget_utils/buttons/filled_button.dart';
import 'popup_select_database/popup_select_database.dart';
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
    signInViewModel.getDatabasesApi();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    signInViewModel.initLogin();
    signInViewModel.emailFC.dispose();
    signInViewModel.passwordFC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      transparentStatusBar: 0.0,
      title: LocaleKeys.sign_in.tr(),
      hideBackButton: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    left: size_26_w,
                    right: size_26_w,
                    top: size_50_h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          /*SvgPicture.asset(
                            'assets/images/logo2.svg',
                            width: size_200_w,
                            fit: BoxFit.fitWidth,
                          ),*/
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LocaleKeys.database.tr(),
                              style: styleTitleFieldLogin,
                            ),
                          ),
                          SizedBox(
                            height: size_6_w,
                          ),
                          Container(
                            height: size_48_w,
                            child: OutlineTextFormField(
                              widgetSuffix: TouchableOpacity(
                                onPressed: () {
                                  showPopupSelectDatabase(
                                      signInViewModel.databaseList,
                                      (value) => signInViewModel
                                          .onChangeDatabase(value));
                                },
                                child: Container(
                                  height: size_48_w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size_20_w,
                                      vertical: size_12_h),
                                  decoration: BoxDecoration(
                                      color: kColor685563,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4.0),
                                        bottomRight: Radius.circular(4.0),
                                      )),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        LocaleKeys.select.tr(),
                                        style: TextStyle(
                                            fontSize: text_14,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: size_6_w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/ic_database.svg',
                                        width: size_16_w,
                                        height: size_16_w,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              colorFocusBorder: kColorCED4DA,
                              readOnly: true,
                              isShowLable: false,
                              controller: signInViewModel.databaseController,
                              hintText: LocaleKeys.database.tr(),
                              validator: (value) =>
                                  signInViewModel.invalidDatabase(value),
                            ),
                          ),
                          SizedBox(
                            height: size_22_w,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LocaleKeys.email.tr(),
                              style: styleTitleFieldLogin,
                            ),
                          ),
                          SizedBox(
                            height: size_6_w,
                          ),
                          OutlineTextFormField(
                            isShowLable: false,
                            controller: signInViewModel.emailController,
                            keyboardType: TextInputType.emailAddress,
                            focusNode: signInViewModel.emailFC,
                            hintText: LocaleKeys.email.tr(),
                            onChanged: (value) =>
                                signInViewModel.onChangeEmail(value),
                            validator: (value) =>
                                signInViewModel.invalidEmail(value),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: size_22_w,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              LocaleKeys.password.tr(),
                              style: styleTitleFieldLogin,
                            ),
                          ),
                          SizedBox(
                            height: size_6_w,
                          ),
                          OutlineTextFormField(
                            isShowLable: false,
                            controller: signInViewModel.passController,
                            keyboardType: TextInputType.visiblePassword,
                            focusNode: signInViewModel.passwordFC,
                            hintText: LocaleKeys.password.tr(),
                            obscureText: true,
                            onChanged: (value) =>
                                signInViewModel.onChangePassword(value),
                            validator: (value) =>
                                signInViewModel.passwordValidator(
                                    value, LocaleKeys.password.tr()),
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) =>
                                signInViewModel.signInApi(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TouchableOpacity(
                                  onPressed: () {
                                    signInViewModel.openSignUp();
                                  },
                                  child: Text(
                                    LocaleKeys.don_t_have_an_account.tr(),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: text_14,
                                        color: kColorPrimary),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TouchableOpacity(
                                  onPressed: () {
                                    signInViewModel.openResetPassPage();
                                  },
                                  child: Text(
                                    LocaleKeys.reset_password.tr(),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: text_14,
                                        color: kColorPrimary),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size_20_h,
                          ),
                          Consumer<SignInViewModel>(
                            builder: (context, value, child) {
                              return FilledButton(
                                text: LocaleKeys.sign_in.tr().toUpperCase(),
                                enable: value.validate,
                                onPress: () => signInViewModel.signInApi(),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: kColorCED4DA)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size_4_w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TouchableOpacity(
                        onPressed: () {
                          signInViewModel.openManageDatabase();
                        },
                        child: Text(
                          LocaleKeys.manage_databases.tr(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: text_14, color: kColorPrimary),
                        ),
                      ),
                      Container(
                        height: size_20_w,
                        width: size_1_w,
                        color: kColorCED4DA,
                        margin:
                            EdgeInsets.only(left: size_10_w, right: size_10_w),
                      ),
                      TouchableOpacity(
                        onPressed: () {
                          signInViewModel.openPoweredOdoo();
                        },
                        child: Text(
                          LocaleKeys.powered_by_odoo.tr(),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: text_14, color: kColorPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
