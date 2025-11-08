import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoleSelectionScreen extends StatelessWidget {
  final String? userEmail;

  const RoleSelectionScreen({super.key, this.userEmail});

  @override
  Widget build(BuildContext context) {
    // Determine which buttons to show based on the user's email
    final bool isAdmin = userEmail == 'admin@medic.com';

    return Scaffold(
      appBar: AppBar(title: const Text('Select Your Role')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isAdmin) // Show Admin button only if the user is an admin
              ElevatedButton(
                onPressed: () {
                  context.go('/admin-dashboard');
                },
                child: const Text('Admin'),
              ),
            if (isAdmin)
              const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Pass the doctor's email to the dashboard
                context.go('/doctor-dashboard', extra: userEmail);
              },
              child: const Text('Doctor'),
            ),
          ],
        ),
      ),
    );
  }
}
