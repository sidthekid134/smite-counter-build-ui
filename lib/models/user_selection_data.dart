import 'package:smite_counter_build/models/counter_build_data.dart';
import 'package:smite_counter_build/models/gods_metadata.dart';
import 'package:smite_counter_build/models/smite_constants.dart';

class UserSelectionData {
  GodsMetadata? playerGod;
  GodsMetadata? opponentGod;
  SmiteRole? playerRole;
  CounterBuildData? counterBuildData;

  UserSelectionData(
      {this.playerGod,
      this.opponentGod,
      this.playerRole,
      this.counterBuildData});

  UserSelectionData copyWith(
      {playerGod, opponentGod, playerRole, counterBuildData}) {
    return UserSelectionData(
      playerGod: playerGod ?? this.playerGod,
      opponentGod: opponentGod ?? this.opponentGod,
      playerRole: playerRole ?? this.playerRole,
      counterBuildData: counterBuildData ?? this.counterBuildData,
    );
  }
}
