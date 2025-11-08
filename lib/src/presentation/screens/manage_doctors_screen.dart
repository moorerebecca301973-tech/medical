import 'package:flutter/material.dart';
import 'package:myapp/src/data/mock_data.dart';
import 'package:myapp/src/domain/models/doctor_model.dart';

class ManageDoctorsScreen extends StatefulWidget {
  const ManageDoctorsScreen({super.key});

  @override
  State<ManageDoctorsScreen> createState() => _ManageDoctorsScreenState();
}

class _ManageDoctorsScreenState extends State<ManageDoctorsScreen> {
  late List<Doctor> _filteredDoctors;
  String _searchQuery = '';
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _filteredDoctors = mockDoctors;
  }

  void _filterDoctors() {
    setState(() {
      _filteredDoctors = mockDoctors.where((doctor) {
        final nameMatches = doctor.name.toLowerCase().contains(_searchQuery.toLowerCase());
        final specMatches = doctor.specialization.toLowerCase().contains(_searchQuery.toLowerCase());
        final statusMatches = _selectedStatus == null || doctor.status == _selectedStatus;

        return (nameMatches || specMatches) && statusMatches;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final allStatuses = mockDoctors.map((d) => d.status).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Doctors'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                _searchQuery = value;
                _filterDoctors();
              },
              decoration: const InputDecoration(
                labelText: 'Search by name or specialization',
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
                      _filterDoctors();
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = _filteredDoctors[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(doctor.name[0]),
                    ),
                    title: Text(doctor.name),
                    subtitle: Text(doctor.specialization),
                    trailing: Text(
                      doctor.status,
                      style: TextStyle(
                        color: doctor.status == 'Active' ? Colors.green : Colors.orange,
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
