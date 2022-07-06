
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../module/res/colors.dart';
import '../../../module/res/string.dart';
import '../../../module/res/text.dart';

class TextFieldCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final Widget? iconLeft, iconRight, iconClearText;
  final bool showClearText;
  final VoidCallback? clearTextOnPress;
  final TextEditingController? textEditingController;
  final bool enableCopyPaste;
  final VoidCallback? leftIconOnPress;
  final VoidCallback? rightIconOnPress;
  final VoidCallback? onTapEditext;
  final FocusNode? focusNode;
  final VoidCallback? searchOnPress;

  TextFieldCustom({
    Key? key,
    this.iconLeft,
    this.iconRight,
    this.enableCopyPaste = false,
    this.textEditingController,
    this.leftIconOnPress,
    this.rightIconOnPress,
    this.onTapEditext,
    this.showClearText: false,
    this.clearTextOnPress,
    this.iconClearText,
    this.focusNode,
    this.searchOnPress,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0, top: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: GestureDetector(
                onTap: onTapEditext!,
                child: Card(
                  shadowColor: transparent,
                  elevation: 0.0,
                  color: kColor2A2E43,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  ),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 60.0),
                        child: TextField(
                          focusNode: focusNode,
                          //disable copy/paste
                          enableInteractiveSelection: enableCopyPaste,
                          maxLines: 1,
                          cursorWidth: 3.0,
                          cursorRadius: Radius.circular(100.0),
                          cursorColor: kColor426cff,
                          textAlign: TextAlign.start,
                          onTap: onTapEditext,
                          autofocus: true,
                          //not focus to textfield
                          controller: textEditingController,
                          textInputAction: TextInputAction.done,
                          style: kTSSVNGilroy.copyWith(
                              color: kWhite,
                              fontSize: text_16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal),
                          decoration: InputDecoration(
                            hintText: txt_enter_player_description,
                            hintStyle: kTSSVNGilroy.copyWith(
                                color: Colors.white54,
                                fontSize: text_16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal),
                            border: InputBorder.none, //no input border
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Visibility(
                          visible: showClearText,
                          child: IconButton(
                            onPressed: clearTextOnPress,
                            icon: iconClearText!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(150.0);
}
