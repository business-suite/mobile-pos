import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:package_info/package_info.dart';
import 'package:rxdart/rxdart.dart';

import '../../di/injection.dart';
import '../../model/device_param.dart';
import '../common/toast_util.dart';
import '../local_storage/shared_pref_manager.dart';
import 'dio_module.dart';

Future _get(String url, {Map<String, dynamic>? params}) async {
  if (params == null) {
    params = new Map<String, dynamic>();
  }
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  DeviceParam deviceParam = DeviceParam();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceParam = DeviceParam(
        deviceType: 4,
        deviceId: androidInfo.androidId,
        osVersion: androidInfo.version.release,
        modelName: androidInfo.model);
  } else if (Platform.isIOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
    deviceParam = DeviceParam(
        deviceType: 3,
        deviceId: iosDeviceInfo.identifierForVendor,
        osVersion: iosDeviceInfo.systemVersion,
        modelName: iosDeviceInfo.model);
  }
  params.putIfAbsent('device_type', () => deviceParam.deviceType ?? ''); // 2: android
  params.putIfAbsent('device_id', () => deviceParam.deviceId ?? '');
  params.putIfAbsent('device_token', () => getIt<UserSharePref>().getFirebaseToken());
  params.putIfAbsent('os_version', () => deviceParam.osVersion ?? '');
  params.putIfAbsent('app_version', () => packageInfo.version);
  params.putIfAbsent('model_name', () => deviceParam.modelName ?? '');
  var response = await dio.get(
    url,
    // options: Options(
    //   headers: {
    //     "X-APP-TOKEN": "76339b6ace3aaff2658c4c5c579cff369b64723d",
    //   },
    // ),
    queryParameters: params,
  );
  return response.data;
}

Future _post(String url, Map<String, dynamic>? params) async {
  if (params == null) {
    params = new Map<String, dynamic>();
  }
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  DeviceParam deviceParam = DeviceParam();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceParam = DeviceParam(
        deviceType: 4,
        deviceId: androidInfo.androidId,
        osVersion: androidInfo.version.release,
        modelName: androidInfo.model);
  } else if (Platform.isIOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
    deviceParam = DeviceParam(
        deviceType: 3,
        deviceId: iosDeviceInfo.identifierForVendor,
        osVersion: iosDeviceInfo.systemVersion,
        modelName: iosDeviceInfo.model);
  }
  // common parameter
  params.putIfAbsent('device_type', () => deviceParam.deviceType ?? ''); // 2: android
  params.putIfAbsent('device_id', () => deviceParam.deviceId ?? '');
  params.putIfAbsent('device_token', () => getIt<UserSharePref>().getFirebaseToken());
  params.putIfAbsent('os_version', () => deviceParam.osVersion ?? '');
  params.putIfAbsent('app_version', () => packageInfo.version);
  params.putIfAbsent('model_name', () => deviceParam.modelName ?? '');
  var formData = FormData.fromMap(params);

  var response = await dio.post(url, data: formData);
  return response.data;
}

/*Observable post(String url, {Map<String, dynamic>? params}) =>
    Observable.fromFuture(_post(url, params)).asBroadcastStream();

Observable get(String url, {Map<String, dynamic>? params}) =>
    Observable.fromFuture(_get(url, params: params)).asBroadcastStream();*/

dispatchFailure(BuildContext context, dynamic e) {
  var message = e.toString();
  if (e is DioError) {
    final response = e.response;

    if (response?.statusCode == 401) {
      message = 'account or password error ';
    } else if (403 == response?.statusCode) {
      message = 'forbidden';
    } else if (404 == response?.statusCode) {
      message = 'page not found';
    } else if (500 == response?.statusCode) {
      message = 'Server internal error';
    } else if (503 == response?.statusCode) {
      message = 'Server Updating';
    } else if (e.error is SocketException) {
      message = 'network cannot use';
    } else {
      message = 'Oops!!';
    }
  }
  print('error ：' + message);
  if (context != null) {
    ToastUtil.showToast(message);
  }
}
