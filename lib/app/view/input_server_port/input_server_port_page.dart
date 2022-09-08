import 'package:dropdown_button2/dropdown_button2.dart';
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

class InputServerPortState extends LifecycleState<InputServerPortContent>
    with SingleTickerProviderStateMixin {
  InputServerPortViewModel get inputServerPortViewModel =>
      widget._inputServerPortViewModel;
  late AnimationController _animationController;

  @override
  void initState() {
    inputServerPortViewModel.initData();
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
  }

  @override
  void dispose() {
    super.dispose();
    inputServerPortViewModel.serverFC.dispose();
    inputServerPortViewModel.portFC.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
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
                          Container(
                            height: size_48_w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*Container(
                                  */ /* height: size_48_w,*/ /*
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size_20_w,
                                      vertical: size_12_h),
                                  decoration: BoxDecoration(
                                      color: kColor685563,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        bottomLeft: Radius.circular(4.0),
                                      )),
                                  child: */ /*Row(
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
                                  )*/ /*

                                      Consumer<InputServerPortViewModel>(
                                          builder: (context, value, child) {
                                    return Container(
                                      width: 200,
                                      child: SelectDropList(
                                        childItem: (dynamic item,
                                                BuildContext context) =>
                                            ItemDropdownProtocol(
                                                item, context),
                                        onItemSelected: (optionItem) =>
                                            value.onSelectProtocol(
                                                optionItem),
                                        listOptionItems: value.protocols,
                                        itemSelected: value.protocol,
                                      ),
                                    );
                                  }),
                                ),*/
                                Consumer<InputServerPortViewModel>(
                                    builder: (context, value, child) {
                                  return DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      dropdownWidth: size_120_w,
                                      onMenuStateChange: (bool isExpand) {
                                        if (value.isExpand) {
                                          _animationController
                                            ..reverse(from: 0.5);
                                        } else {
                                          _animationController
                                            ..forward(from: 0.0);
                                        }
                                        value.isExpand = !value.isExpand;
                                        value.notifyListeners();
                                      },
                                      customButton: Container(
                                          width: size_120_w,
                                          height: size_48_w,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: size_14_w,
                                          ),
                                          decoration: BoxDecoration(
                                              color: kColor685563,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                bottomLeft:
                                                    Radius.circular(4.0),
                                              )),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              RotationTransition(
                                                turns: Tween(
                                                        begin: 0.0, end: 1.0)
                                                    .animate(
                                                        _animationController),
                                                child: SvgPicture.asset(
                                                  'assets/icons/ic_down.svg',
                                                  width: size_16_w,
                                                  height: size_16_w,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: size_10_w,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${value.protocol}://',
                                                  style: TextStyle(
                                                      fontSize: text_16,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          )),
                                      /*valueAlignment: Alignment.centerLeft,*/
                                      buttonHeight: size_48_w,
                                      buttonPadding: EdgeInsets.only(
                                          left: size_20_w,
                                          right: size_10_w,
                                          top: size_12_h,
                                          bottom: size_12_h),
                                      buttonDecoration: BoxDecoration(
                                          color: kColor685563,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            bottomLeft: Radius.circular(4.0),
                                          )),
                                      /* itemHeight:  40,*/
                                      itemPadding: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
                                      dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      dropdownElevation: 8,
                                      scrollbarRadius:
                                          const Radius.circular(40),
                                      //Null or Offset(0, 0) will open just under the button. You can edit as you want.
                                      offset: Offset(0, 0),
                                      dropdownOverButton: false,
                                      value: value.protocol,
                                      onChanged: (String? itemSelected) =>
                                          value.onSelectProtocol(itemSelected),
                                      isExpanded: value.isExpand,
                                      items: value.protocols
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    item,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: text_16,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    ),
                                  );
                                }),
                                Expanded(
                                  child: OutlineTextFormField(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(4.0),
                                        bottomRight: Radius.circular(4.0)),
                                    isShowLable: false,
                                    controller: inputServerPortViewModel
                                        .serverController,
                                    keyboardType: TextInputType.emailAddress,
                                    focusNode:
                                        inputServerPortViewModel.serverFC,
                                    hintText: LocaleKeys.server.tr(),
                                    onChanged: (value) =>
                                        inputServerPortViewModel
                                            .onChangeServer(value),
                                    validator: (value) =>
                                        inputServerPortViewModel
                                            .invalidServer(value),
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ],
                            ),
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
                                onPress: () =>
                                    inputServerPortViewModel.submit(),
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
    );
  }
}
