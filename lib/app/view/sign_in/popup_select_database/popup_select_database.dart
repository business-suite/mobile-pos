// ignore_for_file: prefer_const_constructors
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../di/injection.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';
import 'item_database.dart';

void showPopupSelectDatabase(
    List<dynamic> databaseList, Function(String) onSelectDatabase) {
  BuildContext context =
      getIt<NavigationService>().navigatorKey.currentContext!;
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        removeFocus(context);
        return PopupSelectDatabase(
          databaseList: databaseList,
          onSelectDatabase: onSelectDatabase,
        );
      });
}

class PopupSelectDatabase extends StatefulWidget {
  List<dynamic> databaseList = [];
  Function(String) onSelectDatabase;

  PopupSelectDatabase(
      {Key? key, required this.databaseList, required this.onSelectDatabase})
      : super(key: key);

  @override
  State<PopupSelectDatabase> createState() => _PopupSelectDatabaseState();
}

class _PopupSelectDatabaseState extends State<PopupSelectDatabase> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: kColorBackground,
            borderRadius: BorderRadius.circular(size_5_w),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: size_25_w,
          ),
          padding: EdgeInsets.symmetric(
            vertical: size_1_w,
            horizontal: size_1_w,
          ),
          child: Column(
            children: [
              Container(
                height: size_56_w,
                color: Colors.white,
                child: Center(
                  child: Text(
                    LocaleKeys.select_database.tr(),
                    style: TextStyle(
                        fontSize: text_16,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: size_1_w,
                width: double.infinity,
                color: kColor3C3C3C.withOpacity(0.1),
              ),
              Container(
                height: size_300_w,
                child: widget.databaseList.length == 0
                    ? Center(
                        child: Text(
                          LocaleKeys.no_database.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: text_14,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      )
                    : ScrollConfiguration(
                        behavior:
                            const ScrollBehavior().copyWith(overscroll: false),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.databaseList.length,
                            itemBuilder: (context, index) => ItemDatabase(
                              item: widget.databaseList[index],
                              isLastItem: index == widget.databaseList.length,
                              onClickItem: () {
                                widget.onSelectDatabase
                                    .call(widget.databaseList[index]);
                                getIt<NavigationService>().dimiss();
                              },
                            ),
                          ),
                        ),
                      ),
              ),
              Container(
                height: size_1_w,
                color: kColorCACACA,
              ),
              Padding(
                padding: EdgeInsets.only(top: size_10_w, bottom: size_10_w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: kColor3C3C3C.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(size_4_w)),
                      padding: EdgeInsets.symmetric(
                          horizontal: size_1_w, vertical: size_1_w),
                      child: Container(
                        height: size_40_w,
                        width: size_120_w,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(size_1_w)),
                        padding: EdgeInsets.symmetric(
                            horizontal: size_1_w, vertical: size_1_w),
                        child: FlatButton(
                          onPressed: () {
                            getIt<NavigationService>().dimiss();
                          },
                          child: Text(
                            LocaleKeys.cancel.tr(),
                            style: TextStyle(
                              fontSize: text_14,
                              color: kColor555555,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
