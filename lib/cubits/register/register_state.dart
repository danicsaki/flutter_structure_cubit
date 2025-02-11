part of 'register_cubit.dart';

enum RegisterStateStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  final RegisterStateStatus status;
  final User? user;
  final Failure? exception;

  const RegisterState(
      {this.status = RegisterStateStatus.initial, this.user, this.exception});

  RegisterState copyWith({
    RegisterStateStatus? status,
    User? user,
    Failure? exception,
  }) {
    return RegisterState(
      status: status ?? this.status,
      user: user ?? this.user,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [status, user, exception];
}
