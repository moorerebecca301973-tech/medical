import 'package:go_router/go_router.dart';
import 'package:myapp/src/presentation/screens/splash_screen.dart';
import 'package:myapp/src/presentation/screens/login_screen.dart';
import 'package:myapp/src/presentation/screens/role_selection_screen.dart';
import 'package:myapp/src/presentation/screens/profile_screen.dart';
import 'package:myapp/src/presentation/screens/notifications_screen.DART';
import 'package:myapp/src/presentation/screens/help_support_screen.dart';
import 'package:myapp/src/presentation/screens/admin_dashboard_screen.dart';
import 'package:myapp/src/presentation/screens/doctor_dashboard_screen.dart';
import 'package:myapp/src/presentation/screens/manage_doctors_screen.dart';
import 'package:myapp/src/presentation/screens/manage_patients_screen.dart';
import 'package:myapp/src/presentation/screens/assign_doctor_patient_screen.dart';
import 'package:myapp/src/presentation/screens/system_configuration_screen.dart';
import 'package:myapp/src/presentation/screens/reports_analytics_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/role-selection',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/help-support',
      builder: (context, state) => const HelpSupportScreen(),
    ),
    GoRoute(
        path: '/admin',
        redirect: (context, state) => '/admin/dashboard',
        routes: [
          GoRoute(
            path: 'dashboard',
            builder: (context, state) => const AdminDashboardScreen(),
          ),
          GoRoute(
            path: 'manage-doctors',
            builder: (context, state) => const ManageDoctorsScreen(),
          ),
          GoRoute(
            path: 'manage-patients',
            builder: (context, state) => const ManagePatientsScreen(),
          ),
          GoRoute(
            path: 'assign-doctor',
            builder: (context, state) => const AssignDoctorPatientScreen(),
          ),
          GoRoute(
            path: 'system-configuration',
            builder: (context, state) => const SystemConfigurationScreen(),
          ),
          GoRoute(
            path: 'reports',
            builder: (context, state) => const ReportsAnalyticsScreen(),
          ),
        ]),
    GoRoute(
      path: '/doctor-dashboard',
      builder: (context, state) => const DoctorDashboardScreen(),
    ),
  ],
);
