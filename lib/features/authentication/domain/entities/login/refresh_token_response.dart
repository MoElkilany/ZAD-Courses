import 'package:equatable/equatable.dart';

class RefreshTokenResponse extends Equatable {
  final String token;

  const RefreshTokenResponse({required this.token});
  @override
  List<Object?> get props => [token];
}
