import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:business_suite_mobile_pos/app/module/common/navigator_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../di/injection.dart';
import '../../../module/res/style.dart';
import 'action_sheet.dart';

abstract class ButtomSheetUtils {
  static Future<T?> showCupertinoBottomSheet<T>({
    required BuildContext context,
    Widget? title,
    List<BottomSheetAction> actions = const [],
    CancelAction? cancelAction,
    Widget? preview,
    Color colorPreview = Colors.white,
    Color? colorBackgroundPreview,
    double? marginPreview,
  }) {
    final defaultTextStyle = /*Theme.of(context).textTheme.headline6 ??*/ TextStyle(fontSize: text_14);
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return ActionSheet(
          title: title,
          colorBackground: Colors.white,
          preview: preview != null
              ? Container(
              padding: EdgeInsets.all(0.0),
              color: colorPreview,
              child: SizedBox(
                height: size_300_h,
                child: preview,
              ))
              : null,
          colorBackgroundPreview: colorBackgroundPreview,
          marginPreview: marginPreview,
          actions: actions.map((action) {
            /// Modal Popup doesn't inherited material widget
            /// so need to provide one in case trailing or
            /// leading widget require a Material widget ancestor.
            return Material(
              color: Colors.transparent,
              child: CupertinoActionSheetAction(
                onPressed: () => action.onPressed,
                child: Row(
                  children: [
                    if (action.leading != null) ...[
                      action.leading!,
                      const SizedBox(width: 15),
                    ],
                    Expanded(
                      child: DefaultTextStyle(
                        style: defaultTextStyle,
                        textAlign: action.leading != null
                            ? TextAlign.start
                            : TextAlign.center,
                        child: action.title,
                      ),
                    ),
                    if (action.trailing != null) ...[
                      const SizedBox(width: 10),
                      action.trailing!,
                    ],
                  ],
                ),
              ),
            );
          }).toList(),
          cancelButton: cancelAction != null
              ? CupertinoActionSheetAction(
                  onPressed: () => cancelAction.onPressed ?? getIt<NavigationService>().back(),
                  child: DefaultTextStyle(
                    style: defaultTextStyle.copyWith(color: Colors.lightBlue),
                    textAlign: TextAlign.center,
                    child: cancelAction.title,
                  ),
                )
              : null,
        );
      },
    );
  }

  static void bottomSheetActionShops(
    BuildContext context, {
    required Function() onViewOrders,
    required Function() onViewSessions,
    required Function() onReportingOrders,
    required Function() onSettings,
  }) {
    showCupertinoBottomSheet(
      context: context,
      colorBackgroundPreview: Colors.white,
      colorPreview: Colors.white,

      actions: buildWidgetActionShops(
        onViewOrders: onViewOrders,
        onViewSessions: onViewSessions,
        onReportingOrders: onReportingOrders,
        onSettings: onSettings,
      ),
      cancelAction: CancelAction(
        title: Text(
          LocaleKeys.cancel.tr(),
        ),
      ),
    );
  }

  static List<BottomSheetAction> buildWidgetActionShops({
    bool isBlocked = false,
    bool isMuted = false,
    bool isImagePost = false,
    required Function() onViewOrders,
    required Function() onViewSessions,
    required Function() onReportingOrders,
    required Function() onSettings,
  }) =>
      [
        BottomSheetAction(
          title: Text(
            LocaleKeys.view_oders.tr(),
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.normal
            ),
          ),
          onPressed: (context) => onViewOrders,
        ),
        BottomSheetAction(
          title: Text(
            LocaleKeys.view_session.tr(),
            style: TextStyle(
              color: Colors.black87,
                fontWeight: FontWeight.normal
            ),
          ),
          onPressed: (context) => onViewSessions,
        ),
        BottomSheetAction(
          title: Text(
            LocaleKeys.reporting_orders.tr(),
            style: TextStyle(
              color: Colors.black87,
                fontWeight: FontWeight.normal
            ),
          ),
          onPressed: (context) => onReportingOrders,
        ),
        BottomSheetAction(
          title: Text(
            LocaleKeys.settings.tr(),
            style: TextStyle(
              color: Colors.black87,
                fontWeight: FontWeight.normal
            ),
          ),
          onPressed: (context) => onSettings,
        ),
      ];
}