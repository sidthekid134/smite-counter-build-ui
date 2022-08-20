import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smite_counter_build/business_logic/smite_bloc/smite_cubit.dart';
import 'package:smite_counter_build/data/smite.dart';
import 'package:smite_counter_build/models/gods_metadata.dart';
import 'package:smite_counter_build/models/items_metadata.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
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
      // playerGod = loadedGodData.firstWhere((element) => element.id == 1966);
      // opponentGod = loadedGodData.firstWhere((element) => element.id == 4039);
    });
  }

  Widget _buildItemSlotWidget(Map<String, double> itemSlotInfo) {
    List<Widget> widgets = itemSlotInfo.keys.map((itemId) {
      ItemsMetadata itemInfo = itemsMetadata!
          .firstWhere((element) => element.itemId == int.parse(itemId));

      return Container(
        margin: const EdgeInsets.only(top: 10.0),
        height: 80,
        child: Row(
          children: [
            CachedNetworkImage(imageUrl: itemInfo.itemIconURL),
            const SizedBox(width: 20),
            Text("${itemSlotInfo[itemId]}%")
          ],
        ),
      );
    }).toList();

    return Expanded(
      flex: 2,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: widgets,
        ),
      ),
    );
  }

  Future<Widget> _getCounterBuild(GodsMetadata playerGod,
      GodsMetadata opponentGod, SmiteRole playerRole) async {
    List<Map<String, double>> counterBuildForThisGodJson =
        await getCounterBuild(playerGod, opponentGod, playerRole);
    List<Widget> allCounterBuildWidgets =
        counterBuildForThisGodJson.map((Map<String, double> itemSlotInfo) {
      return _buildItemSlotWidget(itemSlotInfo);
    }).toList();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: allCounterBuildWidgets.isNotEmpty
          ? allCounterBuildWidgets
          : [const Text("No build found for this matchup, good luck.")],
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
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text("Select your god & Role"),
            GodSelectorField(
              fieldKey: playerGodFieldKey,
              godsMetadata: godsMetadata,
              thisGodMetadata: playerGod,
              onGodSelection: (item) => setState(() => playerGod = item),
              playerRolekey: playerRolekey,
              playerRole: playerRole,
              onPlayerRoleSection: (item) => setState(() => playerRole = item),
            ),
            const SizedBox(height: 50),
            const Text("Select Opponent god"),
            GodSelectorField(
              fieldKey: opponentGodFieldKey,
              godsMetadata: godsMetadata,
              thisGodMetadata: opponentGod,
              onGodSelection: (item) => setState(() => opponentGod = item),
            ),
            const SizedBox(height: 100),
            const Text("Best Counter Build"),
            (playerGod != null && opponentGod != null && playerRole != null)
                ? Expanded(
                    child: FutureBuilder<Widget>(
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
                        }),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
