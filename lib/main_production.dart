import 'package:flutter/material.dart';
import 'app/app.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.PRODUCTION;
  runApp(App());
}
