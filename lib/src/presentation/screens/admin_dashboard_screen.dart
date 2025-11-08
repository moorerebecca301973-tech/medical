import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.go('/admin/settings'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Admin!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            _buildStatsCards(context),
            const SizedBox(height: 24),
            _buildQuickActions(context),
            const SizedBox(height: 24),
            _buildRecentActivity(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCards(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _StatCard(label: 'Doctors', value: '12', icon: Icons.medical_services),
        _StatCard(label: 'Patients', value: '150', icon: Icons.people),
        _StatCard(label: 'Alerts', value: '5', icon: Icons.warning),
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
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _QuickActionButton(
              label: 'Manage Doctors',
              icon: Icons.medical_services_outlined,
              onPressed: () => context.go('/admin/manage-doctors'),
            ),
            _QuickActionButton(
              label: 'Manage Patients',
              icon: Icons.people_outline,
              onPressed: () => context.go('/admin/manage-patients'),
            ),
            _QuickActionButton(
              label: 'Assign Doctor',
              icon: Icons.assignment_ind_outlined,
              onPressed: () => context.go('/admin/assign-doctor'),
            ),
            _QuickActionButton(
              label: 'System Config',
              icon: Icons.settings_applications_outlined,
              onPressed: () => context.go('/admin/system-configuration'),
            ),
             _QuickActionButton(
              label: 'Reports',
              icon: Icons.analytics_outlined,
              onPressed: () => context.go('/admin/reports'),
            ),
          ],
        ),
      ],
    );
  }

    Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person_add),
            ),
            title: const Text('New Doctor Added'),
            subtitle: const Text('Dr. John Doe - Cardiology'),
            trailing: Text('2 hours ago', style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
         Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.assignment_turned_in),
            ),
            title: const Text('Patient Assigned'),
            subtitle: const Text('Jane Smith to Dr. John Doe'),
            trailing: Text('5 hours ago', style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(label, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(value, style: Theme.of(context).textTheme.headlineMedium),
          ],
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
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: Icon(icon),
      label: Text(label, textAlign: TextAlign.center),
      onPressed: onPressed,
    );
  }
}
