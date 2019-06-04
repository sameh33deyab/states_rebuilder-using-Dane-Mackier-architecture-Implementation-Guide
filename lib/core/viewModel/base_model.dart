import 'package:states_rebuilder/states_rebuilder.dart';

import 'enums.dart';

class BaseModel extends StatesRebuilder {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    rebuildStates();
  }
}
