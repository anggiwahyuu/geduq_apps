class User {
  int? id;
  String username;
  String selectCharacter;
  int scorePreTest;
  int timesPreTest;
  String isPreTestDone;

  User({
    this.id,
    required this.username,
    required this.selectCharacter,
    required this.scorePreTest,
    required this.timesPreTest,
    required this.isPreTestDone,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    selectCharacter: json["select_character"],
    scorePreTest: json["score_pre_test"],
    timesPreTest: json["times_pre_test"],
    isPreTestDone: json["is_pre_test_done"],
  );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "username": username,
      "select_character": selectCharacter,
      "score_pre_test": scorePreTest,
      "times_pre_test": timesPreTest,
      "is_pre_test_done": isPreTestDone,
    };
  }
}