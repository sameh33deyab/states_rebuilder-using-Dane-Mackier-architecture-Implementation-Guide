import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_using_dane_mackier_implementation_guide/ui/views/base_view.dart';
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
        //Use of baseView

        return BaseView<LoginModel>(
          builder: (context, model) => Scaffold(
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
                              var loginSuccess =
                                  await model.login(controller.text);
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

// StateBuilder(
//           blocs: [model],
//           builder: (_, __) => Scaffold(

// ChangeNotifierProvider<LoginModel>(
//       builder: (context) => locator<LoginModel>(),
//       child: Consumer<LoginModel>(
//       builder: (context, model, child) => Scaffold(

// BaseView(
//           builder: (context, model) => Scaffold(

// BaseView<LoginModel>(
//       builder: (context, model, child) =>
