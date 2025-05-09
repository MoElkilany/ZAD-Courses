import 'package:equatable/equatable.dart';

class Partner extends Equatable {
  final Uri imageSrc;
  final String title;
  final String subtitle;
  const Partner({
    required this.imageSrc,
    required this.title,
    required this.subtitle,
  });

  @override
  List<Object?> get props => [imageSrc, title, subtitle];
}
