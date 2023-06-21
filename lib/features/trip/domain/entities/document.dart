class Document {
  final String description;
  final String url;
  final String name;

  Document({required this.description, required this.url, required this.name});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
        description: json['description'], url: json['url'], name: json['name']);
  }
}
