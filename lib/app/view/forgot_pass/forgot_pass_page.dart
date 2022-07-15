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
import 'forgot_pass_viewmodel.dart';

class ForgotPasswordPage extends PageProvideNode<ForgotPassViewModel> {
  ForgotPasswordPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _ForgotPasswordContentPage(viewModel);
  }
}

class _ForgotPasswordContentPage extends StatefulWidget {
  final ForgotPassViewModel _forgotPassViewModel;

  _ForgotPasswordContentPage(this._forgotPassViewModel);

  @override
  _ForgotPassContentState createState() => _ForgotPassContentState();
}

class _ForgotPassContentState extends LifecycleState<_ForgotPasswordContentPage> {
  ForgotPassViewModel get forgotPassViewModel => widget._forgotPassViewModel;

  @override
  void initState() {}

  @override
  void dispose() {
    super.dispose();
    forgotPassViewModel.emailFC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      transparentStatusBar: 0.0,
      onBackPress: () => forgotPassViewModel.cancel(),
      title: LocaleKeys.forgot_password.tr(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size_26_w),
        child: Column(
          children: [
            buildSizeBox(),
            Text(
              LocaleKeys.msg_instruction.tr(),
              style: TextStyle(
                fontSize: text_14,
                color: kCGrey136,
                fontWeight: FontWeight.normal
              ),
              textAlign: TextAlign.center,
            ),
            buildSizeBox(),
            OutlineTextFormField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => forgotPassViewModel.onChangeEmail(value),
              hintText: LocaleKeys.email_address.tr(),
              validator: (value) => forgotPassViewModel.invalidEmail(value),
              onFieldSubmitted: (_) => forgotPassViewModel.submit(),
            ),
            buildSizeBox(),
            Consumer<ForgotPassViewModel>(
              builder: (context, value, child){
                return FilledButton(
                  enable: forgotPassViewModel.validate,
                  text: LocaleKeys.txt_continue.tr(),
                  onPress: () => forgotPassViewModel.submit(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildSizeBox() => SizedBox(
    height: size_26_h,
  );
}
