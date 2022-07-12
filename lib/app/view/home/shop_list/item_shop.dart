import 'package:flutter/material.dart';

import '../../../model/shop.dart';
import '../../../module/res/style.dart';

class ItemShop extends StatelessWidget {
  Shop shop;
  VoidCallback onClickItem;

  ItemShop({
    Key? key,
    required this.shop,
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
            padding: EdgeInsets.symmetric( vertical: size_10_w),
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
                          shop.shopeName,
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
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                      height: 10.0,
                    ),
                    Card(
                    color: kColor71639E,
                    child: Center(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: size_8_w, vertical: size_6_w),
                        child: Text(
                          'Continue Selling',
                          style: TextStyle(
                            color: Colors.white,fontSize:text_11,
                          ),
                        ),
                      ),
                    ),
                    ),
                    SizedBox(
                      width: 10.0,
                      height: 10.0,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Last Closing Date',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'Last Closing Cash',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              'Balance',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                      height: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          shop.lastDate,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 23),
                          child: Text(
                            shop.lastCash,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
