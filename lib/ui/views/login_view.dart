import './../../core/viewModel/enums.dart';
import './../../core/viewModel/login_model.dart';
import './../../ui/shared/app_colors.dart';
import './../../ui/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
      models: [() => LoginModel()],
      builder: (context) => _Scoffold(),
    );
  }
}

class _Scoffold extends StatefulWidget {
  @override
  __ScoffoldState createState() => __ScoffoldState();
}

class __ScoffoldState extends State<_Scoffold> {
  final TextEditingController controller = TextEditingController();
  final model = Injector.get<LoginModel>();
  @override
  Widget build(BuildContext context) {
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
                        })
              ],
            ),
          ),
    );
  }
}
