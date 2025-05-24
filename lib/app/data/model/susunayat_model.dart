class SusunAyatResponse {
  List<SusunAyat>? susunAyat;

  SusunAyatResponse({this.susunAyat});

  SusunAyatResponse.fromJson(Map<String, dynamic> json) {
    if (json['susun_ayat'] != null) {
      susunAyat = <SusunAyat>[];
      json['susun_ayat'].forEach((v) {
        susunAyat!.add(SusunAyat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (susunAyat != null) {
      data['susun_ayat'] = susunAyat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SusunAyat {
  int? id;
  String? surah;
  String? sound;
  List<String>? options;
  List<String>? correctAnswer;

  SusunAyat(
      {this.id, this.surah, this.sound, this.options, this.correctAnswer});

  SusunAyat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surah = json['surah'];
    sound = json['sound'];
    options = json['options'].cast<String>();
    correctAnswer = json['correct_answer'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['surah'] = surah;
    data['sound'] = sound;
    data['options'] = options;
    data['correct_answer'] = correctAnswer;
    return data;
  }
}
