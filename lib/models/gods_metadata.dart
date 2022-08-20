class GodsMetadata {
  late String name;
  late String roles;
  late String godCardURL;
  late String godIconURL;
  late int id;

  GodsMetadata(
      {required this.name,
      required this.roles,
      required this.godCardURL,
      required this.godIconURL,
      required this.id});

  GodsMetadata.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    roles = json['Roles'];
    godCardURL = json['godCard_URL'];
    godIconURL = json['godIcon_URL'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Roles'] = roles;
    data['godCard_URL'] = godCardURL;
    data['godIcon_URL'] = godIconURL;
    data['id'] = id;
    return data;
  }
}
