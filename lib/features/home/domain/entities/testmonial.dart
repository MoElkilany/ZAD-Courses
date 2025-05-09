import 'package:equatable/equatable.dart';

class Testmonial extends Equatable {
  final Uri imageSrc;
  final String title;
  final int rating;
  final String comment;
  const Testmonial({
    required this.title,
    required this.rating,
    required this.comment,
    required this.imageSrc,
  });

  @override
  List<Object?> get props => [imageSrc.toString(), title, rating, comment];
}
