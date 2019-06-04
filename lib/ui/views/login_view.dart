import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import './../../core/viewModel/enums.dart';
import './../../core/viewModel/login_model.dart';
import './../../ui/shared/app_colors.dart';
import './../../ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Injector(
      models: [() => LoginModel()],
      builder: (context) {
        //We can get the model form the same widget where it is registered
        final model = Injector.get<LoginModel>();

        return StateBuilder(
          blocs: [model],
          builder: (_, __) => Scaffold(
                backgroundColor: backgroundColor,
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginHeader(
                      validationMessage: model.errorMessage,
                      controller: controller,
                    ),
                    model.state == ViewState.Busy
                        ? CircularProgressIndicator()
                        : FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () async {
                              var loginSuccess = await model.login(controller.text);
                              if (loginSuccess) {
                                Navigator.pushNamed(context, '/');
                              }
                            },
                          )
                  ],
                ),
              ),
        );
      },
    );
  }
}
