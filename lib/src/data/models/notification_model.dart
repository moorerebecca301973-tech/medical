class Notification {
  final String id;
  final String title;
  final String message;
  final DateTime createdAt;
  bool read;

  Notification({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
    this.read = false,
  });
}
