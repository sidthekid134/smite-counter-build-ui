import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smite_counter_build/data/smite.dart';
import 'package:smite_counter_build/models/counter_build_data.dart';
import 'package:smite_counter_build/models/gods_metadata.dart';
import 'package:smite_counter_build/models/items_metadata.dart';
import 'package:smite_counter_build/models/smite_constants.dart';
import 'package:smite_counter_build/presentation/widgets/god_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GodsMetadata? playerGod;
  GodsMetadata? opponentGod;
  SmiteRole? playerRole;

  List<GodsMetadata>? godsMetadata;
  List<ItemsMetadata>? itemsMetadata;

  void loadMetadata() async {
    print("Gathering metadata");
    late List<GodsMetadata> loadedGodData;
    late List<ItemsMetadata> loadedItemData;
    await Future.wait([
      (() async => loadedGodData = await getGodsMetadata())(),
      (() async => loadedItemData = await getItemsMetadata())(),
    ]);
    setState(() {
      godsMetadata = loadedGodData;
      itemsMetadata = loadedItemData;
      playerGod = loadedGodData.firstWhere((element) => element.id == 1966);
      opponentGod = loadedGodData.firstWhere((element) => element.id == 4039);
      playerRole = SmiteRole.solo;
    });
  }

  Widget _buildItemSlotWidget(
      Map<String, double> itemSlotInfo, int numMatchesEvaluated) {
    List<Widget> widgets = itemSlotInfo.keys.map((itemId) {
      ItemsMetadata itemInfo = itemsMetadata!
          .firstWhere((element) => element.itemId == int.parse(itemId));

      return Container(
        margin: const EdgeInsets.only(top: 10.0),
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

    return Expanded(
      flex: 2,
      child: Container(
        // height: 50,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: widgets,
        ),
      ),
    );
  }

  Future<Widget> _getCounterBuild(GodsMetadata playerGod,
      GodsMetadata opponentGod, SmiteRole playerRole) async {
    CounterBuildData? counterBuildData =
        await getCounterBuild(playerGod, opponentGod, playerRole);

    if (counterBuildData == null) {
      return Column(
        children: [const Text("No build found for this matchup, good luck.")],
      );
    }

    List<Widget> allCounterBuildWidgets =
        counterBuildData.counterBuild!.map((Map<String, double> itemSlotInfo) {
      return _buildItemSlotWidget(
          itemSlotInfo, counterBuildData.numMatchesEvaluated!);
    }).toList();
    return Column(
      children: [
        allCounterBuildWidgets.isNotEmpty
            ? Text(
                "Found ${counterBuildData.numMatchesEvaluated} total builds for this matchup.")
            : Container(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: allCounterBuildWidgets.isNotEmpty
              ? allCounterBuildWidgets
              : [const Text("No build found for this matchup, good luck.")],
        ),
        Container()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (godsMetadata == null || itemsMetadata == null) {
      loadMetadata();
    }

    GlobalKey<AutoCompleteTextFieldState<SmiteRole>> playerRolekey =
        GlobalKey<AutoCompleteTextFieldState<SmiteRole>>();

    GlobalKey<AutoCompleteTextFieldState<GodsMetadata>> playerGodFieldKey =
        GlobalKey<AutoCompleteTextFieldState<GodsMetadata>>();

    GlobalKey<AutoCompleteTextFieldState<GodsMetadata>> opponentGodFieldKey =
        GlobalKey<AutoCompleteTextFieldState<GodsMetadata>>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0.0,
        centerTitle: false,
        title: const Text(
          "SMITE Counter Builder",
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text("Select your god & Role"),
              Container(
                height: 100,
                child: GodSelectorField(
                  fieldKey: playerGodFieldKey,
                  godsMetadata: godsMetadata,
                  thisGodMetadata: playerGod,
                  onGodSelection: (item) => setState(() => playerGod = item),
                  playerRolekey: playerRolekey,
                  playerRole: playerRole,
                  onPlayerRoleSection: (item) =>
                      setState(() => playerRole = item),
                ),
              ),
              const SizedBox(height: 50),
              const Text("Select Opponent god"),
              Container(
                height: 100,
                child: GodSelectorField(
                  fieldKey: opponentGodFieldKey,
                  godsMetadata: godsMetadata,
                  thisGodMetadata: opponentGod,
                  onGodSelection: (item) => setState(() => opponentGod = item),
                ),
              ),
              const SizedBox(height: 100),
              const Text("Best Counter Build"),
              (playerGod != null && opponentGod != null && playerRole != null)
                  ? FutureBuilder<Widget>(
                      future: _getCounterBuild(
                          playerGod!, opponentGod!, playerRole!),
                      initialData: const Text("Loading counter build.."),
                      builder: (BuildContext context,
                          AsyncSnapshot<Widget> buildWidget) {
                        if (buildWidget.connectionState ==
                            ConnectionState.done) {
                          return buildWidget.data!;
                        }
                        return Container();
                      })
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
