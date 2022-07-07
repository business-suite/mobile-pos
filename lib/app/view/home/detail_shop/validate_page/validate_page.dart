import 'package:business_suite_mobile_pos/app/view/widget_utils/base_scaffold_safe_area.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../flavors.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../module/res/colors.dart';
import '../../../../module/res/dimens.dart';
import '../../../../module/res/text.dart';
import '../../pay/pay_viewmodel.dart';
import '../appbar_shop.dart';

class ValidatePage extends StatefulWidget {
  const ValidatePage({Key? key}) : super(key: key);

  @override
  State<ValidatePage> createState() => _ValidatePageState();
}

class _ValidatePageState extends State<ValidatePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldSafeArea(
        backgroundColor: kColorf0eeee,
        customAppBar: AppBarShop(
          badgeCount: 1,
          avatarUrl: '${F.baseUrl}/web/image/res.users/2/avatar_128',
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black26.withOpacity(0.5),
          child: Column(
            children: [
              Container(
                color: Colors.black26.withOpacity(0.5),
                height: size_80_w,
                width: double.infinity,
                child: Wrap(
                  children: [
                    Container(
                      color: kColor64AF8A,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: size_20_w,
                          bottom: size_20_w,
                          left: size_20_w,
                          right: size_20_w,
                        ),
                        child: Wrap(

                          children: [
                            Text('data'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
