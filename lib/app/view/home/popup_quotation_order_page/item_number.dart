import 'package:business_suite_mobile_pos/app/view/home/popup_quotation_order_page/percentage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/keyboard.dart';
import '../../../module/common/config.dart';
import '../../../module/res/colors.dart';
import '../../../module/res/dimens.dart';
import '../../../module/res/text.dart';

class ItemApplyKeyBoard extends StatefulWidget {
  KeyBoard item;
  VoidCallback? onClickItem;
  VoidCallback? pressDown;
  VoidCallback? pressUp;

  ItemApplyKeyBoard({Key? key, required this.item, this.onClickItem,this.pressDown,this.pressUp,})
      : super(key: key);

  @override
  State<ItemApplyKeyBoard> createState() => _ItemApplyKeyBoardState();
}

class _ItemApplyKeyBoardState extends State<ItemApplyKeyBoard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PercentageViewModel>(builder: (context, value, child) {
      return Container(
        color: kColorf0eeee,
        child: InkWell(
          onTapDown: (_) {
            value.pressDown();
          },
          onTapUp: (_) {
            value.pressUp();
          },
          onTap: () => widget.onClickItem?.call(),
          child: Container(
            decoration: BoxDecoration(
                color: kColorcacaca,
                borderRadius: BorderRadius.circular(size_30_w)),
            padding:
            EdgeInsets.symmetric(horizontal: size_1_w, vertical: size_1_w),
            child: Container(
              decoration: BoxDecoration(
                  color: value.color,
                  borderRadius: BorderRadius.circular(size_28_w)),
              padding:
              EdgeInsets.symmetric(horizontal: size_3_w, vertical: size_3_w),
              child: Padding(
                padding: EdgeInsets.all(size_10_w),
                child: Center(
                  child: widget.item.image == null
                      ? Text(
                    widget.item.number ?? '',
                    style: TextStyle(
                      fontSize: widget.item.sizeStyle == SizeStyle.NORMAL
                          ? text_22
                          : text_14,
                      fontWeight: FontWeight.normal,
                      color: kColor555555,
                    ),
                  )
                      : Image.asset(
                    'assets/icons/ic_backspace.png',
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
