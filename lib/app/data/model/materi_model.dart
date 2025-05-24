class MateriResponse {
  List<SejarahKebudayaanIslam>? sejarahKebudayaanIslam;
  List<DoaDoaHarian>? doaDoaHarian;
  List<AdabAdab>? adabAdab;
  List<Hikmah>? hikmah;

  MateriResponse(
      {this.sejarahKebudayaanIslam,
      this.doaDoaHarian,
      this.adabAdab,
      this.hikmah});

  MateriResponse.fromJson(Map<String, dynamic> json) {
    if (json['sejarah_kebudayaan_islam'] != null) {
      sejarahKebudayaanIslam = <SejarahKebudayaanIslam>[];
      json['sejarah_kebudayaan_islam'].forEach((v) {
        sejarahKebudayaanIslam!.add(SejarahKebudayaanIslam.fromJson(v));
      });
    }
    if (json['doa_doa_harian'] != null) {
      doaDoaHarian = <DoaDoaHarian>[];
      json['doa_doa_harian'].forEach((v) {
        doaDoaHarian!.add(DoaDoaHarian.fromJson(v));
      });
    }
    if (json['adab_adab'] != null) {
      adabAdab = <AdabAdab>[];
      json['adab_adab'].forEach((v) {
        adabAdab!.add(AdabAdab.fromJson(v));
      });
    }
    if (json['hikmah'] != null) {
      hikmah = <Hikmah>[];
      json['hikmah'].forEach((v) {
        hikmah!.add(Hikmah.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sejarahKebudayaanIslam != null) {
      data['sejarah_kebudayaan_islam'] =
          sejarahKebudayaanIslam!.map((v) => v.toJson()).toList();
    }
    if (doaDoaHarian != null) {
      data['doa_doa_harian'] = doaDoaHarian!.map((v) => v.toJson()).toList();
    }
    if (adabAdab != null) {
      data['adab_adab'] = adabAdab!.map((v) => v.toJson()).toList();
    }
    if (hikmah != null) {
      data['hikmah'] = hikmah!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SejarahKebudayaanIslam {
  int? id;
  String? title;
  String? information;

  SejarahKebudayaanIslam({this.id, this.title, this.information});

  SejarahKebudayaanIslam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    information = json['information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['information'] = information;
    return data;
  }
}

class DoaDoaHarian {
  int? id;
  String? title;
  String? doaArabic;
  String? doaLatin;
  String? meaning;

  DoaDoaHarian(
      {this.id, this.title, this.doaArabic, this.doaLatin, this.meaning});

  DoaDoaHarian.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    doaArabic = json['doa_arabic'];
    doaLatin = json['doa_latin'];
    meaning = json['meaning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['doa_arabic'] = doaArabic;
    data['doa_latin'] = doaLatin;
    data['meaning'] = meaning;
    return data;
  }
}

class AdabAdab {
  int? id;
  String? title;
  List<String>? content;

  AdabAdab({this.id, this.title, this.content});

  AdabAdab.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    return data;
  }
}

class Hikmah {
  int? id;
  String? title;
  List<String>? content;

  Hikmah({this.id, this.title, this.content});

  Hikmah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    return data;
  }
}
