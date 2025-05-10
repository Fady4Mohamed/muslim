class AzkarNamesModel {
  int? id;
  String? name;
  AzkarNamesModel(this.id, this.name);

  AzkarNamesModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}
