import 'package:flutter/material.dart';
import 'package:myapp/src/domain/models/notification_model.dart';

final List<NotificationModel> mockNotifications = [
  NotificationModel(
    id: '1',
    title: 'New Patient Assigned',
    message: 'A new patient, John Doe, has been assigned to you.',
    timestamp: DateTime.now().subtract(const Duration(hours: 1)),
    icon: Icons.person_add,
  ),
  NotificationModel(
    id: '2',
    title: 'System Update',
    message: 'The system will be down for maintenance tonight at 10 PM.',
    timestamp: DateTime.now().subtract(const Duration(days: 1)),
    icon: Icons.system_update,
  ),
  NotificationModel(
    id: '3',
    title: 'New Doctor Account Created',
    message: 'A new doctor account has been created for Dr. Smith.',
    timestamp: DateTime.now().subtract(const Duration(days: 2)),
    icon: Icons.medical_services,
  ),
  NotificationModel(
    id: '4',
    title: 'Report Ready',
    message: 'Your monthly patient report is ready for download.',
    timestamp: DateTime.now().subtract(const Duration(days: 3)),
    icon: Icons.insert_drive_file,
  ),
];
