import 'package:myapp/src/domain/models/doctor_model.dart';
import 'package:myapp/src/domain/models/patient_model.dart';
import 'package:myapp/src/domain/models/assignment_model.dart';
import 'package:myapp/src/domain/models/system_configuration_model.dart';

final List<Doctor> mockDoctors = [
  Doctor(
    id: '1',
    name: 'Dr. Emeka',
    email: 'emeka@medic.com',
    phone: '123-456-7890',
    specialization: 'Cardiology',
    status: 'Active',
  ),
  Doctor(
    id: '2',
    name: 'Dr. Jane Smith',
    email: 'jane.smith@example.com',
    phone: '098-765-4321',
    specialization: 'Neurology',
    status: 'Active',
  ),
  Doctor(
    id: '3',
    name: 'Dr. Peter Jones',
    email: 'peter.jones@example.com',
    phone: '555-555-5555',
    specialization: 'Pediatrics',
    status: 'Inactive',
  ),
];

final List<Patient> mockPatients = [
  Patient(
    id: '1',
    name: 'Alice Johnson',
    age: 34,
    gender: 'Female',
    condition: 'Hypertension',
    assignedDoctor: '1', // Doctor ID
    status: 'Admitted',
  ),
  Patient(
    id: '2',
    name: 'Bob Williams',
    age: 52,
    gender: 'Male',
    condition: 'Diabetes',
    assignedDoctor: '2', // Doctor ID
    status: 'Stable',
  ),
  Patient(
    id: '3',
    name: 'Charlie Brown',
    age: 68,
    gender: 'Male',
    condition: 'Arthritis',
    assignedDoctor: '1', // Doctor ID
    status: 'Discharged',
  ),
];

final List<Assignment> mockAssignments = [
  Assignment(
    id: '1',
    doctorId: '1',
    patientId: '1',
    assignedAt: DateTime.now().subtract(const Duration(days: 10)),
  ),
  Assignment(
    id: '2',
    doctorId: '2',
    patientId: '2',
    assignedAt: DateTime.now().subtract(const Duration(days: 5)),
  ),
  Assignment(
    id: '3',
    doctorId: '1',
    patientId: '3',
    assignedAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
];

final SystemConfiguration mockSystemConfiguration = SystemConfiguration(
  activeMetrics: {
    'Heart Rate': true,
    'Blood Pressure': true,
    'Blood Sugar': true,
    'Body Temperature': false,
    'Oxygen Saturation': true,
  },
  normalRanges: {
    'Heart Rate': '60-100 bpm',
    'Blood Pressure': '90/60 - 120/80 mmHg',
    'Blood Sugar': '70-140 mg/dL',
    'Body Temperature': '97.8 - 99.1 °F',
    'Oxygen Saturation': '95-100%',
  },
);
