class VideoItem {
  final int id;
  final int sourceId;
  final String title;
  final String? description;
  final String? fullDescription;
  final String sourceLanguage;
  final String translatedLanguage;
  final String image;
  final int numAttachments;
  final String importanceLevel;
  final String apiUrl;
  final List<PreparedBy> preparedBy;
  final List<Attachment> attachments;
  final List<dynamic> locales;

  VideoItem({
    required this.id,
    required this.sourceId,
    required this.title,
    this.description,
    this.fullDescription,
    required this.sourceLanguage,
    required this.translatedLanguage,
    required this.image,
    required this.numAttachments,
    required this.importanceLevel,
    required this.apiUrl,
    required this.preparedBy,
    required this.attachments,
    required this.locales,
  });

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      id: json['id'],
      sourceId: json['source_id'],
      title: json['title'],
      description: json['description'],
      fullDescription: json['full_description'],
      sourceLanguage: json['source_language'],
      translatedLanguage: json['translated_language'],
      image: json['image'],
      numAttachments: json['num_attachments'],
      importanceLevel: json['importance_level'],
      apiUrl: json['api_url'],
      preparedBy: (json['prepared_by'] as List)
          .map((item) => PreparedBy.fromJson(item))
          .toList(),
      attachments: (json['attachments'] as List)
          .map((item) => Attachment.fromJson(item))
          .toList(),
      locales: json['locales'] ?? [],
    );
  }
}

class PreparedBy {
  final int id;
  final int sourceId;
  final String title;
  final String kind;
  final String? description;
  final String apiUrl;

  PreparedBy({
    required this.id,
    required this.sourceId,
    required this.title,
    required this.kind,
    this.description,
    required this.apiUrl,
  });

  factory PreparedBy.fromJson(Map<String, dynamic> json) {
    return PreparedBy(
      id: json['id'],
      sourceId: json['source_id'],
      title: json['title'],
      kind: json['kind'],
      description: json['description'],
      apiUrl: json['api_url'],
    );
  }
}

class Attachment {
  final int order;
  final String size;
  final String extensionType;
  final String? description;
  final String url;

  Attachment({
    required this.order,
    required this.size,
    required this.extensionType,
    this.description,
    required this.url,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      order: json['order'],
      size: json['size'],
      extensionType: json['extension_type'],
      description: json['description'],
      url: json['url'],
    );
  }
}
