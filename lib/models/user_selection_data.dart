import 'package:smite_counter_build/models/gods_metadata.dart';
import 'package:smite_counter_build/models/smite_constants.dart';

class UserSelectionData {
  GodsMetadata? playerGod;
  GodsMetadata? opponentGod;
  SmiteRole? playerRole;

  UserSelectionData({this.playerGod, this.opponentGod, this.playerRole});

  UserSelectionData copyWith({playerGod, opponentGod, playerRole}) {
    return UserSelectionData(
        playerGod: playerGod ?? this.playerGod,
        opponentGod: opponentGod ?? this.opponentGod,
        playerRole: playerRole ?? this.playerRole);
  }
}
