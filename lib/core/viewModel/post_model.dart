import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_using_dane_mackier_implementation_guide/core/models/user.dart';
import 'package:states_rebuilder_using_dane_mackier_implementation_guide/core/services/authentication_service%20.dart';

class PostModel extends StatesRebuilder {
  final authStreaming = Injector.get<AuthenticationService>().authStreaming;
  User get user => authStreaming.snapshots[0].data;
}
