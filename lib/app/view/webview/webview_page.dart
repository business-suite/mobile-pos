import 'dart:io';
import 'package:business_suite_mobile_pos/app/view/webview/webview_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../model/webview_param.dart';
import '../../module/res/colors.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../widget_utils/custom/default_loading_progress.dart';
import '../widget_utils/custom/appbar_custom.dart';
class WebviewPage extends PageProvideNode<WebviewViewModel> {
  WebviewPage(WebviewParam? webviewParam) : super(params: [webviewParam]);

  @override
  Widget buildContent(BuildContext context) {
    return _WebviewContentPage(viewModel);
  }
}

class _WebviewContentPage extends StatefulWidget {
  final WebviewViewModel _webviewViewModel;

  _WebviewContentPage(this._webviewViewModel);

  @override
  _WebviewContentPageState createState() => _WebviewContentPageState();
}

class _WebviewContentPageState extends State<_WebviewContentPage> {
  WebviewViewModel get webviewViewModel => widget._webviewViewModel;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCustom(
        colorBackGround: kColor202330,
        resIcon: 'assets/icons/ic_close.svg',
        onPressIcon: () => webviewViewModel.navigationService.back(),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: UniqueKey(),
            initialUrl: webviewViewModel.webviewParam?.url ?? '',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) => webviewViewModel.loading = false,
          ),
          _buildLoading(),
        ],
      ),
    );
  }

  Consumer<WebviewViewModel> _buildLoading(){
    return Consumer<WebviewViewModel>(
      builder: (context, value, child){
        return value.loading ?  BuildProgressLoading()
            : Stack();
      },
    );
  }
}
