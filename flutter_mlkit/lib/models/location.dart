class Location {
  final String ip;
  final String city;
  final String region;
  final String country;

  Location({this.ip, this.city, this.region, this.country});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      ip: json['ip'],
      city: json['city'],
      region: json['region'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toMap() {
    final data = <String, dynamic>{};

    data['ip'] = this.ip;
    data['city'] = this.city;
    data['region'] = this.region;
    data['country'] = this.country;

    return data;
  }
}
