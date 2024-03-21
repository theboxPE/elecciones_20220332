class Vivencia {
  int? id;
  String title;
  DateTime date;
  String descripcion;
  String? imagePath;
  String? audioPath;

  Vivencia({
    this.id, 
    required this.title, 
    required this.date, 
    required this.descripcion, 
    this.imagePath, 
    this.audioPath
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': descripcion,
      'date': date.toIso8601String(),
      'image_path': imagePath,
      'audio_path': audioPath
    };
  }

}
