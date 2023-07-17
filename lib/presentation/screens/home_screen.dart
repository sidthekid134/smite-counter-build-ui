import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smite_counter_build/business_logic/smite_bloc/smite_cubit.dart';
import 'package:smite_counter_build/data/smite.dart';
import 'package:smite_counter_build/models/gods_metadata.dart';
import 'package:smite_counter_build/models/items_metadata.dart';
import 'package:smite_counter_build/models/user_selection_data.dart';
import 'package:smite_counter_build/presentation/screens/build_shower.dart';
import 'package:smite_counter_build/presentation/screens/player_role_selector.dart';
import 'package:smite_counter_build/presentation/screens/god_selector.dart';
import 'package:smite_counter_build/presentation/widgets/selected_data_shower.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GodsMetadata>? godsMetadata;
  List<ItemsMetadata>? itemsMetadata;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    loadMetadata();
  }

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
    });
  }

  void saveSelectedRole() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(35, 41, 51, 1),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "SMITE COUNTER BUILDER",
          style: TextStyle(color: Theme.of(context).colorScheme.background),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0),
          child: BlocBuilder<SmiteCubit, UserSelectionData>(
              builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state.playerRole != null
                          ? SelectedDataShower(
                              assetUrl:
                                  "classes/${state.playerRole!.value.toLowerCase()}-logo.png",
                              assetText: state.playerRole!.value,
                              headerText: "Your Role: ",
                              onTap: () =>
                                  context.read<SmiteCubit>().removeUserRole(),
                            )
                          : Container(),
                      const SizedBox(width: 60),
                      state.playerGod != null
                          ? SelectedDataShower(
                              assetUrl: state.playerGod!.godIconURL,
                              assetText: state.playerGod!.name,
                              headerText: "Your God: ",
                              onTap: () =>
                                  context.read<SmiteCubit>().removePlayerGod(),
                            )
                          : Container(),
                      const SizedBox(width: 60),
                      state.opponentGod != null
                          ? SelectedDataShower(
                              assetUrl: state.opponentGod!.godIconURL,
                              assetText: state.opponentGod!.name,
                              headerText: "Opponent God: ",
                              onTap: () => context
                                  .read<SmiteCubit>()
                                  .removeOpponentGod(),
                            )
                          : Container(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  state.playerRole != null
                      ? const Divider(
                          height: 1.0,
                          color: Colors.grey,
                          indent: 16.0,
                          endIndent: 16.0,
                          thickness: 1.0,
                        )
                      : Container(),
                  state.playerRole == null
                      ? const PlayerRoleSelector()
                      : Container(),
                  state.playerRole != null && state.playerGod == null
                      ? GodSelector(
                          headerText: "Select Your God:",
                          godsMetaData: godsMetadata ?? [],
                          onSaveFunction:
                              context.read<SmiteCubit>().addPlayerGod,
                        )
                      : Container(),
                  state.playerRole != null &&
                          state.playerGod != null &&
                          state.opponentGod == null
                      ? GodSelector(
                          headerText: "Select Your Opponent's God: ",
                          godsMetaData: godsMetadata ?? [],
                          onSaveFunction:
                              context.read<SmiteCubit>().addOpponentGod,
                        )
                      : Container(),
                  state.counterBuildData != null
                      ? BuildShower(
                          counterBuildData: state.counterBuildData!,
                          itemsMetadata: itemsMetadata!,
                        )
                      : Container(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
