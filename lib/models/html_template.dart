class HtmlTemplate {
  final String name;
  final String description;
  final String content;
  final String category;
  const HtmlTemplate({
    required this.name,
    required this.description,
    required this.content,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'content': content,
      'category': category,
    };
  }

  factory HtmlTemplate.fromJson(Map<String, dynamic> json) {
    return HtmlTemplate(
      name: json['name'],
      description: json['description'],
      content: json['content'],
      category: json['category'],
    );
  }
}
