class NamaSurahResponse {
  List<NamaSuratDariAyat>? namaSuratDariAyat;

  NamaSurahResponse({this.namaSuratDariAyat});

  NamaSurahResponse.fromJson(Map<String, dynamic> json) {
    if (json['nama_surat_dari_ayat'] != null) {
      namaSuratDariAyat = <NamaSuratDariAyat>[];
      json['nama_surat_dari_ayat'].forEach((v) {
        namaSuratDariAyat!.add(NamaSuratDariAyat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (namaSuratDariAyat != null) {
      data['nama_surat_dari_ayat'] =
          namaSuratDariAyat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NamaSuratDariAyat {
  int? id;
  String? question;
  String? sound;
  List<String>? options;
  String? correctAnswer;

  NamaSuratDariAyat(
      {this.id, this.question, this.sound, this.options, this.correctAnswer});

  NamaSuratDariAyat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    sound = json['sound'];
    options = json['options'].cast<String>();
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['sound'] = sound;
    data['options'] = options;
    data['correct_answer'] = correctAnswer;
    return data;
  }
}
