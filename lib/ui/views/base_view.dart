import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_using_dane_mackier_implementation_guide/core/viewModel/base_model.dart';

class BaseView<T extends BaseModel> extends StatelessWidget {
  final Widget Function(BuildContext context, T value) builder;

  final Function(T) onModelReady;

  BaseView({@required this.builder, this.onModelReady});

  final model = Injector.get<T>();

  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      initState: (_, __) {
        if (onModelReady != null) onModelReady(model);
      },
      viewModels: [model],
      builder: (context, _) => builder(context, model),
    );
  }
}
