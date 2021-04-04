import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:time_tracker/services/auth.dart';

class SignInManager {
  SignInManager({@required this.auth, this.isLoading});
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;

  Future<User1> _signIn(Future<User1> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<User1> signInAnonymously()  async => await _signIn(auth.signInAnonymously);

  Future<User1> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);

  Future<User1> signInWithFacebook() async => await _signIn(auth.signInWithFacebook);
}
