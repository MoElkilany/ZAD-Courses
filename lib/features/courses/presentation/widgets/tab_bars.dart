import 'package:flutter/material.dart';
import '../../../../core/config/app_padding.dart';
import 'certificate_view/certificate_view.dart';
import 'content_view/content_view.dart';
import 'office_hours_view/office_hours_view.dart';
import 'learning_tab.dart';
import 'quiz_view/quiz_view.dart';

const tabBar = TabBar(
  indicatorPadding: appPaddingSymH8,
  indicatorWeight: 4.0,
  tabs: [
    LearningTab(
      text: 'learning.content',
    ),
    LearningTab(
      text: 'learning.quizzes',
    ),
    LearningTab(
      text: 'learning.certificates',
    ),
    LearningTab(
      text: 'learning.officeHours',
    ),
  ],
);

const tabBarViews = TabBarView(
  children: [
    ContentTabBarView(),
    QuizzesTabBarView(),
    CertificateTabBarView(),
    OfficeHoursTabBarView(),
  ],
);
