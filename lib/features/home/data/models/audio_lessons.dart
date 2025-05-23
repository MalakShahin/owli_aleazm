class AudioItem {
  int id;
  int sourceId;
  String title;
  String type;
  int addDate;
  int updateDate;
  String description;
  String? fullDescription;
  String sourceLanguage;
  String translatedLanguage;
  String? image;
  int numAttachments;
  String importanceLevel;
  String apiUrl;
  List<PreparedBy> preparedBy;
  List<Attachment> attachments;

  AudioItem({
    required this.id,
    required this.sourceId,
    required this.title,
    required this.type,
    required this.addDate,
    required this.updateDate,
    required this.description,
    this.fullDescription,
    required this.sourceLanguage,
    required this.translatedLanguage,
    this.image,
    required this.numAttachments,
    required this.importanceLevel,
    required this.apiUrl,
    required this.preparedBy,
    required this.attachments,
  });

  factory AudioItem.fromJson(Map<String, dynamic> json) {
    var preparedByList = (json['prepared_by'] as List)
        .map((item) => PreparedBy.fromJson(item))
        .toList();
    var attachmentsList = (json['attachments'] as List)
        .map((item) => Attachment.fromJson(item))
        .toList();

    return AudioItem(
      id: json['id'],
      sourceId: json['source_id'],
      title: json['title'],
      type: json['type'],
      addDate: json['add_date'],
      updateDate: json['update_date'],
      description: json['description'],
      fullDescription: json['full_description'],
      sourceLanguage: json['source_language'],
      translatedLanguage: json['translated_language'],
      image: json['image'],
      numAttachments: json['num_attachments'],
      importanceLevel: json['importance_level'],
      apiUrl: json['api_url'],
      preparedBy: preparedByList,
      attachments: attachmentsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'source_id': sourceId,
      'title': title,
      'type': type,
      'add_date': addDate,
      'update_date': updateDate,
      'description': description,
      'full_description': fullDescription,
      'source_language': sourceLanguage,
      'translated_language': translatedLanguage,
      'image': image,
      'num_attachments': numAttachments,
      'importance_level': importanceLevel,
      'api_url': apiUrl,
      'prepared_by': preparedBy.map((e) => e.toJson()).toList(),
      'attachments': attachments.map((e) => e.toJson()).toList(),
    };
  }
}

class PreparedBy {
  int id;
  int sourceId;
  String title;
  String type;
  String kind;
  String description;
  String apiUrl;

  PreparedBy({
    required this.id,
    required this.sourceId,
    required this.title,
    required this.type,
    required this.kind,
    required this.description,
    required this.apiUrl,
  });

  factory PreparedBy.fromJson(Map<String, dynamic> json) {
    return PreparedBy(
      id: json['id'],
      sourceId: json['source_id'],
      title: json['title'],
      type: json['type'],
      kind: json['kind'],
      description: json['description'],
      apiUrl: json['api_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'source_id': sourceId,
      'title': title,
      'type': type,
      'kind': kind,
      'description': description,
      'api_url': apiUrl,
    };
  }
}

class Attachment {
  int order;
  String size;
  String extensionType;
  String description;
  String url;

  Attachment({
    required this.order,
    required this.size,
    required this.extensionType,
    required this.description,
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

  Map<String, dynamic> toJson() {
    return {
      'order': order,
      'size': size,
      'extension_type': extensionType,
      'description': description,
      'url': url,
    };
  }
}