class Diary {
  int? id;
  String? note;
  int? rate;
  String? date;
  String? drawing;

  Diary({
    this.id,
    this.note,
    this.rate,
    this.date,
    this.drawing
  });

  Map<String, dynamic> toJson() {
    print("제이슨 실행");
    return {
      'id': id,
      'note': note,
      'rate':rate,
      'date': date,
      'drawing' : drawing,
    };
  }

  Diary.fromJson(Map<String, dynamic> json) {
    print("프롬제이슨 실행");
    try{
    id = json['id'] as int;
    rate = json['rate'] as int;
    date = json['date'] as String;
    drawing = json['drawing'] as String;
    }catch(e){print("ㅇㅣㄱㅔㅁㅜㄴㅈㅔ");}

    try{
      note = json['note'] as String;
    }catch(e){ print("ㅇㅗㅐㅇㅏㄴㄷㅗㅣㅁ?????"); print(e);}
  }
}