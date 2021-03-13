import 'dart:async';

class Validators {
  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 7) {
      sink.add(password);
    } else {
      sink.addError('Al menos 7 caracteres');
    }
  });
}
