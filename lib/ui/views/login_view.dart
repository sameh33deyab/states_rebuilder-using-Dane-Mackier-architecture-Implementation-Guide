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
    //Injector is used with LoginModel as generic type
    //LoginModel must extends StatesRebuilder
    //Any model that extends StatesRebuilder is called ViewModel

    //It rebuildStates() method is called inside LoginModel this widget will rebuild.
    //You can register many services and one viewModel
    return Injector<LoginModel>(
      models: [() => LoginModel()],
      builder: (context, model) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: _LoginBody(controller: controller),
        );
      },
    );
  }
}

class _LoginBody extends StatelessWidget {
  final controller;
  final model = Injector.get<LoginModel>();

  _LoginBody({this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
