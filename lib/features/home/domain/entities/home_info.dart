import 'package:equatable/equatable.dart';

import 'partner.dart';
import 'testmonial.dart';

class HomeInformation extends Equatable {
  final List<Testmonial> testmonials;
  final List<Partner> partners;
  const HomeInformation({required this.testmonials, required this.partners});

  @override
  List<Object?> get props => [testmonials, partners];
}
