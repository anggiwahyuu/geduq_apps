class SurahResponse {
  List<Surah>? surah;

  SurahResponse({this.surah});

  SurahResponse.fromJson(Map<String, dynamic> json) {
    if (json['surah'] != null) {
      surah = <Surah>[];
      json['surah'].forEach((v) {
        surah!.add(Surah.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (surah != null) {
      data['surah'] = surah!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Surah {
  int? id;
  String? surah;
  List<String>? ayatArabic;
  List<String>? sound;
  List<String>? ayatLatin;
  List<String>? arti;

  Surah(
      {this.id,
      this.surah,
      this.ayatArabic,
      this.sound,
      this.ayatLatin,
      this.arti});

  Surah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surah = json['surah'];
    ayatArabic = json['ayat_arabic'].cast<String>();
    sound = json['sound'].cast<String>();
    ayatLatin = json['ayat_latin'].cast<String>();
    arti = json['arti'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['surah'] = surah;
    data['ayat_arabic'] = ayatArabic;
    data['sound'] = sound;
    data['ayat_latin'] = ayatLatin;
    data['arti'] = arti;
    return data;
  }
}
