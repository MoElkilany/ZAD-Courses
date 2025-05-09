import 'package:equatable/equatable.dart';

class SessionDetails extends Equatable {
  final String id;
  final String username;
  final String password;
  final String email;
  final String clientId;
  final String signature;
  final int role;

  const SessionDetails({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.clientId,
    required this.signature,
    required this.role,
  });

  @override
  List<Object?> get props => [
        id,
        username,
        password,
        email,
        clientId,
        signature,
        role,
      ];
}
