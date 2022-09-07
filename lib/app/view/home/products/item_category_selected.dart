
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/anims/touchable_opacity.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../module/network/response/category_response.dart';

class ItemCategorySelected extends StatelessWidget {
  Category category;
  VoidCallback onClickItem;
  bool isLastIndex = false;

  ItemCategorySelected({
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
        color: kColorD3D3D3,
        height: size_50_w,
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/ic_next.svg',
              height: size_50_w,
            ),
            Container(
              padding: EdgeInsets.only(left: size_8_w, right: size_12_w),
              child: Center(
                child: Text(
                  category.name ?? '',
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: text_14),
                ),
              ),
            ),
            isLastIndex ? Container(width: 1.0, color: kColor909090) : Container()
          ],
        ),
      ),
    );
  }
}
