// ignore_for_file: library_private_types_in_public_api

import 'package:hardcore_writer/widgets/hw_textfield/state/hw_textfield_state.dart';
import 'package:mobx/mobx.dart';
part 'mainstate.g.dart';

class MainState = _MainStateBase with _$MainState;
MainState mainState = MainState();

abstract class _MainStateBase with Store {
  @observable
  bool isLoading = true;

  HwTextfieldState textfieldState = HwTextfieldState();

  @computed
  String get text => textfieldState.value;
}
