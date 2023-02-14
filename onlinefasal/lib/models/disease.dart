// ignore_for_file: file_names, non_constant_identifier_names

class Disease {
  // final String category;
  // final String season;
  // final String botanicalName;
  // final String genus;
  // final String family;
  // final String origin;
  // final String synonym;
  // final String rotations;
  // final String cropimage;
  // final String averageYield;
  // final Float32List yieldMin;
  // final Float32List yieldMax;
  final int crop;
  final String state;
  final String name;
  final String type;
  final String symptoms;
  final String measures;
  final String common_name;
  final String disease_image;

  Disease(
      {required this.crop,
      required this.state,
      required this.name,
      required this.type,
      required this.symptoms,
      required this.measures,
      required this.common_name,
      required this.disease_image});

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
        crop: (json['crop'] != null) ? json['crop'] : -1,
        state: (json['state'] != null) ? json['state'] : "Not available",
        name: (json['name'] != null) ? json['name'] : "Not available",
        type: (json['type'] != null) ? json['type'] : "Not available",
        symptoms:
            (json['symptoms'] != null) ? json['symptoms'] : "Not available",
        measures:
            (json['measures'] != null) ? json['measures'] : "Not available",
        common_name: (json['common_name'] != null)
            ? json['common_name']
            : "Not available",
        disease_image: (json['disease_image'] != null)
            ? json['disease_image']
            : "Not available");
  }
}
