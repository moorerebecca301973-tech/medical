class Assignment {
  final String id;
  final String doctorId;
  final String patientId;
  final DateTime assignedAt;

  Assignment({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.assignedAt,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      id: json['id'],
      doctorId: json['doctor_id'],
      patientId: json['patient_id'],
      assignedAt: DateTime.parse(json['assigned_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctorId,
      'patient_id': patientId,
      'assigned_at': assignedAt.toIso8601String(),
    };
  }
}
