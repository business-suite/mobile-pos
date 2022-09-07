import 'package:flutter/material.dart';

import '../../../../model/keyboard.dart';
import '../../../../module/common/config.dart';
import '../../../../module/res/style.dart';

class ItemReviewKeyBoard extends StatelessWidget {
  KeyBoard item;
  VoidCallback? onClickItem;
  bool selected = false;

  ItemReviewKeyBoard({Key? key, required this.item, this.onClickItem, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorE2E2E2,
      child: InkWell(
        onTap: () => onClickItem?.call(),
        child: item.flex == null
            ? Container(
                decoration: BoxDecoration(
                  color: selected ? kColor6EC89B :kColorE2E2E2,
                  borderRadius: BorderRadius.circular(1),
                ),
                padding: EdgeInsets.symmetric(vertical: 1),
                child: Center(
                  child: item.image == null
                      ? Text(
                          item.number ?? '',
                          style: TextStyle(
                            fontSize: item.sizeStyle == SizeStyle.NORMAL
                                ? text_25
                                : text_15,
                            fontWeight: FontWeight.bold,
                            color: selected ? kWhite : kColor555555,
                          ),
                        )
                      : Image.asset(
                          'assets/icons/ic_backspace.png',
                          height: 24,
                          width: 24,
                        ),
                ),
              )
            : Expanded(
                flex: item.flex!,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kColorE2E2E2,
                        borderRadius: BorderRadius.circular(1),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 1),
                      child: Center(
                        child: item.image == null
                            ? Text(
                                item.number ?? '',
                                style: TextStyle(
                                  fontSize: item.sizeStyle == SizeStyle.NORMAL
                                      ? text_25
                                      : text_15,
                                  fontWeight: FontWeight.bold,
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
                  ],
                ),
              ),
      ),
    );
  }
}
