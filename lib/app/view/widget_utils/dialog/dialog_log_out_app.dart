import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavorizr/parser/models/flavorizr.dart';

import '../../../../flavors.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../module/res/style.dart';

class DialogExitApp extends StatelessWidget {
  VoidCallback funcExit;

  DialogExitApp({Key? key, required this.funcExit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      insetPadding: EdgeInsets.all(30.0),
      backgroundColor: transparent,
      child: Wrap(
        children: [
          Container(
            //height: MediaQuery.of(context).size.height / 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                    child: Text(
                      F.title,
                      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: text_16),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 26.0, bottom: 30.0),
                    child: Text(
                      "Do you want to log out?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: text_14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: kColorCACACA,
                  height: 1.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        margin: EdgeInsets.zero,
                        color: transparent,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0)),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0)),
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            height: heightButton,
                            child: Center(
                              child: Text(
                                LocaleKeys.cancel.tr(),
                                style: TextStyle(color: kColor027AFF, fontSize: text_16, fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: kColorCACACA,
                      width: 1.0,
                      height: heightButton,
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        margin: EdgeInsets.zero,
                        color: transparent,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0)),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0)),
                          onTap: () => funcExit.call(),
                          child: Container(
                            height: heightButton,
                            child: Center(
                              child: Text(
                                LocaleKeys.log_out.tr(),
                                style: TextStyle(color: kColorFF4136, fontSize: text_16, fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
