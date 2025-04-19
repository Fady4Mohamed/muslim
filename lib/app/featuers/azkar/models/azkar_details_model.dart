class AzkarDetailsModel {
  int? sectionId;
  String? reference;
  String? content;

  AzkarDetailsModel(this.sectionId, this.content,
      this.reference);

  AzkarDetailsModel.fromJson(Map<String, dynamic> json) {
    sectionId = json["section_id"];
    reference = json["reference"];
    content = json["content"];
  }
}
