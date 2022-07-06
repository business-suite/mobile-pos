
import 'package:rxdart/rxdart.dart';

import '../local_storage/shared_pref_manager.dart';
import '../network/request/auth_request.dart';

class DataRepository {
  final SharedPrefManager? _sharedPref;
  final AuthRequest? _authRequest;
  //final SocketManager? _socketManager;

  DataRepository(
      this._authRequest,
      this._sharedPref,
      //this._socketManager
      );


  /*Observable sign_in(Map<String, dynamic> params) {
    return _authRequest!.sign_in(params);
  }

  Observable logout() {
    return _authRequest!.logout();
  }

  Observable loginComplete(Map<String, dynamic> params) {
    return _authRequest!.loginComplete(params);
  }*/

}
