import '../../domain/entities/home_info.dart';
import 'partner_model.dart';
import 'testmonial_model.dart';

class HomeInformationModel extends HomeInformation {
  const HomeInformationModel({
    required List<TestmonialModel> testmonials,
    required List<PartnerModel> partners,
  }) : super(testmonials: testmonials, partners: partners);

  factory HomeInformationModel.fromJson(Map<String, dynamic> json) {
    final testmonials = (json["testmonials"] as List)
        .map((e) => TestmonialModel.fromJson(e))
        .toList();
    final partners = (json["partners"] as List)
        .map((e) => PartnerModel.fromJson(e))
        .toList();
    return HomeInformationModel(
      testmonials: testmonials,
      partners: partners,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'testmonials':
          testmonials.map((e) => (e as TestmonialModel).toJson()).toList(),
      'partners': partners.map((e) => (e as PartnerModel).toJson()).toList()
    };
  }
}
