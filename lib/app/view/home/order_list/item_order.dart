import 'package:business_suite_mobile_pos/app/model/order.dart';
import 'package:flutter/material.dart';

import '../../../module/res/dimens.dart';
import '../../../module/res/style.dart';

class ItemOrder extends StatelessWidget {
  Order item;
  VoidCallback onClickItem;

  ItemOrder({
    Key? key,
    required this.item,
    required this.onClickItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Ink(
        child: InkWell(
          onTap: () => onClickItem.call(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: size_10_w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size_10_w),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        child: Text(
                          item.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.more_vert,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
