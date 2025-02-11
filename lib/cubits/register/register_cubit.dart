import 'package:app_structure_example/models/models.dart';
import 'package:app_structure_example/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository repository;

  RegisterCubit({required this.repository}) : super(const RegisterState());

  Future<void> register(
      String phone, String fullname, String email, String password) async {
    try {
      emit(state.copyWith(status: RegisterStateStatus.loading));

      var user = await repository.register(phone, fullname, email, password);

      emit(state.copyWith(status: RegisterStateStatus.success, user: user));
    } catch (e) {
      emit(state.copyWith(status: RegisterStateStatus.failure));
    }
  }
}
