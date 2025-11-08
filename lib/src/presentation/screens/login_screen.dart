import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Health Admin',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Streamlining Hospital Management',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 48),
              ElevatedButton(
                onPressed: () {
                  // For now, we'll just navigate to the home screen
                  // In a real app, you would perform authentication here
                  context.go('/home');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Login as Admin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
