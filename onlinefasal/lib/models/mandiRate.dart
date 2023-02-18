// ignore: file_names
class MandiRate {
  final String result;
  final String errorr;


  MandiRate({required this.result,required this.errorr});

  factory MandiRate.fromJson(Map<String, dynamic> json) {
    return MandiRate(
        result: (json['result'] != null)
            ? json['result']
            : "error in fetching mandi rates",
        errorr: (json['error'] != null)
            ? json['error']
            : "error in fetching mandi rates");
  }
}
