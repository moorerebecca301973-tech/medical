import 'package:flutter/material.dart';
import 'package:myapp/src/data/mock_data.dart';
import 'package:myapp/src/domain/models/patient_model.dart';

class ManagePatientsScreen extends StatefulWidget {
  const ManagePatientsScreen({super.key});

  @override
  State<ManagePatientsScreen> createState() => _ManagePatientsScreenState();
}

class _ManagePatientsScreenState extends State<ManagePatientsScreen> {
  late List<Patient> _patients;
  late List<Patient> _filteredPatients;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _patients = mockPatients;
    _filteredPatients = _patients;
    _searchController.addListener(_filterPatients);
  }

  void _filterPatients() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPatients = _patients.where((patient) {
        return patient.name.toLowerCase().contains(query) ||
            patient.condition.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Patients')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildPatientList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddPatientDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        labelText: 'Search Patients',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildPatientList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _filteredPatients.length,
        itemBuilder: (context, index) {
          final patient = _filteredPatients[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(patient.name[0]),
              ),
              title: Text(patient.name),
              subtitle: Text(patient.condition),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _showEditPatientDialog(patient),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _showDeleteConfirmationDialog(patient),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAddPatientDialog() {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final genderController = TextEditingController();
    final conditionController = TextEditingController();
    final assignedDoctorController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Patient'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name' : null,
                  ),
                  TextFormField(
                    controller: ageController,
                    decoration: const InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter an age' : null,
                  ),
                  TextFormField(
                    controller: genderController,
                    decoration: const InputDecoration(labelText: 'Gender'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a gender' : null,
                  ),
                  TextFormField(
                    controller: conditionController,
                    decoration: const InputDecoration(labelText: 'Condition'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a condition' : null,
                  ),
                  TextFormField(
                    controller: assignedDoctorController,
                    decoration: const InputDecoration(labelText: 'Assigned Doctor'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please assign a doctor' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newPatient = Patient(
                    id: (_patients.length + 1).toString(),
                    name: nameController.text,
                    age: int.parse(ageController.text),
                    gender: genderController.text,
                    condition: conditionController.text,
                    assignedDoctor: assignedDoctorController.text,
                  );
                  setState(() {
                    _patients.add(newPatient);
                    _filterPatients();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditPatientDialog(Patient patient) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: patient.name);
    final ageController = TextEditingController(text: patient.age.toString());
    final genderController = TextEditingController(text: patient.gender);
    final conditionController = TextEditingController(text: patient.condition);
    final assignedDoctorController =
        TextEditingController(text: patient.assignedDoctor);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Patient'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a name' : null,
                  ),
                  TextFormField(
                    controller: ageController,
                    decoration: const InputDecoration(labelText: 'Age'),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter an age' : null,
                  ),
                  TextFormField(
                    controller: genderController,
                    decoration: const InputDecoration(labelText: 'Gender'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a gender' : null,
                  ),
                  TextFormField(
                    controller: conditionController,
                    decoration: const InputDecoration(labelText: 'Condition'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a condition' : null,
                  ),
                  TextFormField(
                    controller: assignedDoctorController,
                    decoration: const InputDecoration(labelText: 'Assigned Doctor'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please assign a doctor' : null,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final updatedPatient = Patient(
                    id: patient.id,
                    name: nameController.text,
                    age: int.parse(ageController.text),
                    gender: genderController.text,
                    condition: conditionController.text,
                    assignedDoctor: assignedDoctorController.text,
                  );

                  setState(() {
                    final index = _patients.indexWhere((p) => p.id == patient.id);
                    if (index != -1) {
                      _patients[index] = updatedPatient;
                      _filterPatients();
                    }
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(Patient patient) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Patient'),
          content: Text('Are you sure you want to delete ${patient.name}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  _patients.removeWhere((p) => p.id == patient.id);
                  _filterPatients();
                });
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
