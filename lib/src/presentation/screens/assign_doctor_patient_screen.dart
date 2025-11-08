import 'package:flutter/material.dart';
import 'package:myapp/src/data/mock_data.dart';
import 'package:myapp/src/domain/models/assignment_model.dart';
import 'package:myapp/src/domain/models/doctor_model.dart';
import 'package:myapp/src/domain/models/patient_model.dart';

class AssignDoctorPatientScreen extends StatefulWidget {
  const AssignDoctorPatientScreen({super.key});

  @override
  State<AssignDoctorPatientScreen> createState() =>
      _AssignDoctorPatientScreenState();
}

class _AssignDoctorPatientScreenState extends State<AssignDoctorPatientScreen> {
  late List<Assignment> _assignments;
  late List<Doctor> _doctors;
  late List<Patient> _patients;

  @override
  void initState() {
    super.initState();
    _assignments = mockAssignments;
    _doctors = mockDoctors;
    _patients = mockPatients;
  }

  String _getDoctorName(String doctorId) {
    return _doctors.firstWhere((d) => d.id == doctorId).name;
  }

  String _getPatientName(String patientId) {
    return _patients.firstWhere((p) => p.id == patientId).name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assign Doctor to Patient')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildAssignmentList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAssignNewDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAssignmentList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _assignments.length,
        itemBuilder: (context, index) {
          final assignment = _assignments[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                  '${_getDoctorName(assignment.doctorId)} - ${_getPatientName(assignment.patientId)}'),
              subtitle: Text(
                  'Assigned on: ${assignment.assignedAt.toLocal().toString().split(' ')[0]}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _showRemoveAssignmentDialog(assignment),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAssignNewDialog() {
    String? selectedDoctorId;
    String? selectedPatientId;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Assign New'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Select Doctor'),
                items: _doctors
                    .map((d) => DropdownMenuItem(value: d.id, child: Text(d.name)))
                    .toList(),
                onChanged: (value) => selectedDoctorId = value,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Select Patient'),
                items: _patients
                    .map((p) => DropdownMenuItem(value: p.id, child: Text(p.name)))
                    .toList(),
                onChanged: (value) => selectedPatientId = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedDoctorId != null && selectedPatientId != null) {
                  final newAssignment = Assignment(
                    id: (_assignments.length + 1).toString(),
                    doctorId: selectedDoctorId!,
                    patientId: selectedPatientId!,
                    assignedAt: DateTime.now(),
                  );
                  setState(() {
                    _assignments.add(newAssignment);
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Assign'),
            ),
          ],
        );
      },
    );
  }

  void _showRemoveAssignmentDialog(Assignment assignment) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remove Assignment'),
          content: const Text('Are you sure you want to remove this assignment?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  _assignments.removeWhere((a) => a.id == assignment.id);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );
  }
}
