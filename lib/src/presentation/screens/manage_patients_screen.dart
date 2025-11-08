import 'package:flutter/material.dart';
import 'package:myapp/src/data/mock_data.dart';
import 'package:myapp/src/domain/models/patient_model.dart';

class ManagePatientsScreen extends StatefulWidget {
  const ManagePatientsScreen({super.key});

  @override
  State<ManagePatientsScreen> createState() => _ManagePatientsScreenState();
}

class _ManagePatientsScreenState extends State<ManagePatientsScreen> {
  late List<Patient> _filteredPatients;
  String _searchQuery = '';
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _filteredPatients = mockPatients;
  }

  void _filterPatients() {
    setState(() {
      _filteredPatients = mockPatients.where((patient) {
        final nameMatches = patient.name.toLowerCase().contains(_searchQuery.toLowerCase());
        final doctorMatches = patient.assignedDoctor.toLowerCase().contains(_searchQuery.toLowerCase());
        final statusMatches = _selectedStatus == null || patient.status == _selectedStatus;

        return (nameMatches || doctorMatches) && statusMatches;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final allStatuses = mockPatients.map((p) => p.status).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Patients'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                _searchQuery = value;
                _filterPatients();
              },
              decoration: const InputDecoration(
                labelText: 'Search by name or assigned doctor',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              children: allStatuses.map((status) {
                return ChoiceChip(
                  label: Text(status),
                  selected: _selectedStatus == status,
                  onSelected: (isSelected) {
                    setState(() {
                      _selectedStatus = isSelected ? status : null;
                      _filterPatients();
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredPatients.length,
              itemBuilder: (context, index) {
                final patient = _filteredPatients[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                     leading: CircleAvatar(
                      child: Text(patient.name[0]),
                    ),
                    title: Text(patient.name),
                    subtitle: Text('Assigned to: ${patient.assignedDoctor}'),
                     trailing: Text(
                      patient.status,
                      style: TextStyle(
                        color: patient.status == 'Admitted' ? Colors.blue : Colors.grey,
                      ),
                    ),
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
