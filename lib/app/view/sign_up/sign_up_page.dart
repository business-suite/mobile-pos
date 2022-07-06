import 'dart:io';

import 'package:flutter/material.dart';
import '../../module/res/colors.dart';
import '../../module/res/dimens.dart';
import '../../module/res/string.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../../viewmodel/life_cycle_base.dart';
import 'sign_up_viewmodel.dart';

class SignUpPage extends PageProvideNode<SignUpViewModel> {
  SignUpPage() : super();

  @override
  Widget buildContent(BuildContext context) {
    return _LoginContentPage(viewModel);
  }
}

class _LoginContentPage extends StatefulWidget {
  final SignUpViewModel _loginViewModel;

  _LoginContentPage(this._loginViewModel);

  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends LifecycleState<_LoginContentPage> {
  SignUpViewModel get loginViewModel => widget._loginViewModel;

  @override
  void initState() {
    /*FirebaseAuth.instance.signOut();
    loginViewModel.signOut();*/
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bkg_gt.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: size_260_w,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                    width: 300, //横幅
                    height: 50, //高さ
                    child: ElevatedButton.icon(
                      icon: Container(),
                      label:  Text(txt_login_twitter),
                      style: ElevatedButton.styleFrom(
                          primary: kColor03a9f4,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      onPressed: () async {
                        // 0: apple, 1= twitter
                        //loginViewModel.setloginType(1);
                        // await loginViewModel.twitterLogin();
                        //account test
                         await loginViewModel.loginApi('2803532592'); // for iwasaki
                        // await loginViewModel.loginApi('1228218841416683520');
                        //await loginViewModel.loginApi('1338500678197469184');
                        // await loginViewModel.loginApi('1137921957091979266'); // for fujimoto
                      },
                    )
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
