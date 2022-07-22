// ignore_for_file: library_private_types_in_public_api

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:hardcore_writer/widgets/hw_textfield/state/hw_textfield_state.dart';
import 'package:mobx/mobx.dart';
part 'mainstate.g.dart';

class MainState = _MainStateBase with _$MainState;
MainState mainState = MainState();

abstract class _MainStateBase with Store {
  @observable
  String startText = "Type more than 10 characters to start your session";

  @observable
  bool isLoading = true;

  @observable
  bool isResetting = false;

  @observable
  int deathCountdownDuration = 15;
  @observable
  int sessionCountdownDuration = 300;

  @observable
  bool sessionRunning = false;

  late CountDownController deathCountdownController;
  late CountDownController sessionCountdownController;

  HwTextfieldState textfieldState = HwTextfieldState();

  @computed
  String get text => textfieldState.value;
}
