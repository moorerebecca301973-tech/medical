import 'package:flutter/material.dart';
import 'package:myapp/src/data/mock_data.dart';
import 'package:myapp/src/domain/models/system_configuration_model.dart';

class SystemConfigurationScreen extends StatefulWidget {
  const SystemConfigurationScreen({super.key});

  @override
  State<SystemConfigurationScreen> createState() =>
      _SystemConfigurationScreenState();
}

class _SystemConfigurationScreenState extends State<SystemConfigurationScreen> {
  late SystemConfiguration _config;

  @override
  void initState() {
    super.initState();
    _config = mockSystemConfiguration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('System Configuration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: _config.activeMetrics.keys.map((metric) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(metric),
                subtitle: Text('Normal Range: ${_config.normalRanges[metric]}'),
                trailing: Switch(
                  value: _config.activeMetrics[metric]!,
                  onChanged: (value) {
                    setState(() {
                      _config.activeMetrics[metric] = value;
                    });
                  },
                ),
                onTap: () => _showEditRangeDialog(metric),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showEditRangeDialog(String metric) {
    final rangeController = TextEditingController(
      text: _config.normalRanges[metric],
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Normal Range for $metric'),
          content: TextField(
            controller: rangeController,
            decoration: const InputDecoration(labelText: 'Normal Range'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _config.normalRanges[metric] = rangeController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
