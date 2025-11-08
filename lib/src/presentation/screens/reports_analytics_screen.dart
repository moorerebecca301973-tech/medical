import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:collection/collection.dart';
import 'package:myapp/src/data/mock_data.dart';

class ReportsAnalyticsScreen extends StatelessWidget {
  const ReportsAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final patientCountByDoctor = groupBy(mockPatients, (p) => p.assignedDoctor)
        .map((key, value) => MapEntry(key, value.length));

    final patientCountByCondition = groupBy(mockPatients, (p) => p.condition)
        .map((key, value) => MapEntry(key, value.length));

    return Scaffold(
      appBar: AppBar(title: const Text('Reports & Analytics')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'Patient Distribution by Doctor'),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: BarChart(
              BarChartData(
                barGroups: patientCountByDoctor.entries.mapIndexed((index, entry) {
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: entry.value.toDouble(),
                        color: Colors.blue,
                        width: 16,
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= 0 && index < patientCountByDoctor.keys.length) {
                          final doctorId = patientCountByDoctor.keys.elementAt(index);
                          final doctor = mockDoctors.firstWhere((d) => d.id == doctorId);
                          return Text(doctor.name, style: const TextStyle(fontSize: 10));
                        } 
                        return const Text('');
                      },
                      reservedSize: 40,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: true),
              ),
            ),
          ),
          const SizedBox(height: 32),
          _buildSectionTitle(context, 'Patient Distribution by Condition'),
          const SizedBox(height: 16),
          SizedBox(
            height: 300,
            child: PieChart(
              PieChartData(
                sections: patientCountByCondition.entries.mapIndexed((index, entry) {
                  return PieChartSectionData(
                    color: Colors.primaries[index % Colors.primaries.length],
                    value: entry.value.toDouble(),
                    title: '${entry.key}\n(${entry.value})',
                    radius: 100,
                    titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
