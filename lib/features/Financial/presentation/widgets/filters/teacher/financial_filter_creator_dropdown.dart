// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:zad_test/core/config/app_font_size.dart';
// import 'package:zad_test/core/config/app_padding.dart';
// import 'package:zad_test/core/config/app_sized_box.dart';
// import 'package:zad_test/core/config/colors.dart';
// import 'package:zad_test/features/assignments/presentation/providers/assignment_lists_manager.dart';
// import 'package:zad_test/core/config/app_border.dart';

// class FinancialFilterCreatorDropDown extends ConsumerStatefulWidget {

//   const FinancialFilterCreatorDropDown({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _FinancialFilterCreatorDropDownState();
// }

// class _FinancialFilterCreatorDropDownState
//     extends ConsumerState<FinancialFilterCreatorDropDown> {
//   @override
//   Widget build(BuildContext context) {
//     final asgManager =
//         ref.watch(studentAssignmentsListManagerProvider.notifier);
//     return Column(
//       children: [
//         Text(
//           'financial.creator'.tr(),
//           style: const TextStyle(
//             fontSize: appFontSizeLarge,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         DropdownButton<String>(
//           value: asgManager.selectedAssignment,
//           isExpanded: true,
//           icon: const Padding(
//             padding: appPaddingAll8,
//             child: Icon(
//               Icons.arrow_downward,
//             ),
//           ),
//           iconSize: 14,
//           elevation: 16,
//           style: const TextStyle(color: Colors.black),
//           underline: Container(
//             height: 2,
//             color: kPrimary,
//           ),
//           hint: Text('financial.filter.selectCreator'.tr()),
//           disabledHint: Text('financial.filter.selectCreator'.tr()),
//           borderRadius: appBordRadCir8,
//           onChanged: (String? newValue) {
//             asgManager.setSelectedAssignment(newValue);
//             setState(() {});
//           },
//           items: asgManager.dropDownStudentAssignments,
//         ),
//         appSizeBoxH01,
//         const Divider(
//           thickness: 1,
//         ),
//         appSizeBoxH01,
//       ],
//     );
//   }
// }
