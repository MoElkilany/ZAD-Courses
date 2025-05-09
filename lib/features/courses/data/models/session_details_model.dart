import '../../domain/entities/session_details.dart';

class SessionDetailsModel extends SessionDetails {
  const SessionDetailsModel({
    required super.id,
    required super.username,
    required super.password,
    required super.email,
    required super.clientId,
    required super.signature,
    required super.role,
  });

  factory SessionDetailsModel.fromJson(Map<String, dynamic> json) {
    return SessionDetailsModel(
      id: json['meeting_id'],
      username: json['user_name'],
      password: json['password'],
      email: json['user_email'],
      clientId: json['client_id'],
      signature: json['signature'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meeting_id': id,
      'user_name': username,
      'password': password,
      'user_email': email,
      'client_id': clientId,
      'signature': signature,
      'role': role,
    };
  }

  //to string
  @override
  String toString() {
    return 'SessionDetailsModel(id: $id, username: $username, password: $password, email: $email, clientId: $clientId, signature: $signature, role: $role)';
  }
}
