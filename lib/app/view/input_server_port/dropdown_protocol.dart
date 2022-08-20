import 'package:business_suite_mobile_pos/app/view/widget_utils/anims/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../module/res/style.dart';


class DropDownProtocol extends StatefulWidget {
  final String itemSelected;
  final List<String> listOptionItems;
  final Function(dynamic optionItem) onItemSelected;

  DropDownProtocol({required this.itemSelected, required this.listOptionItems, required this.onItemSelected});

  @override
  _DropDownProtocolState createState() =>
      _DropDownProtocolState(itemSelected, listOptionItems);
}

class _DropDownProtocolState extends State<DropDownProtocol>
    with SingleTickerProviderStateMixin {
  dynamic optionItemSelected;
  final List<dynamic> listOptionItems;

  late AnimationController expandController;
  late Animation<double> animation;

  bool isShow = false;

  _DropDownProtocolState(this.optionItemSelected, this.listOptionItems);

  @override
  void initState() {
    super.initState();
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (isShow) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TouchableOpacity(
            onPressed: () {
              this.isShow = !this.isShow;
              _runExpandCheck();
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, color: Colors.black26, offset: Offset(0, 2))
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                 /* Icon(
                    Icons.card_travel,
                    color: Color(0xFF307DF1),
                  ),
                  SizedBox(
                    width: 10,
                  ),*/
              Container(
                /* height: size_48_w,*/
                padding: EdgeInsets.symmetric(
                    horizontal: size_20_w,
                    vertical: size_12_h),
                decoration: BoxDecoration(
                    color: kColor685563,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      bottomLeft: Radius.circular(4.0),
                    )),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      optionItemSelected,
                      style: TextStyle(
                          fontSize: text_14,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: size_6_w,
                    ),
                    SvgPicture.asset(
                      'assets/icons/ic_database.svg',
                      width: size_16_w,
                      height: size_16_w,
                      color: Colors.white,
                    ),
                  ],
                )),
                  /*Expanded(
                      child: GestureDetector(
                    onTap: () {
                      this.isShow = !this.isShow;
                      _runExpandCheck();
                      setState(() {});
                    },
                    child: Text(
                      optionItemSelected,
                      style: TextStyle(color: Color(0xFF307DF1), fontSize: 16),
                    ),
                  )),
                  Align(
                    alignment: Alignment(1, 0),
                    child: Icon(
                      isShow ? Icons.arrow_drop_down : Icons.arrow_right,
                      color: Color(0xFF307DF1),
                      size: size_16_w,
                    ),
                  ),*/
                ],
              ),
            ),
          ),
          SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation,
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          color: Colors.black26,
                          offset: Offset(0, 4))
                    ],
                  ),
                  child: Column(
                    children: widget.listOptionItems.map((item) => buildSubMenu(item, context)).toList(),
                  ))),
//          Divider(color: Colors.grey.shade300, height: 1,)
        ],
      ),
    );
  }

  Widget buildSubMenu(dynamic item, BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 26.0, top: 5, bottom: 5),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey.shade200, width: 1)),
                ),
                child: Text(item,
                    style: TextStyle(
                        color: Color(0xFF307DF1),
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        this.optionItemSelected = item;
        isShow = false;
        expandController.reverse();
        widget.onItemSelected(item);
      },
    );
  }
}
