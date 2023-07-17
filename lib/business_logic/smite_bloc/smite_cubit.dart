import 'dart:developer';

import 'package:smite_counter_build/data/smite.dart';
import 'package:bloc/bloc.dart';
import 'package:smite_counter_build/models/counter_build_data.dart';
import 'package:smite_counter_build/models/gods_metadata.dart';
import 'package:smite_counter_build/models/smite_constants.dart';
import 'package:smite_counter_build/models/user_selection_data.dart';
import 'package:smite_counter_build/data/smite.dart';

class SmiteCubit extends Cubit<UserSelectionData> {
  SmiteCubit()
      : super(
          UserSelectionData(
            playerRole: SmiteRole.jungle,
            playerGod: GodsMetadata(
                name: "Arachne",
                roles: "Assassin",
                godCardURL:
                    "https://webcdn.hirezstudios.com/smite/god-cards/arachne.jpg",
                godIconURL:
                    "https://webcdn.hirezstudios.com/smite/god-icons/arachne.jpg",
                id: 1699),
            // opponentGod: GodsMetadata(
            //     name: "Loki",
            //     roles: "Assassin",
            //     godCardURL:
            //         "https://webcdn.hirezstudios.com/smite/god-cards/loki.jpg",
            //     godIconURL:
            //         "https://webcdn.hirezstudios.com/smite/god-icons/loki.jpg",
            //     id: 1797),
          ),
        );

  void addUserRole(SmiteRole role) {
    emit(state.copyWith(playerRole: role));
  }

  void removeUserRole() {
    emit(UserSelectionData());
  }

  void addPlayerGod(GodsMetadata godsMetadata) {
    emit(state.copyWith(playerGod: godsMetadata));
  }

  void removePlayerGod() {
    emit(UserSelectionData(playerRole: state.playerRole));
  }

  void addOpponentGod(GodsMetadata godsMetadata) async {
    emit(state.copyWith(opponentGod: godsMetadata));
    CounterBuildData? counterBuildData = await getCounterBuild(
        state.playerGod!, state.opponentGod!, state.playerRole!);
    counterBuildData = counterBuildData ??
        CounterBuildData(numMatchesEvaluated: 0, counterBuild: []);
    emit(state.copyWith(counterBuildData: counterBuildData));
  }

  void removeOpponentGod() {
    emit(UserSelectionData(
        playerRole: state.playerRole, playerGod: state.playerGod));
  }
}
