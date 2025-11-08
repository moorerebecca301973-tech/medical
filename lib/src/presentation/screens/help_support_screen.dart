import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqs = [
      {
        'question': 'How do I see my assigned patients?',
        'answer':
            'From the dashboard, tap on the "My Patients" card. This will show you a list of all patients currently assigned to you.',
      },
      {
        'question': 'How can I update my profile information?',
        'answer':
            'Navigate to the "Profile" screen from the dashboard. Tap the "Edit Profile" button to update your details. Note: This feature is currently in development.',
      },
      {
        'question': 'What do the different doctor statuses mean?',
        'answer':
            '"Active" means the doctor is available. "On Leave" means the doctor is temporarily unavailable. "Inactive" means the doctor is no longer with the facility.',
      },
      {
        'question': 'Who can assign patients to doctors?',
        'answer':
            'Only users with administrative privileges can assign patients to doctors using the "Assign Doctor" feature in the admin panel.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Frequently Asked Questions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...faqs.map((faq) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ExpansionTile(
                  title: Text(faq['question']!),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(faq['answer']!),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Still need help?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Contacting support...')),
                  );
              },
              icon: const Icon(Icons.support_agent),
              label: const Text('Contact Support'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
