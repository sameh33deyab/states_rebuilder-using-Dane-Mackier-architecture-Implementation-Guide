import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'core/services/api.dart';
import 'core/services/authentication_service .dart';
import 'core/services/posts_service.dart';
import 'ui/router.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      models: [
        () => Api(),
        () => PostsService(),
        () => AuthenticationService(),
      ],
      builder: (context) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(),
            initialRoute: 'login',
            onGenerateRoute: Router.generateRoute,
          ),
    );
  }
}
