class Address {
  int? id;
  String? title;
  String? address;
  int? postalCode;
  String? latlong;
  String? city;
  String? province;
  int? cityId;
  int? provinceId;

  Address(
      {this.id,
        this.title,
        this.address,
        this.postalCode,
        this.latlong,
        this.city,
        this.province,
        this.cityId,
        this.provinceId});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    postalCode = json['postal_code'];
    latlong = json['latlong'];
    city = json['city'];
    province = json['province'];
    cityId = json['city_id'];
    provinceId = json['province_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['address'] = address;
    data['postal_code'] = postalCode;
    data['latlong'] = latlong;
    data['city'] = city;
    data['province'] = province;
    data['city_id'] = cityId;
    data['province_id'] = provinceId;
    return data;
  }
}