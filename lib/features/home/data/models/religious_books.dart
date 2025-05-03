import 'dart:convert';
/// id : 2838764
/// source_id : 2838764
/// title : "التسبيح في الكتاب والسنة"
/// type : "books"
/// add_date : 1713961229
/// update_date : 1713972094
/// description : "كتاب ماتع يتحدث عن التسبيح في الكتاب والسنة والرد على المفاهيم الخاطئة فيه."
/// full_description : null
/// source_language : "ar"
/// translated_language : "ar"
/// importance_level : "normal"
/// image : null
/// api_url : "https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/get-item/2838764/ar/json"
/// prepared_by : [{"id":801760,"source_id":801760,"title":"محمد إسحاق كندو","type":"author","kind":"author","description":"خريج قسم العقيدة بالجامعة الإسلامية بالمدينة النبوية، رئيس مجلس علماء أهل السنة في بوركينا فاسو، وأبرز الدعاة في الوقت الحاضر في بوركينا فاسو.","api_url":"https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/get-author/801760/ar/json"}]
/// attachments : [{"order":0,"size":"18.94 MB","extension_type":"PDF","description":"التسبيح من الكتاب والسنة","url":"https://d1.islamhouse.com/data/ar/ih_books/single_010/ar-altasbih-min-alkitab-walsuna.pdf"}]
/// locales : []

ReligiousBooks religiousBooksFromJson(String str) => ReligiousBooks.fromJson(json.decode(str));
String religiousBooksToJson(ReligiousBooks data) => json.encode(data.toJson());
class ReligiousBooks {
  ReligiousBooks({
      num? id, 
      num? sourceId, 
      String? title, 
      String? type, 
      num? addDate, 
      num? updateDate, 
      String? description, 
      dynamic fullDescription, 
      String? sourceLanguage, 
      String? translatedLanguage, 
      String? importanceLevel, 
      dynamic image, 
      String? apiUrl, 
      List<PreparedBy>? preparedBy, 
      List<Attachments>? attachments, 
      List<dynamic>? locales,}){
    _id = id;
    _sourceId = sourceId;
    _title = title;
    _type = type;
    _addDate = addDate;
    _updateDate = updateDate;
    _description = description;
    _fullDescription = fullDescription;
    _sourceLanguage = sourceLanguage;
    _translatedLanguage = translatedLanguage;
    _importanceLevel = importanceLevel;
    _image = image;
    _apiUrl = apiUrl;
    _preparedBy = preparedBy;
    _attachments = attachments;
    _locales = locales;
}

  ReligiousBooks.fromJson(dynamic json) {
    _id = json['id'];
    _sourceId = json['source_id'];
    _title = json['title'];
    _type = json['type'];
    _addDate = json['add_date'];
    _updateDate = json['update_date'];
    _description = json['description'];
    _fullDescription = json['full_description'];
    _sourceLanguage = json['source_language'];
    _translatedLanguage = json['translated_language'];
    _importanceLevel = json['importance_level'];
    _image = json['image'];
    _apiUrl = json['api_url'];
    if (json['prepared_by'] != null) {
      _preparedBy = [];
      json['prepared_by'].forEach((v) {
        _preparedBy?.add(PreparedBy.fromJson(v));
      });
    }
    if (json['attachments'] != null) {
      _attachments = [];
      json['attachments'].forEach((v) {
        _attachments?.add(Attachments.fromJson(v));
      });
    }
    // if (json['locales'] != null) {
    //   _locales = [];
    //   json['locales'].forEach((v) {
    //     _locales?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  num? _id;
  num? _sourceId;
  String? _title;
  String? _type;
  num? _addDate;
  num? _updateDate;
  String? _description;
  dynamic _fullDescription;
  String? _sourceLanguage;
  String? _translatedLanguage;
  String? _importanceLevel;
  dynamic _image;
  String? _apiUrl;
  List<PreparedBy>? _preparedBy;
  List<Attachments>? _attachments;
  List<dynamic>? _locales;
ReligiousBooks copyWith({  num? id,
  num? sourceId,
  String? title,
  String? type,
  num? addDate,
  num? updateDate,
  String? description,
  dynamic fullDescription,
  String? sourceLanguage,
  String? translatedLanguage,
  String? importanceLevel,
  dynamic image,
  String? apiUrl,
  List<PreparedBy>? preparedBy,
  List<Attachments>? attachments,
  List<dynamic>? locales,
}) => ReligiousBooks(  id: id ?? _id,
  sourceId: sourceId ?? _sourceId,
  title: title ?? _title,
  type: type ?? _type,
  addDate: addDate ?? _addDate,
  updateDate: updateDate ?? _updateDate,
  description: description ?? _description,
  fullDescription: fullDescription ?? _fullDescription,
  sourceLanguage: sourceLanguage ?? _sourceLanguage,
  translatedLanguage: translatedLanguage ?? _translatedLanguage,
  importanceLevel: importanceLevel ?? _importanceLevel,
  image: image ?? _image,
  apiUrl: apiUrl ?? _apiUrl,
  preparedBy: preparedBy ?? _preparedBy,
  attachments: attachments ?? _attachments,
  locales: locales ?? _locales,
);
  num? get id => _id;
  num? get sourceId => _sourceId;
  String? get title => _title;
  String? get type => _type;
  num? get addDate => _addDate;
  num? get updateDate => _updateDate;
  String? get description => _description;
  dynamic get fullDescription => _fullDescription;
  String? get sourceLanguage => _sourceLanguage;
  String? get translatedLanguage => _translatedLanguage;
  String? get importanceLevel => _importanceLevel;
  dynamic get image => _image;
  String? get apiUrl => _apiUrl;
  List<PreparedBy>? get preparedBy => _preparedBy;
  List<Attachments>? get attachments => _attachments;
  List<dynamic>? get locales => _locales;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['source_id'] = _sourceId;
    map['title'] = _title;
    map['type'] = _type;
    map['add_date'] = _addDate;
    map['update_date'] = _updateDate;
    map['description'] = _description;
    map['full_description'] = _fullDescription;
    map['source_language'] = _sourceLanguage;
    map['translated_language'] = _translatedLanguage;
    map['importance_level'] = _importanceLevel;
    map['image'] = _image;
    map['api_url'] = _apiUrl;
    if (_preparedBy != null) {
      map['prepared_by'] = _preparedBy?.map((v) => v.toJson()).toList();
    }
    if (_attachments != null) {
      map['attachments'] = _attachments?.map((v) => v.toJson()).toList();
    }
    if (_locales != null) {
      map['locales'] = _locales?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// order : 0
/// size : "18.94 MB"
/// extension_type : "PDF"
/// description : "التسبيح من الكتاب والسنة"
/// url : "https://d1.islamhouse.com/data/ar/ih_books/single_010/ar-altasbih-min-alkitab-walsuna.pdf"

Attachments attachmentsFromJson(String str) => Attachments.fromJson(json.decode(str));
String attachmentsToJson(Attachments data) => json.encode(data.toJson());
class Attachments {
  Attachments({
      num? order, 
      String? size, 
      String? extensionType, 
      String? description, 
      String? url,}){
    _order = order;
    _size = size;
    _extensionType = extensionType;
    _description = description;
    _url = url;
}

  Attachments.fromJson(dynamic json) {
    _order = json['order'];
    _size = json['size'];
    _extensionType = json['extension_type'];
    _description = json['description'];
    _url = json['url'];
  }
  num? _order;
  String? _size;
  String? _extensionType;
  String? _description;
  String? _url;
Attachments copyWith({  num? order,
  String? size,
  String? extensionType,
  String? description,
  String? url,
}) => Attachments(  order: order ?? _order,
  size: size ?? _size,
  extensionType: extensionType ?? _extensionType,
  description: description ?? _description,
  url: url ?? _url,
);
  num? get order => _order;
  String? get size => _size;
  String? get extensionType => _extensionType;
  String? get description => _description;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order'] = _order;
    map['size'] = _size;
    map['extension_type'] = _extensionType;
    map['description'] = _description;
    map['url'] = _url;
    return map;
  }

}

/// id : 801760
/// source_id : 801760
/// title : "محمد إسحاق كندو"
/// type : "author"
/// kind : "author"
/// description : "خريج قسم العقيدة بالجامعة الإسلامية بالمدينة النبوية، رئيس مجلس علماء أهل السنة في بوركينا فاسو، وأبرز الدعاة في الوقت الحاضر في بوركينا فاسو."
/// api_url : "https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/get-author/801760/ar/json"

PreparedBy preparedByFromJson(String str) => PreparedBy.fromJson(json.decode(str));
String preparedByToJson(PreparedBy data) => json.encode(data.toJson());
class PreparedBy {
  PreparedBy({
      num? id, 
      num? sourceId, 
      String? title, 
      String? type, 
      String? kind, 
      String? description, 
      String? apiUrl,}){
    _id = id;
    _sourceId = sourceId;
    _title = title;
    _type = type;
    _kind = kind;
    _description = description;
    _apiUrl = apiUrl;
}

  PreparedBy.fromJson(dynamic json) {
    _id = json['id'];
    _sourceId = json['source_id'];
    _title = json['title'];
    _type = json['type'];
    _kind = json['kind'];
    _description = json['description'];
    _apiUrl = json['api_url'];
  }
  num? _id;
  num? _sourceId;
  String? _title;
  String? _type;
  String? _kind;
  String? _description;
  String? _apiUrl;
PreparedBy copyWith({  num? id,
  num? sourceId,
  String? title,
  String? type,
  String? kind,
  String? description,
  String? apiUrl,
}) => PreparedBy(  id: id ?? _id,
  sourceId: sourceId ?? _sourceId,
  title: title ?? _title,
  type: type ?? _type,
  kind: kind ?? _kind,
  description: description ?? _description,
  apiUrl: apiUrl ?? _apiUrl,
);
  num? get id => _id;
  num? get sourceId => _sourceId;
  String? get title => _title;
  String? get type => _type;
  String? get kind => _kind;
  String? get description => _description;
  String? get apiUrl => _apiUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['source_id'] = _sourceId;
    map['title'] = _title;
    map['type'] = _type;
    map['kind'] = _kind;
    map['description'] = _description;
    map['api_url'] = _apiUrl;
    return map;
  }

}