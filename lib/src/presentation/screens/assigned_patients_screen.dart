import 'package:flutter/material.dart';
import 'package:myapp/src/data/mock_data.dart';
import 'package:myapp/src/domain/models/doctor_model.dart';

class AssignedPatientsScreen extends StatelessWidget {
  final String? doctorEmail;

  const AssignedPatientsScreen({super.key, this.doctorEmail});

  @override
  Widget build(BuildContext context) {
    final Doctor loggedInDoctor = mockDoctors.firstWhere(
      (doc) => doc.email == doctorEmail,
    );

    final assignedPatients = mockPatients.where((p) => p.assignedDoctor == loggedInDoctor.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Patients'),
      ),
      body: ListView.builder(
        itemCount: assignedPatients.length,
        itemBuilder: (context, index) {
          final patient = assignedPatients[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(patient.name),
              subtitle: Text('Age: ${patient.age}, Condition: ${patient.condition}'),
            ),
          );
        },
      ),
    );
  }
}
