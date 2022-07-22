// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainstate.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainState on _MainStateBase, Store {
  Computed<String>? _$textComputed;

  @override
  String get text => (_$textComputed ??=
          Computed<String>(() => super.text, name: '_MainStateBase.text'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_MainStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$countdownDurationAtom =
      Atom(name: '_MainStateBase.countdownDuration', context: context);

  @override
  int get countdownDuration {
    _$countdownDurationAtom.reportRead();
    return super.countdownDuration;
  }

  @override
  set countdownDuration(int value) {
    _$countdownDurationAtom.reportWrite(value, super.countdownDuration, () {
      super.countdownDuration = value;
    });
  }

  late final _$countdownControllerAtom =
      Atom(name: '_MainStateBase.countdownController', context: context);

  @override
  CountDownController get countdownController {
    _$countdownControllerAtom.reportRead();
    return super.countdownController;
  }

  @override
  set countdownController(CountDownController value) {
    _$countdownControllerAtom.reportWrite(value, super.countdownController, () {
      super.countdownController = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
countdownDuration: ${countdownDuration},
countdownController: ${countdownController},
text: ${text}
    ''';
  }
}
