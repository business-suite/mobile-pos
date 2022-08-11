import 'package:flutter/material.dart';

import '../../../module/network/network_util.dart';
import '../../../module/res/style.dart';
import '../../widget_utils/anims/touchable_opacity.dart';
import '../../widget_utils/avatar_profile_circle.dart';

class AppBarShops extends StatelessWidget implements PreferredSizeWidget {
  final Widget? iconLeft, iconRight;
  final bool enableCopyPaste;
  final int badgeCount;
  final String avatarUrl;
  final Function? leftIconOnPress;
  final Function? rightIconOnPress;
  VoidCallback? onClickAvatar;

  AppBarShops({
    Key? key,
    this.iconLeft,
    this.iconRight,
    this.enableCopyPaste = false,
    this.leftIconOnPress,
    this.rightIconOnPress,
    this.badgeCount = 0, this.avatarUrl = '',
    this.onClickAvatar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Header Image: $headers');
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      child: Container(
        height: appBarSize,
        width: double.infinity,
        color: kColor71639E,
        child: Padding(
          padding: EdgeInsets.only(right: size_14_w,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.window),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'Point of Sale',
                      style: TextStyle(color: Colors.white, fontSize: text_16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(color: Colors.white, fontSize: text_10),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'Orders',
                      style: TextStyle(color: Colors.white, fontSize: text_10),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'Products',
                      style: TextStyle(color: Colors.white, fontSize: text_10),
                    ),
                  ),
                ],
              ),

              TouchableOpacity(
                onPressed: () => onClickAvatar?.call(),
                child: AvatarProfileCircle(avatarUrl: avatarUrl,size: size_30_w,),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150.0);
}
