import 'dart:collection';

import 'package:flutter/services.dart' show rootBundle;
import 'package:smite_counter_build/models/counter_build_data.dart';
import 'package:smite_counter_build/models/gods_metadata.dart';
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:smite_counter_build/models/items_metadata.dart';
import 'package:smite_counter_build/models/smite_constants.dart';

Future<List<GodsMetadata>> getGodsMetadata() async {
  String godsMetadataRaw =
      await rootBundle.loadString('assets/godsMetadata.json');
  List jsonFormatGodsMetadata = jsonDecode(godsMetadataRaw);
  List<GodsMetadata> godsMetadata = jsonFormatGodsMetadata
      .map((godMetaDataJson) => GodsMetadata.fromJson(godMetaDataJson))
      .toList();
  return godsMetadata;
}

Future<List<ItemsMetadata>> getItemsMetadata() async {
  String itemsMetadataRaw =
      await rootBundle.loadString('assets/itemsMetadata.json');
  List jsonFormatItemsMetadata = jsonDecode(itemsMetadataRaw);
  List<ItemsMetadata> itemsMetadata = jsonFormatItemsMetadata
      .map((itemMetaDataJson) => ItemsMetadata.fromJson(itemMetaDataJson))
      .toList();
  return itemsMetadata;
}

Future<CounterBuildData?> getCounterBuild(GodsMetadata playerGod,
    GodsMetadata opponentGod, SmiteRole playerRole) async {
  String counterBuildDataRaw =
      await rootBundle.loadString('assets/resultData.json');
  Map counterBuildDataJson = jsonDecode(counterBuildDataRaw);

  List<dynamic> counterItemsForThisGodJson;

  try {
    counterItemsForThisGodJson = counterBuildDataJson[playerRole.value]
            ?[playerGod.id.toString()]?['Opponent']?[opponentGod.id.toString()]
        ?['CounterBuilds']?['Items'];
  } catch (e) {
    return null;
  }

  CounterBuildData counterBuildData = CounterBuildData(
      counterBuild: [],
      numMatchesEvaluated: counterBuildDataJson[playerRole.value]
              ?[playerGod.id.toString()]?['Opponent']
          ?[opponentGod.id.toString()]['NumMatchesEvaluated']);
  List<Map<String, int>> counterItemsForThisGodList = [];
  counterItemsForThisGodJson.forEach((itemSlotInfo) {
    Map<String, int> itemSlotConverted = {};
    for (var item in itemSlotInfo.keys) {
      itemSlotConverted[item] = itemSlotInfo[item];
    }

    counterItemsForThisGodList.add(itemSlotConverted);
  });

  List<Map<String, double>> percentageFromat =
      counterItemsForThisGodList.map((itemSlotInfo) {
    int totalValue = 0;
    itemSlotInfo.values.forEach((int e) {
      totalValue += e;
    });
    Map<String, double> itemSlotConverted = {};
    for (var item in itemSlotInfo.keys) {
      itemSlotConverted[item] =
          ((itemSlotInfo[item]! / totalValue) * 100).roundToDouble();
    }
    Map<String, double> sortMapByValue = Map.fromEntries(
        itemSlotConverted.entries.toList()
          ..sort((e1, e2) => e2.value.compareTo(e1.value)));

    return sortMapByValue;
  }).toList();

  counterBuildData.counterBuild = percentageFromat;

  return counterBuildData;
}
