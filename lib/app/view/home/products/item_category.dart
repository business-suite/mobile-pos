
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/anims/touchable_opacity.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/custom_card.dart';
import 'package:flutter/material.dart';

import '../../../module/network/response/category_response.dart';

class ItemCategory extends StatelessWidget {
  Category category;
  bool isLastIndex = false;
  VoidCallback onClickItem;

  ItemCategory({
    Key? key,
    required this.category,
    required this.isLastIndex,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onPressed: () => onClickItem.call(),
      child: Container(
        color: kColorE5E5E5,
        height: size_50_w,
        child: Row(
          children: <Widget>[
            Container(width: 1.0, color: kColorc7c7c7),
            Container(
              padding: EdgeInsets.symmetric(horizontal: size_18_w),
              child: Center(
                child: Text(
                  category.name ?? '',
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: text_14),
                ),
              ),
            ),
            isLastIndex ? Container(width: 1.0, color: kColorc7c7c7) : Container()
          ],
        ),
      ),
    );
  }
}
