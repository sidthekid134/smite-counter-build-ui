class ItemsMetadata {
  late String activeFlag;
  late int rootItemId;
  late String deviceName;
  late int itemId;
  late String itemIconURL;

  ItemsMetadata(
      {required this.activeFlag,
      required this.rootItemId,
      required this.deviceName,
      required this.itemId,
      required this.itemIconURL});

  ItemsMetadata.fromJson(Map<String, dynamic> json) {
    activeFlag = json['ActiveFlag'];
    rootItemId = json['RootItemId'];
    deviceName = json['DeviceName'];
    itemId = json['ItemId'];
    itemIconURL = json['itemIcon_URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ActiveFlag'] = activeFlag;
    data['RootItemId'] = rootItemId;
    data['DeviceName'] = deviceName;
    data['ItemId'] = itemId;
    data['itemIcon_URL'] = itemIconURL;
    return data;
  }
}
