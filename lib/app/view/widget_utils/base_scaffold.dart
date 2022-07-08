import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../module/common/system_utils.dart';
import '../../module/res/colors.dart';
import '../../module/res/text.dart';

class BaseScaffold extends StatelessWidget {
  final Function()? onBackPress;
  final String title;
  final String? subtitle;
  final Widget? body;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool hideBackButton;
  final bool? isTitleCenter;
  final Widget? widgetCustomTitle;

  const BaseScaffold({
    Key? key,
    this.onBackPress,
    required this.title,
    this.body,
    this.subtitle,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.actions,
    this.backgroundColor,
    this.hideBackButton = false,
    this.isTitleCenter = true,
    this.widgetCustomTitle = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    void _onBackPress() {
      Navigator.of(context).pop();
    }
    //SystemUtils.setupStatusBar(0.2);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: isTitleCenter,
        title: widgetCustomTitle == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    // style: Theme.of(context).appBarTheme.titleTextStyle,
                    style: TextStyle( fontSize: text_16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,)
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: textTheme.bodyText2!.copyWith(
                        fontSize: text_14,
                        color: kCGrey136,
                      ),
                    )
                ],
              )
            : widgetCustomTitle,
        leading: hideBackButton
            ? null
            : IconButton(
                icon: Icon(
                  CupertinoIcons.back,
                  color: kColorPrimary,
                ),
                onPressed: onBackPress ?? _onBackPress,
              ),
        actions: actions,
        automaticallyImplyLeading: false,
      ),
      body: body,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
