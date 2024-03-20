
class Datos {
  final int? id;
  final String title;
  final String description;
  final DateTime date;
  final String? imagePath;
  final String? audioPath;

  Datos({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    this.imagePath,
    this.audioPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'image_path': imagePath,
      'audio_path': audioPath,
    };
  }
}