class SambungAyatResponse {
  List<SambungAyat>? sambungAyat;

  SambungAyatResponse({this.sambungAyat});

  SambungAyatResponse.fromJson(Map<String, dynamic> json) {
    if (json['sambung_ayat'] != null) {
      sambungAyat = <SambungAyat>[];
      json['sambung_ayat'].forEach((v) {
        sambungAyat!.add(SambungAyat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sambungAyat != null) {
      data['sambung_ayat'] = sambungAyat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SambungAyat {
  int? id;
  String? surah;
  String? question;
  String? sound;
  List<String>? options;
  String? correctAnswer;

  SambungAyat(
      {this.id,
      this.surah,
      this.question,
      this.sound,
      this.options,
      this.correctAnswer});

  SambungAyat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surah = json['surah'];
    question = json['question'];
    sound = json['sound'];
    options = json['options'].cast<String>();
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['surah'] = surah;
    data['question'] = question;
    data['sound'] = sound;
    data['options'] = options;
    data['correct_answer'] = correctAnswer;
    return data;
  }
}
