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
    //Injector is used to inject dependencies
    //Models are registered when needed in the widget tree using Injector widget.
    //Models are unregistered when the Injector widget is disposed.
    //These three models are needed globally in the app.
    return Injector(
      models: [
        () => Api(),
        () => AuthenticationService(),
        () =>
            PostsService(), // This model is better registered in the HomeView widget.
      ],
      // We can dispose resources with dispose parameter
      dispose: () => Injector.get<AuthenticationService>().dispose(),
      // If we want to dispose all the models we set disposeModels to true. Models must have dispose() method
      // disposeModels: true,
      builder: (context) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(),
            initialRoute: 'login',
            onGenerateRoute: Router.generateRoute,
          ),
    );
  }
}
