import 'dart:async';

import './../models/user.dart';
import './../services/api.dart';
import 'package:flutter/widgets.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import '../viewModel/enums.dart';

class AuthenticationService extends StatesRebuilder {
  // Inject our Api
  Api _api = Injector.get<Api>();
  StreamController<User> userController = StreamController<User>();
  AsyncSnapshot<User> userSnapshot;

  AuthenticationService() {
    rebuildFromStreams(
      controllers: [userController],
      tags: [tagUser.userStream],
      initialData: [User.initial()],
      snapshots: (snaps) => userSnapshot = snaps[0],
    );
  }

  Future<bool> login(int userId) async {
    // Get the user profile for id
    var fetcheduser = await _api.getUserProfile(userId);

    // Check if success
    var hasUser = fetcheduser != null;

    if (hasUser) {
      userController.add(fetcheduser);
    }

    return hasUser;
  }

  dispose() {
    userController.close();
  }
}
