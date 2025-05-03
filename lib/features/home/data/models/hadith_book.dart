
class Book {
  final String name;
  final String id;
  final int? available;  // Nullable int
  final int? requested;  // Nullable int
  final List<Hadith>? hadiths;

  // Constructor
  Book({
    required this.name,
    required this.id,
    this.available,  // Nullable parameter
    this.requested,  // Nullable parameter
    required this.hadiths,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      available: json['available'],  // Nullable
      requested: json['requested'],  // Nullable
      hadiths: (json['hadiths'] as List?)
          ?.map((i) => Hadith.fromJson(i))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'available': available,
      'requested': requested,
      'hadiths': hadiths?.map((hadith) => hadith.toJson()).toList(),
    };
  }
}
class Hadith {
  final int? number;  // Nullable int
  final String arab;
  final String id;

  Hadith({
    this.number,  // Nullable parameter
    required this.arab,
    required this.id,
  });

  // Factory method to create a Hadith from JSON
  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      number: json['number'],  // Nullable
      arab: json['arab'] ?? '',  // Handle null for arab
      id: json['id'] ?? '',      // Handle null for id
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'arab': arab,
      'id': id,
    };
  }
}
