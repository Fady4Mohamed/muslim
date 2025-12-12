class NotificationModel {
  int id;
  String title;
  String body;
  dynamic sound;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.sound,
  });
}
