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

  late final _$startTextAtom =
      Atom(name: '_MainStateBase.startText', context: context);

  @override
  String get startText {
    _$startTextAtom.reportRead();
    return super.startText;
  }

  @override
  set startText(String value) {
    _$startTextAtom.reportWrite(value, super.startText, () {
      super.startText = value;
    });
  }

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

  late final _$isResettingAtom =
      Atom(name: '_MainStateBase.isResetting', context: context);

  @override
  bool get isResetting {
    _$isResettingAtom.reportRead();
    return super.isResetting;
  }

  @override
  set isResetting(bool value) {
    _$isResettingAtom.reportWrite(value, super.isResetting, () {
      super.isResetting = value;
    });
  }

  late final _$deathCountdownDurationAtom =
      Atom(name: '_MainStateBase.deathCountdownDuration', context: context);

  @override
  int get deathCountdownDuration {
    _$deathCountdownDurationAtom.reportRead();
    return super.deathCountdownDuration;
  }

  @override
  set deathCountdownDuration(int value) {
    _$deathCountdownDurationAtom
        .reportWrite(value, super.deathCountdownDuration, () {
      super.deathCountdownDuration = value;
    });
  }

  late final _$sessionCountdownDurationAtom =
      Atom(name: '_MainStateBase.sessionCountdownDuration', context: context);

  @override
  int get sessionCountdownDuration {
    _$sessionCountdownDurationAtom.reportRead();
    return super.sessionCountdownDuration;
  }

  @override
  set sessionCountdownDuration(int value) {
    _$sessionCountdownDurationAtom
        .reportWrite(value, super.sessionCountdownDuration, () {
      super.sessionCountdownDuration = value;
    });
  }

  late final _$sessionRunningAtom =
      Atom(name: '_MainStateBase.sessionRunning', context: context);

  @override
  bool get sessionRunning {
    _$sessionRunningAtom.reportRead();
    return super.sessionRunning;
  }

  @override
  set sessionRunning(bool value) {
    _$sessionRunningAtom.reportWrite(value, super.sessionRunning, () {
      super.sessionRunning = value;
    });
  }

  @override
  String toString() {
    return '''
startText: ${startText},
isLoading: ${isLoading},
isResetting: ${isResetting},
deathCountdownDuration: ${deathCountdownDuration},
sessionCountdownDuration: ${sessionCountdownDuration},
sessionRunning: ${sessionRunning},
text: ${text}
    ''';
  }
}
