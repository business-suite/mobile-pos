import 'dart:ffi';

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
import '../widget_utils/outline_text_form_field.dart';
import 'input_server_port_viewmodel.dart';

class InputServerPortPage extends PageProvideNode<InputServerPortViewModel> {
  InputServerPortPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return InputServerPortContent(viewModel);
  }
}

class InputServerPortContent extends StatefulWidget {
  final InputServerPortViewModel _inputServerPortViewModel;

  InputServerPortContent(this._inputServerPortViewModel);

  @override
  InputServerPortState createState() => InputServerPortState();
}

class InputServerPortState extends LifecycleState<InputServerPortContent> {
  InputServerPortViewModel get inputServerPortViewModel => widget._inputServerPortViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    inputServerPortViewModel.serverFC.dispose();
    inputServerPortViewModel.portFC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => inputServerPortViewModel.onDoubleBackToExit(),
      child: BaseScaffold(
        transparentStatusBar: 0.0,
        title: LocaleKeys.server_config.tr(),
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
                                LocaleKeys.server.tr(),
                                style: styleTitleFieldLogin,
                              ),
                            ),
                            SizedBox(
                              height: size_6_w,
                            ),
                            OutlineTextFormField(
                              isShowLable: false,
                              controller: inputServerPortViewModel.serverController,
                              keyboardType: TextInputType.emailAddress,
                              focusNode: inputServerPortViewModel.serverFC,
                              hintText: LocaleKeys.server.tr(),
                              onChanged: (value) =>
                                  inputServerPortViewModel.onChangeServer(value),
                              validator: (value) =>
                                  inputServerPortViewModel.invalidServer(value),
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(
                              height: size_22_w,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                LocaleKeys.port.tr(),
                                style: styleTitleFieldLogin,
                              ),
                            ),
                            SizedBox(
                              height: size_6_w,
                            ),
                            OutlineTextFormField(
                              isShowLable: false,
                              controller: inputServerPortViewModel.portController,
                              inputformatter: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              keyboardType: TextInputType.number,
                              focusNode: inputServerPortViewModel.portFC,
                              hintText: LocaleKeys.port.tr(),
                              onChanged: (value) =>
                                  inputServerPortViewModel.onChangePort(value),
                              validator: (value) =>
                                  inputServerPortViewModel.invalidPort(value),
                              textInputAction: TextInputAction.next,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: size_40_h,
                            ),
                            Consumer<InputServerPortViewModel>(
                              builder: (context, value, child) {
                                return FilledButton(
                                  text: LocaleKeys.submit.tr().toUpperCase(),
                                  enable: value.validate,
                                  onPress: () => inputServerPortViewModel.submit(),
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
            ],
          ),
        ),
      ),
    );
  }
}
