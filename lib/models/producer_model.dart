class Producer {
  final String? name;
  final String? logo;
  final String? description;
  final String? distance;
  final List? packages;

  Producer(
      {this.name, this.description, this.logo, this.distance, this.packages});

  factory Producer.fromJson(Map<String, dynamic> parsedJson) {
    return Producer(
      name: parsedJson['name'],
      logo: parsedJson['logo'],
      description: parsedJson['description'],
      distance: parsedJson['distance'],
      packages: parsedJson['packages'],
    );
  }
}
