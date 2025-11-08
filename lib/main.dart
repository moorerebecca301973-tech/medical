import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/presentation/screens/admin_dashboard_screen.dart';
import 'package:myapp/src/presentation/screens/assign_doctor_patient_screen.dart';
import 'package:myapp/src/presentation/screens/manage_doctors_screen.dart';
import 'package:myapp/src/presentation/screens/manage_patients_screen.dart';
import 'package:myapp/src/presentation/screens/system_configuration_screen.dart';
import 'package:myapp/src/presentation/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Health Monitoring App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/admin/dashboard',
      builder: (context, state) => const AdminDashboardScreen(),
    ),
    GoRoute(
      path: '/admin/manage-doctors',
      builder: (context, state) => const ManageDoctorsScreen(),
    ),
    GoRoute(
      path: '/admin/manage-patients',
      builder: (context, state) => const ManagePatientsScreen(),
    ),
    GoRoute(
      path: '/admin/assign-doctor',
      builder: (context, state) => const AssignDoctorPatientScreen(),
    ),
    GoRoute(
      path: '/admin/system-configuration',
      builder: (context, state) => const SystemConfigurationScreen(),
    ),
    // Add other routes here
  ],
);
