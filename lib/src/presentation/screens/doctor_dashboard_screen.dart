import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/data/mock_data.dart';
import 'package:myapp/src/domain/models/doctor_model.dart';
import 'package:myapp/src/domain/models/patient_model.dart';

class DoctorDashboardScreen extends StatelessWidget {
  final String? doctorEmail;

  const DoctorDashboardScreen({super.key, this.doctorEmail});

  @override
  Widget build(BuildContext context) {
    // Find the logged-in doctor from the mock data using the email
    final Doctor loggedInDoctor = mockDoctors.firstWhere(
      (doc) => doc.email == doctorEmail,
    );

    final assignedPatients = mockPatients.where((p) => p.assignedDoctor == loggedInDoctor.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => context.go('/doctor/notifications'),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => context.go('/doctor/profile'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${loggedInDoctor.name}!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            _buildStatsCards(context, assignedPatients.length),
            const SizedBox(height: 24),
            _buildQuickActions(context),
            const SizedBox(height: 24),
            _buildRecentPatientsList(context, assignedPatients),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCards(BuildContext context, int patientCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _StatCard(label: 'My Patients', value: patientCount.toString(), icon: Icons.people),
        const _StatCard(label: 'Active Alerts', value: '3', icon: Icons.warning),
        const _StatCard(label: 'Tasks Due', value: '4', icon: Icons.check_circle_outline),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2.5,
          children: [
            _QuickActionButton(
              label: 'View My Patients',
              icon: Icons.people_outline,
              onPressed: () => context.go('/doctor-dashboard/assigned-patients'),
            ),
            _QuickActionButton(
              label: 'View Alerts',
              icon: Icons.notifications_active_outlined,
              onPressed: () => context.go('/doctor/alerts'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentPatientsList(BuildContext context, List<Patient> assignedPatients) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recently Assigned Patients',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        if (assignedPatients.isNotEmpty)
          ...assignedPatients.take(2).map((patient) => Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person_outline),
                  ),
                  title: Text(patient.name),
                  subtitle: Text('Condition: ${patient.condition}'),
                  trailing: Text('Age: ${patient.age}', style: Theme.of(context).textTheme.bodySmall),
                ),
              ))
        else
          const Text('No patients assigned recently.'),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 32, color: Theme.of(context).primaryColor),
              const SizedBox(height: 8),
              Text(label, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
              const SizedBox(height: 4),
              Text(value, style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuickActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
      ),
      icon: Icon(icon),
      label: Text(label, textAlign: TextAlign.center),
      onPressed: onPressed,
    );
  }
}
