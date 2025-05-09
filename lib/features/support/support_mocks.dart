import 'domain/entities/academic_support_history.dart';
import 'domain/entities/academic_ticket.dart';
import 'domain/entities/platform_support_history.dart';
import 'domain/entities/platform_ticket.dart';

class SupportMocks {
  static AcademicSupportHistory academicSupportHistory = AcademicSupportHistory(closed: 30, pending: 3, total: 33, academicTickets: [
    AcademicTicket(
      id: 1,
      title: 'Test Ticket 1',
      status: 'replied',
      assistantEmail: 'asisMail@testExample.mail',
      assistantName: 'Test Assistant 1',
      createdAt: DateTime(
        2021,
        1,
        1,
      ),
      assistantPhoto: 'testurl.url',
      contactEmail: 'contactMail@testExample.mail',
      contactName: 'Test Contact 1',
      contactPhoto: 'testurl.url',
      contactRole: 'teacher',
      role: 'Teaching Assistant',
      courseName: "Course A",
    ),
    AcademicTicket(
      id: 2,
      title: 'Test Ticket 2',
      status: 'open',
      assistantEmail: 'asisMail@testExample.mail',
      assistantName: 'Test Assistant 2',
      createdAt: DateTime.now(),
      assistantPhoto: 'testurl.url',
      contactEmail: 'contactMail@testExample.mail',
      contactName: 'Test Contact 2',
      contactPhoto: 'testurl.url',
      contactRole: 'teacher',
      role: 'Teaching Assistant',
      courseName: "Course B",
    ),
    AcademicTicket(
      id: 3,
      title: 'Test Ticket 3',
      status: 'closed',
      assistantEmail: 'asisMail@testExample.mail',
      assistantName: 'Test Assistant 3',
      createdAt: DateTime(
        2022,
        1,
        1,
      ),
      assistantPhoto: 'testurl.url',
      contactEmail: 'contactMail@testExample.mail',
      contactName: 'Test Contact 3',
      contactPhoto: 'testurl.url',
      contactRole: 'teacher',
      role: 'Admin',
      courseName: "Course C",
    ),
  ]);

  static PlatformSupportHistory platformSupportHistory = PlatformSupportHistory(
    closed: 3,
    pending: 2,
    total: 5,
    platformTickets: [
      PlatformTicket(
        id: 1,
        title: 'Test Ticket 1',
        department: 'financial',
        status: 'open',
        updatedAt: DateTime(
          2022,
          1,
          1,
        ),
      ),
      PlatformTicket(
        id: 2,
        title: 'Test Ticket 2',
        department: 'managment',
        status: 'closed',
        updatedAt: DateTime(
          2022,
          1,
          1,
        ),
      ),
      PlatformTicket(
        id: 3,
        title: 'Test Ticket 3',
        department: 'managment',
        status: 'replied',
        updatedAt: DateTime.now(),
      ),
    ],
  );
}
