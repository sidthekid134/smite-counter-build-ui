import 'dart:collection';

import 'package:flutter/services.dart' show rootBundle;
import 'package:smite_counter_build/models/counter_build_data.dart';
import 'package:smite_counter_build/models/gods_metadata.dart';
import 'dart:convert';
import 'package:smite_counter_build/models/items_metadata.dart';
import 'package:smite_counter_build/models/smite_constants.dart';

Future<List<GodsMetadata>> getGodsMetadata() async {
  // print("here - 1");
  String godsMetadataRaw =
      await rootBundle.loadString('assets/godsMetadatav2.json');
  List jsonFormatGodsMetadata = jsonDecode(godsMetadataRaw);
  List<GodsMetadata> godsMetadata = jsonFormatGodsMetadata
      .map((godMetaDataJson) => GodsMetadata.fromJson(godMetaDataJson))
      .toList();
  // print("here - 2");
  return godsMetadata;
}

Future<List<ItemsMetadata>> getItemsMetadata() async {
  // print("here - 3");
  String itemsMetadataRaw =
      await rootBundle.loadString('assets/itemsMetadatav2.json');
  List jsonFormatItemsMetadata = jsonDecode(itemsMetadataRaw);
  List<ItemsMetadata> itemsMetadata = jsonFormatItemsMetadata
      .map((itemMetaDataJson) => ItemsMetadata.fromJson(itemMetaDataJson))
      .toList();
  // print("here - 4");
  return itemsMetadata;
}

Future<CounterBuildData?> getCounterBuild(GodsMetadata playerGod,
    GodsMetadata opponentGod, SmiteRole playerRole) async {
  // print("here - 5");
  String counterBuildDataRaw =
      await rootBundle.loadString('assets/resultData.json');
  Map counterBuildDataJson = jsonDecode(counterBuildDataRaw);

  List<dynamic> counterItemsForThisGodJson;

  // print("here - 6");

  try {
    counterItemsForThisGodJson = counterBuildDataJson[playerRole.value]
            ?[playerGod.id.toString()]?['Opponent']?[opponentGod.id.toString()]
        ?['CounterBuilds']?['Items'];
    // print("here - 7");
  } catch (e) {
    return null;
  }
  // print("debug - 1");
  // print(counterItemsForThisGodJson);
  if (counterItemsForThisGodJson == null ||
      counterItemsForThisGodJson.isEmpty) {
    return null;
  }
  CounterBuildData counterBuildData = CounterBuildData(
      counterBuild: [],
      numMatchesEvaluated: counterBuildDataJson[playerRole.value]
              ?[playerGod.id.toString()]?['Opponent']
          ?[opponentGod.id.toString()]['NumMatchesEvaluated']);
  print("here - 1");
  print(counterBuildData.numMatchesEvaluated);

  List<Map<String, int>> counterItemsForThisGodList = [];
  counterItemsForThisGodJson.forEach((itemSlotInfo) {
    Map<String, int> itemSlotConverted = {};
    for (var item in itemSlotInfo.keys) {
      itemSlotConverted[item] = itemSlotInfo[item];
    }

    counterItemsForThisGodList.add(itemSlotConverted);
  });
  // print("here - 2");
  // print(counterItemsForThisGodList);

  List<Map<String, double>> percentageFromat =
      counterItemsForThisGodList.map((itemSlotInfo) {
    // print("here - 3");
    int totalValue = 0;
    itemSlotInfo.values.forEach((int e) {
      totalValue += e;
    });
    // print("here - 4");
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
