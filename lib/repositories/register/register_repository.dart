import 'package:app_structure_example/repositories/register/base_register_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterRepository extends BaseRegisterRepository {
  RegisterRepository();

  @override
  Future<dynamic> register(
      String phone, String fullname, String email, String password) async {
    UserCredential result =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    debugPrint('$result');

    return result.user;
  }
}
