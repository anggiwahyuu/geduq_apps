class ArtiDariAyatResponse {
  List<ArtiDariAyat>? artiDariAyat;

  ArtiDariAyatResponse({this.artiDariAyat});

  ArtiDariAyatResponse.fromJson(Map<String, dynamic> json) {
    if (json['arti_dari_ayat'] != null) {
      artiDariAyat = <ArtiDariAyat>[];
      json['arti_dari_ayat'].forEach((v) {
        artiDariAyat!.add(ArtiDariAyat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (artiDariAyat != null) {
      data['arti_dari_ayat'] = artiDariAyat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArtiDariAyat {
  int? id;
  String? naration;
  String? question;
  String? sound;
  List<String>? options;
  String? correctAnswer;

  ArtiDariAyat(
      {this.id,
      this.naration,
      this.question,
      this.sound,
      this.options,
      this.correctAnswer});

  ArtiDariAyat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    naration = json['naration'];
    question = json['question'];
    sound = json['sound'];
    options = json['options'].cast<String>();
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['naration'] = naration;
    data['question'] = question;
    data['sound'] = sound;
    data['options'] = options;
    data['correct_answer'] = correctAnswer;
    return data;
  }
}
