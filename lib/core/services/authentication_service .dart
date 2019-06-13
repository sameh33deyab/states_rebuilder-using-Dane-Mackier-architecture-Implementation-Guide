import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import './../models/user.dart';
import './../services/api.dart';

class AuthenticationService extends StatesRebuilder {
  // Inject our Api
  Api _api = Injector.get<Api>();
  StreamController<User> userController = StreamController<User>();
  Streaming streaming;
  AsyncSnapshot<User> get userSnapshot => streaming.snapshots[0];
  AuthenticationService() {
    streaming = Streaming<User, User>(
      controllers: [userController],
      initialData: [User.initial()],
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
    print("userController is disposed");
  }
}
