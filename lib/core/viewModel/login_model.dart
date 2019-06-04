import './../services/authentication_service%20.dart';
import './../viewModel/base_model.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'enums.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = Injector.get<AuthenticationService>();
  String errorMessage;
  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);
    if (userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }
    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);

    return success;
  }
}
