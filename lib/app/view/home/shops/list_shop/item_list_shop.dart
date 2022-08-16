import 'package:business_suite_mobile_pos/app/module/local_storage/shared_pref_manager.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/anims/touchable_opacity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../../di/injection.dart';
import '../../../../module/common/extension.dart';
import '../../../../module/network/response/shops_response.dart';
import '../../../../module/res/style.dart';
import '../../../widget_utils/bottom_sheet/bottom_sheet_utils.dart';

class ItemListShop extends StatefulWidget {
  Shop shop;
  VoidCallback onClickItem;
  Function(bool value) onCheckItem;
  int index;


  ItemListShop({
    Key? key,
    required this.shop,
    required this.index,
    required this.onClickItem,
    required this.onCheckItem,
  }) : super(key: key);

  @override
  State<ItemListShop> createState() => _ItemListShopState();
}

class _ItemListShopState extends State<ItemListShop> {
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0.0,
      color: widget.index % 2 == 0
          ? kColorF7F7F7
          : kColorFCFCFC,
      child: Ink(
        child: InkWell(
          onTap: () => widget.onClickItem.call(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: size_6_w,),
            child: Row(
              children: [
                //text name
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: size_36_w,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Transform.scale(
                              scale: 0.8,
                              child: Checkbox(
                                  side: BorderSide(
                                      color: Colors.black54,
                                      width: size_2_w
                                  ),
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.all(kColor875a7b),
                                  hoverColor: kColor875a7b,
                                  value: isCheck,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCheck = value;
                                      widget.onCheckItem.call(value ?? false);
                                    });

                                  }
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: size_2_w,
                          color: Colors.transparent,
                        ),
                        SizedBox(width: size_6_w,),
                        Text(
                            widget.shop.name ?? '',
                          maxLines: 3,
                          style: TextStyle(color: Colors.black87, fontSize: text_13),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: size_1_w,
                  color: Colors.transparent,
                ),
                //text ZIP
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: size_6_w, right: size_10_w),
                    child: Text(
                      widget.shop.getCompanyName(),
                      maxLines: 3,
                      style: TextStyle(color: Colors.black87, fontSize: text_13),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
