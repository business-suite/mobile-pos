import 'package:business_suite_mobile_pos/app/view/widget_utils/anims/touchable_opacity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../module/common/extension.dart';
import '../../../module/network/response/shops_response.dart';
import '../../../module/res/style.dart';
import '../../widget_utils/bottom_sheet/bottom_sheet_utils.dart';

class ItemDatabase extends StatelessWidget {
  dynamic item;
  bool isLastItem;
  VoidCallback onClickItem;

  ItemDatabase({
    Key? key,
    required this.item,
    required this.isLastItem,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onPressed: () => onClickItem.call(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(size_4_r)
        ),
        
        margin: EdgeInsets.only(left: size_10_w, right: size_10_w, top: size_10_w, bottom: isLastItem ? size_10_w : 0.0),
        padding: EdgeInsets.symmetric(vertical: size_14_w, horizontal: size_14_w),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              child: Text(
                item.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:kColor007bff,
                  fontSize: text_14,
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
          ],
        ),
      ),
    );
  }
}
