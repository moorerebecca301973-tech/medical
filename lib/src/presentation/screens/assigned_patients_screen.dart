import 'package:flutter/material.dart';
import 'package:myapp/src/data/mock_data.dart';

class AssignedPatientsScreen extends StatelessWidget {
  const AssignedPatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final assignedPatients = mockPatients.where((p) => p.assignedDoctor == '1').toList(); // Mocking assigned patients for Dr. John Doe

    return Scaffold(
      appBar: AppBar(title: const Text('Assigned Patients')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name, condition...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: assignedPatients.length,
              itemBuilder: (context, index) {
                final patient = assignedPatients[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(patient.name[0]),
                    ),
                    title: Text(patient.name),
                    subtitle: Text(
                        '${patient.condition} - ${patient.age} years old'),
                    trailing: patient.alert
                        ? const Icon(Icons.warning, color: Colors.red)
                        : null,
                    onTap: () {
                      // Navigate to patient profile
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
