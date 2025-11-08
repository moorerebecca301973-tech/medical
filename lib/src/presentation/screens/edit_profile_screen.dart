import 'package:flutter/material.dart';
import 'package:myapp/src/domain/models/doctor_model.dart';

class EditProfileScreen extends StatefulWidget {
  final Doctor doctor;

  const EditProfileScreen({super.key, required this.doctor});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.doctor.name);
    _phoneController = TextEditingController(text: widget.doctor.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Create a new doctor object with the updated info
      final updatedDoctor = Doctor(
        id: widget.doctor.id,
        name: _nameController.text,
        email: widget.doctor.email, // Email is not editable
        phone: _phoneController.text,
        specialization: widget.doctor.specialization, // Specialization is not editable
        status: widget.doctor.status,
      );

      // Pass the updated doctor back to the previous screen
      Navigator.pop(context, updatedDoctor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveProfile,
            tooltip: 'Save',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                 validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              _buildReadOnlyField('Email', widget.doctor.email, Icons.email_outlined),
              const SizedBox(height: 16),
              _buildReadOnlyField('Specialization', widget.doctor.specialization, Icons.work_outline),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                 onPressed: _saveProfile,
                 icon: const Icon(Icons.save),
                 label: const Text('Save Changes'),
                 style: ElevatedButton.styleFrom(
                   padding: const EdgeInsets.symmetric(vertical: 16),
                 ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value, IconData icon) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      child: Text(value, style: const TextStyle(fontSize: 16)),
    );
  }
}
