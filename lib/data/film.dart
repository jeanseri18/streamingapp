class DataModel {
  int id;
  String name;
  String image;
  String type;
  int rating;

  DataModel({this.id, this.name, this.image, this.type, this.rating});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json[0];
    name = json[1];
    image = json[2];
    type = json[3];
    rating = json[4];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titre'] = this.name;
    data['file'] = this.image;
    data['id'] = this.type;
    data['id'] = this.rating;
    return data;
  }
}
