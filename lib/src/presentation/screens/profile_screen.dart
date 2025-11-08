import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/data/mock_data.dart';
import 'package:myapp/src/domain/models/doctor_model.dart';
import 'package:myapp/src/presentation/screens/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String? userEmail;
  final String userType;

  const ProfileScreen({super.key, this.userEmail, required this.userType});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Doctor? _user;

  @override
  void initState() {
    super.initState();
    if (widget.userType == 'doctor' && widget.userEmail != null) {
      _user = mockDoctors.firstWhere((doc) => doc.email == widget.userEmail);
    }
  }

  void _navigateToEditProfile() async {
    if (_user == null) return;

    final updatedDoctor = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(doctor: _user!),
      ),
    );

    if (updatedDoctor != null) {
      setState(() {
        final index = mockDoctors.indexWhere((doc) => doc.id == updatedDoctor.id);
        if (index != -1) {
          mockDoctors[index] = updatedDoctor;
        }
        _user = updatedDoctor;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully!')),
        );
      }
    }
  }

  void _logout() {
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: const Center(
          child: Text('User not found or not a doctor.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 60,
                child: Icon(Icons.person, size: 60),
              ),
              const SizedBox(height: 20),
              Text(
                _user!.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                _user!.specialization,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: const Text('Email'),
                  subtitle: Text(_user!.email),
                ),
              ),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.phone_outlined),
                  title: const Text('Phone'),
                  subtitle: Text(_user!.phone),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _navigateToEditProfile,
                icon: const Icon(Icons.edit_outlined),
                label: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _logout,
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text('Logout', style: TextStyle(color: Colors.red)),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  side: const BorderSide(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
