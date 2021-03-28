import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:time_tracker/services/auth.dart';

class SignInBloc {
  final AuthBase auth;

  SignInBloc({@required this.auth});

  final StreamController<bool> _isLoadingController = StreamController<bool>();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future<User1> _signIn(Future<User1> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      _setIsLoading(false);
      rethrow;
    }
  }

  Future<User1> signInAnonymously()  async => await _signIn(auth.signInAnonymously);

  Future<User1> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);

  Future<User1> signInWithFacebook() async => await _signIn(auth.signInWithFacebook);
}
