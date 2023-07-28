class ServicesAllModel {
  int? id;
  String? name;
  String? description;
  String? clientType;
  String? serviceType;
  String? title;
  String? createdAt;
  int? day;
  int? week;
  int? month;
  int? branch;

  ServicesAllModel(
      {this.id,
      this.name,
      this.description,
      this.clientType,
      this.serviceType,
      this.title,
      this.createdAt,
      this.day,
      this.week,
      this.month,
      this.branch});

  ServicesAllModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    clientType = json['client_type'];
    serviceType = json['service_type'];
    title = json['title'];
    createdAt = json['created_at'];
    day = json['day'];
    week = json['week'];
    month = json['month'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['client_type'] = clientType;
    data['service_type'] = serviceType;
    data['title'] = title;
    data['created_at'] = createdAt;
    data['day'] = day;
    data['week'] = week;
    data['month'] = month;
    data['branch'] = branch;
    return data;
  }
}