// ignore_for_file: non_constant_identifier_names

class Pest {
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
  final String symptoms;
  final String measures;
  final String pest_image;

  Pest(
      {required this.crop,
      required this.state,
      required this.name,
      required this.symptoms,
      required this.measures,
      required this.pest_image});

  factory Pest.fromJson(Map<String, dynamic> json) {
    return Pest(
        crop: (json['crop'] != null) ? json['crop'] : -1,
        state: (json['state'] != null) ? json['state'] : "Not available",
        name: (json['name'] != null) ? json['name'] : "Not available",
        symptoms:
            (json['symptoms'] != null) ? json['symptoms'] : "Not available",
        measures:
            (json['measures'] != null) ? json['measures'] : "Not available",
        pest_image: (json['pest_image'] != null)
            ? json['pest_image']
            : "Not available");
  }
}
