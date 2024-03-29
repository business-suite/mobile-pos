import 'package:flutter/material.dart';

import '../../../model/keyboard.dart';
import '../../../module/common/config.dart';
import '../../../module/res/style.dart';

class ItemKeyBoard extends StatelessWidget {
  KeyBoard item;
  VoidCallback? onClickItem;

  ItemKeyBoard({Key? key, required this.item, this.onClickItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => onClickItem?.call(),
        child: Container(
          decoration: BoxDecoration(
              color: kColorE2E2E2, borderRadius: BorderRadius.circular(size_1_r),),
          padding: EdgeInsets.symmetric(vertical: size_1_w,horizontal: size_1_w),
          child: Center(
            child: item.image == null
                ? Text(
                    item.number ?? '',
                    style:
                    TextStyle(
                      fontSize: item.sizeStyle == SizeStyle.NORMAL ? text_26 : text_16,
                      fontWeight:  FontWeight.bold,
                      color: kColor555555,
                    ) ,
                  )
                : Image.asset(
                    'assets/icons/ic_backspace.png',
                    height: 24,
                    width: 24,
                  ),
          ),
        ),
      ),
    );
  }
}
