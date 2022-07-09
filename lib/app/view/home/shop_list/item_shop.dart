import 'package:flutter/material.dart';
import 'package:hcn_call_center/odoo/model/shop.dart';

class ItemShop extends StatelessWidget {
  Shop shop;

  ItemShop({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 10.0,
                  height: 10.0,
                ),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        shop.shopeName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 300.0,
                      ),
                      Icon(
                        Icons.more_vert,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                  height: 10.0,
                ),
                Container(
                  width: 50.0,
                  height: 30.0,
                  child:Card(
                  color: Colors.purple,
                  child: Center(
                    child: Text(
                      'close',
                      style: TextStyle(
                        color: Colors.white,fontSize:10,
                      ),
                    ),
                  ),
                ),
                ),
                SizedBox(
                  width: 50.0,
                  height: 10.0,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 40),
                          child: Text(
                            'Last Closing Date',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Text(
                          'Last Closing Cash Balance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 81),
                          child: Text(
                            'Balance',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
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
    );
  }
}
