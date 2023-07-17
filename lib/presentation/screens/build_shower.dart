import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smite_counter_build/models/counter_build_data.dart';
import 'package:smite_counter_build/models/items_metadata.dart';

class BuildShower extends StatelessWidget {
  final CounterBuildData counterBuildData;
  final List<ItemsMetadata> itemsMetadata;

  const BuildShower(
      {super.key, required this.counterBuildData, required this.itemsMetadata});

  Widget _buildItemSlotWidget(Map<String, double> itemSlotInfo) {
    List<Widget> widgets = itemSlotInfo.keys.map((itemId) {
      ItemsMetadata itemInfo = itemsMetadata
          .firstWhere((element) => element.itemId == int.parse(itemId));
      return Container(
        padding: const EdgeInsets.only(bottom: 20.0),
        height: 80,
        child: Row(
          children: [
            Tooltip(
              message: itemInfo.deviceName,
              child: CachedNetworkImage(imageUrl: itemInfo.itemIconURL),
            ),
            const SizedBox(width: 20),
            Text("${itemSlotInfo[itemId]}%")
          ],
        ),
      );
    }).toList();
    return Padding(
      padding:
          const EdgeInsets.only(top: 30.0, left: 30, right: 30, bottom: 10),
      child: Column(children: widgets),
    );
  }

  Widget _buildEntireItemCardWidget(
      BuildContext context, List<Map<String, double>> allItemSlotInfo) {
    List<Widget> widgets = allItemSlotInfo.asMap().entries.map((entry) {
      int idx = entry.key;
      Map<String, double> itemSlotinfo = entry.value;
      return Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Text(
              idx == 0 ? "Starter Item" : "Item ${idx}",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17.0),
              ),
              color: const Color.fromRGBO(232, 232, 232, 1),
              child: _buildItemSlotWidget(itemSlotinfo),
            ),
          ],
        ),
      );
    }).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Expanded(
              child: Text(
                "Optimal Builds",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber,
                ),
                padding: const EdgeInsets.all(15),
                child: Text(
                  "${counterBuildData.numMatchesEvaluated} Builds Matched",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    // fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
        const SizedBox(height: 30),
        counterBuildData.counterBuild!.isEmpty
            ? const Text("No build found for this matchup, good luck.")
            : _buildEntireItemCardWidget(
                context, counterBuildData.counterBuild!),
      ],
    );
  }
}
