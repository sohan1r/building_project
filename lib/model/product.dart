class Product {
  int? id;
  String? name;
  String? img;
  String? updatedAt;
  String? createdAt;

  Product({this.id, this.name, this.img, this.updatedAt, this.createdAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
