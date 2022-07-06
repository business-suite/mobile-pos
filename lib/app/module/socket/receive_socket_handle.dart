import 'dart:convert';


class ReceiveSocketHandle {
  String? data = "";

  ReceiveSocketHandle({this.data});

  handleData() {
    if (data?.isEmpty == true) return;
  }
}
