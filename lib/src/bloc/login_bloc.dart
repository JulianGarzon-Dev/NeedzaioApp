import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:userapp/src/bloc/validators.dart';

class LoginBloc with Validators {
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Function(String) get changePassword => _passwordController.sink.add;

  String get password => _passwordController.value;

  dispose() {
    _passwordController?.close();
  }
}
