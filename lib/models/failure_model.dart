import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String type;
  final String message;

  const Failure({
    required this.type,
    required this.message,
  });

  @override
  List<Object?> get props => [type, message];

  factory Failure.fromJson(Map<String, dynamic> json) {
    return Failure(
      type: json['type'],
      message: json['message'],
    );
  }
}
