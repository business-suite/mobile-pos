
import 'package:business_suite_mobile_pos/app/module/res/style.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/custom_card.dart';
import 'package:flutter/material.dart';

import '../../../module/network/response/category_product_response.dart';

class ItemMenu extends StatelessWidget {
  Category category;
  VoidCallback onClickItem;

  ItemMenu({
    Key? key,
    required this.category,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => onClickItem.call(),
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
            ],
          ),
        ),
      ),
    );
  }
}
