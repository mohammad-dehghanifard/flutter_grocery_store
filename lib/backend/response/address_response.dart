import 'package:flutter_grocery_store/backend/models/address.dart';

class AddressResponse {
  List<Address>? data;

  AddressResponse({this.data});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Address>[];
      json['data'].forEach((v) {
        data!.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


