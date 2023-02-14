// ignore: file_names
// ignore_for_file: non_constant_identifier_names

class DBResponse {
  final double Similar_score;
  final String Message;
  final String Question;
  final String Question_Database;
  final String Answer;
  final String Reference;

  DBResponse(
      {required this.Similar_score,
      required this.Message,
      required this.Question,
      required this.Question_Database,
      required this.Answer,
      required this.Reference});

  factory DBResponse.fromJson(Map<String, dynamic> json) {
    return DBResponse(
        Similar_score:
            (json['Sililar_score'] != null) ? json['Sililar_score'] : 0.0,
        Message: (json['Message'] != null) ? json['Message'] : "not available",
        Question:
            (json['Question'] != null) ? json['Question'] : "not available",
        Question_Database: (json['Question_Database'] != null)
            ? json['Question_Database']
            : "not available",
        Answer: (json['Answer'] != null) ? json['Answer'] : "not available",
        Reference:
            (json['Reference'] != null) ? json['Reference'] : "not available");
  }
}
