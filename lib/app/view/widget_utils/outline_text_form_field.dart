import 'package:business_suite_mobile_pos/app/view/widget_utils/touchable_opacity.dart';
import 'package:flutter/material.dart';

import '../../module/res/colors.dart';
import '../../module/res/dimens.dart';

class OutlineTextFormField extends StatefulWidget {
  final String? hintText;
  final bool obscureText;
  final bool enabled;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool readOnly;
  final String? Function(String?)? validator;

  const OutlineTextFormField({
    Key? key,
    this.hintText,
    this.obscureText = false,
    this.enabled = true,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.nextFocusNode,
    this.readOnly = false,
    this.validator,
  }) : super(key: key);

  @override
  _OutlineTextFormFieldState createState() => _OutlineTextFormFieldState();
}

class _OutlineTextFormFieldState extends State<OutlineTextFormField> {
  var isShowPassword = false;
  var hasError = false;

  @override
  void initState() {
    isShowPassword = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hintTextStyle = Theme.of(context).textTheme.subtitle1;
    final textStyle = Theme.of(context).textTheme.bodyText1;
    return Stack(
      children: [
        Container(
            alignment: Alignment.center,
            //color: Colors.blue,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: kCGrey136),
                ),
                hintStyle: hintTextStyle,
                labelText: widget.hintText,
                isDense: true,
                suffixIcon: widget.obscureText == true
                    ? TouchableOpacity(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        child: Image.asset('assets/images/ic_eye.png'),
                      )
                    : Container(
                        height: 0,
                        width: 0,
                      ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: size_14_h,
                  horizontal: size_10_w,
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kCGrey136),
                ),
              ),
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText ? isShowPassword : false,
              style: textStyle,
              enabled: widget.enabled,
              controller: widget.controller,
              onChanged: (value) {
                setState(() {});

                widget.onChanged?.call(value);
              },
              onFieldSubmitted: (value) {
                if (widget.textInputAction == TextInputAction.next) {
                  widget.nextFocusNode?.requestFocus();
                }
                widget.onFieldSubmitted?.call(value);
              },
              textInputAction: widget.textInputAction,
              focusNode: widget.focusNode,
              readOnly: widget.readOnly,
              validator: (value) {
                final errorText = widget.validator?.call(value);
                hasError = errorText == null;
                return errorText;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            )),
      ],
    );
  }
}
