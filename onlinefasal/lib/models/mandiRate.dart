// ignore: file_names
class MandiRate {
  final String result;

  MandiRate({required this.result});

  factory MandiRate.fromJson(Map<String, dynamic> json) {
    return MandiRate(
        result: (json['result'] != null)
            ? json['result']
            : "error in fetching mandi rates");
  }
}
