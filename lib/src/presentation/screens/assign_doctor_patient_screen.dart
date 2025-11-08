import 'package:flutter/material.dart';
import 'package:myapp/src/data/mock_data.dart';
import 'package:myapp/src/domain/models/doctor_model.dart';
import 'package:myapp/src/domain/models/patient_model.dart';

class AssignDoctorPatientScreen extends StatefulWidget {
  const AssignDoctorPatientScreen({super.key});

  @override
  State<AssignDoctorPatientScreen> createState() => _AssignDoctorPatientScreenState();
}

class _AssignDoctorPatientScreenState extends State<AssignDoctorPatientScreen> {
  Patient? _selectedPatient;
  Doctor? _selectedDoctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign Doctor to Patient'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<Patient>(
              initialValue: _selectedPatient,
              decoration: const InputDecoration(labelText: 'Select Patient'),
              items: mockPatients.map((patient) {
                return DropdownMenuItem<Patient>(
                  value: patient,
                  child: Text(patient.name),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedPatient = newValue;
                });
              },
            ),
            const SizedBox(height: 24),
            DropdownButtonFormField<Doctor>(
              initialValue: _selectedDoctor,
              decoration: const InputDecoration(labelText: 'Select Doctor'),
              items: mockDoctors.map((doctor) {
                return DropdownMenuItem<Doctor>(
                  value: doctor,
                  child: Text(doctor.name),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedDoctor = newValue;
                });
              },
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _assignDoctor,
                child: const Text('Assign'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _assignDoctor() {
    if (_selectedPatient != null && _selectedDoctor != null) {
      setState(() {
        final index = mockPatients.indexWhere((p) => p.id == _selectedPatient!.id);
        if (index != -1) {
          mockPatients[index] = Patient(
            id: _selectedPatient!.id,
            name: _selectedPatient!.name,
            age: _selectedPatient!.age,
            gender: _selectedPatient!.gender,
            condition: _selectedPatient!.condition,
            status: _selectedPatient!.status,
            assignedDoctor: _selectedDoctor!.id,
          );
        }
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Assigned ${_selectedDoctor!.name} to ${_selectedPatient!.name}'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select both a patient and a doctor.'),
        ),
      );
    }
  }
}
