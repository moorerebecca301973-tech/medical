class Patient {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String condition;
  final String assignedDoctor;
  final bool alert;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.condition,
    required this.assignedDoctor,
    this.alert = false,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      condition: json['condition'],
      assignedDoctor: json['assigned_doctor'],
      alert: json['alert'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'condition': condition,
      'assigned_doctor': assignedDoctor,
      'alert': alert,
    };
  }
}
