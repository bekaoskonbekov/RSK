
class BrancheModel {
  int? id;
  String? name;
  String? address;
  String? contactNumber;
  String? email;
  String? description;

  BrancheModel(
      {this.id,
      this.name,
      this.address,
      this.contactNumber,
      this.email,
      this.description});

  BrancheModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    contactNumber = json['contact_number'];
    email = json['email'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['contact_number'] = contactNumber;
    data['email'] = email;
    data['description'] = description;
    return data;
  }
}