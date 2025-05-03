class Surah {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<Ayah> ayahs;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  // Factory method to create a Surah from a Map (for example, parsing JSON)
  factory Surah.fromJson(Map<String, dynamic> json) {
    var ayahList = json['ayahs'] as List;
    List<Ayah> ayahs = ayahList.map((i) => Ayah.fromJson(i)).toList();

    return Surah(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      revelationType: json['revelationType'],
      ayahs: ayahs,
    );
  }

  // Method to convert Surah to a Map (for serialization)
  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'englishName': englishName,
      'englishNameTranslation': englishNameTranslation,
      'revelationType': revelationType,
      'ayahs': ayahs.map((ayah) => ayah.toJson()).toList(),
    };
  }
}

class Ayah {
  final int number;
  final String text;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final bool sajda;

  Ayah({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  // Factory method to create an Ayah from a Map (for example, parsing JSON)
  factory Ayah.fromJson(Map<String, dynamic> json) {
    // Ensure 'sajda' is correctly cast to a bool
    bool sajda = json['sajda'] is bool
        ? json['sajda'] as bool
        : json['sajda'] == 1 || json['sajda'] == 'true';

    return Ayah(
      number: json['number'],
      text: json['text'],
      numberInSurah: json['numberInSurah'],
      juz: json['juz'],
      manzil: json['manzil'],
      page: json['page'],
      ruku: json['ruku'],
      hizbQuarter: json['hizbQuarter'],
      sajda: sajda,
    );
  }

  // Method to convert Ayah to a Map (for serialization)
  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'text': text,
      'numberInSurah': numberInSurah,
      'juz': juz,
      'manzil': manzil,
      'page': page,
      'ruku': ruku,
      'hizbQuarter': hizbQuarter,
      'sajda': sajda,
    };
  }
}


