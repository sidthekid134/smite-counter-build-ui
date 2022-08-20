class MatchDetails {
  int? accountLevel;
  int? activeId1;
  int? activeId2;
  int? activeId3;
  int? activeId4;
  String? activePlayerId;
  int? assists;
  String? ban1;
  String? ban10;
  int? ban10Id;
  String? ban11;
  int? ban11Id;
  String? ban12;
  int? ban12Id;
  int? ban1Id;
  String? ban2;
  int? ban2Id;
  String? ban3;
  int? ban3Id;
  String? ban4;
  int? ban4Id;
  String? ban5;
  int? ban5Id;
  String? ban6;
  int? ban6Id;
  String? ban7;
  int? ban7Id;
  String? ban8;
  int? ban8Id;
  String? ban9;
  int? ban9Id;
  int? campsCleared;
  int? conquestLosses;
  int? conquestPoints;
  int? conquestTier;
  int? conquestWins;
  int? damageBot;
  int? damageDoneInHand;
  int? damageDoneMagical;
  int? damageDonePhysical;
  int? damageMitigated;
  int? damagePlayer;
  int? damageTaken;
  int? damageTakenMagical;
  int? damageTakenPhysical;
  int? deaths;
  int? distanceTraveled;
  int? duelLosses;
  int? duelPoints;
  int? duelTier;
  int? duelWins;
  String? entryDatetime;
  int? finalMatchLevel;
  String? firstBanSide;
  int? godId;
  late int goldEarned;
  int? goldPerMinute;
  int? healing;
  int? healingBot;
  int? healingPlayerSelf;
  int? itemId1;
  int? itemId2;
  int? itemId3;
  int? itemId4;
  int? itemId5;
  int? itemId6;
  String? itemActive1;
  String? itemActive2;
  String? itemActive3;
  String? itemActive4;
  String? itemPurch1;
  String? itemPurch2;
  String? itemPurch3;
  String? itemPurch4;
  String? itemPurch5;
  String? itemPurch6;
  int? joustLosses;
  int? joustPoints;
  int? joustTier;
  int? joustWins;
  int? killingSpree;
  int? killsBot;
  int? killsDouble;
  int? killsFireGiant;
  int? killsFirstBlood;
  int? killsGoldFury;
  int? killsPenta;
  int? killsPhoenix;
  int? killsPlayer;
  int? killsQuadra;
  int? killsSiegeJuggernaut;
  int? killsSingle;
  int? killsTriple;
  int? killsWildJuggernaut;
  String? mapGame;
  int? masteryLevel;
  late int match;
  int? matchDuration;
  List<MergedPlayers>? mergedPlayers;
  int? minutes;
  int? multiKillMax;
  int? objectiveAssists;
  int? partyId;
  double? rankStatConquest;
  double? rankStatDuel;
  double? rankStatJoust;
  String? referenceName;
  String? region;
  late String role;
  String? skin;
  int? skinId;
  int? structureDamage;
  int? surrendered;
  int? taskForce;
  int? team1Score;
  int? team2Score;
  int? teamId;
  String? teamName;
  int? timeDeadSeconds;
  int? timeInMatchSeconds;
  int? towersDestroyed;
  int? wardsPlaced;
  late String winStatus;
  int? winningTaskForce;
  String? hasReplay;
  String? hzGamerTag;
  String? hzPlayerName;
  int? matchQueueId;
  String? name;
  String? playerId;
  String? playerName;
  String? playerPortalId;
  String? playerPortalUserId;
  String? retMsg;

  MatchDetails(
      {this.accountLevel,
      this.activeId1,
      this.activeId2,
      this.activeId3,
      this.activeId4,
      this.activePlayerId,
      this.assists,
      this.ban1,
      this.ban10,
      this.ban10Id,
      this.ban11,
      this.ban11Id,
      this.ban12,
      this.ban12Id,
      this.ban1Id,
      this.ban2,
      this.ban2Id,
      this.ban3,
      this.ban3Id,
      this.ban4,
      this.ban4Id,
      this.ban5,
      this.ban5Id,
      this.ban6,
      this.ban6Id,
      this.ban7,
      this.ban7Id,
      this.ban8,
      this.ban8Id,
      this.ban9,
      this.ban9Id,
      this.campsCleared,
      this.conquestLosses,
      this.conquestPoints,
      this.conquestTier,
      this.conquestWins,
      this.damageBot,
      this.damageDoneInHand,
      this.damageDoneMagical,
      this.damageDonePhysical,
      this.damageMitigated,
      this.damagePlayer,
      this.damageTaken,
      this.damageTakenMagical,
      this.damageTakenPhysical,
      this.deaths,
      this.distanceTraveled,
      this.duelLosses,
      this.duelPoints,
      this.duelTier,
      this.duelWins,
      this.entryDatetime,
      this.finalMatchLevel,
      this.firstBanSide,
      this.godId,
      required this.goldEarned,
      this.goldPerMinute,
      this.healing,
      this.healingBot,
      this.healingPlayerSelf,
      this.itemId1,
      this.itemId2,
      this.itemId3,
      this.itemId4,
      this.itemId5,
      this.itemId6,
      this.itemActive1,
      this.itemActive2,
      this.itemActive3,
      this.itemActive4,
      this.itemPurch1,
      this.itemPurch2,
      this.itemPurch3,
      this.itemPurch4,
      this.itemPurch5,
      this.itemPurch6,
      this.joustLosses,
      this.joustPoints,
      this.joustTier,
      this.joustWins,
      this.killingSpree,
      this.killsBot,
      this.killsDouble,
      this.killsFireGiant,
      this.killsFirstBlood,
      this.killsGoldFury,
      this.killsPenta,
      this.killsPhoenix,
      this.killsPlayer,
      this.killsQuadra,
      this.killsSiegeJuggernaut,
      this.killsSingle,
      this.killsTriple,
      this.killsWildJuggernaut,
      this.mapGame,
      this.masteryLevel,
      required this.match,
      this.matchDuration,
      this.mergedPlayers,
      this.minutes,
      this.multiKillMax,
      this.objectiveAssists,
      this.partyId,
      this.rankStatConquest,
      this.rankStatDuel,
      this.rankStatJoust,
      this.referenceName,
      this.region,
      required this.role,
      this.skin,
      this.skinId,
      this.structureDamage,
      this.surrendered,
      this.taskForce,
      this.team1Score,
      this.team2Score,
      this.teamId,
      this.teamName,
      this.timeDeadSeconds,
      this.timeInMatchSeconds,
      this.towersDestroyed,
      this.wardsPlaced,
      required this.winStatus,
      this.winningTaskForce,
      this.hasReplay,
      this.hzGamerTag,
      this.hzPlayerName,
      this.matchQueueId,
      this.name,
      this.playerId,
      this.playerName,
      this.playerPortalId,
      this.playerPortalUserId,
      this.retMsg});

  MatchDetails.fromJson(Map<String, dynamic> json) {
    accountLevel = json['Account_Level'];
    activeId1 = json['ActiveId1'];
    activeId2 = json['ActiveId2'];
    activeId3 = json['ActiveId3'];
    activeId4 = json['ActiveId4'];
    activePlayerId = json['ActivePlayerId'];
    assists = json['Assists'];
    ban1 = json['Ban1'];
    ban10 = json['Ban10'];
    ban10Id = json['Ban10Id'];
    ban11 = json['Ban11'];
    ban11Id = json['Ban11Id'];
    ban12 = json['Ban12'];
    ban12Id = json['Ban12Id'];
    ban1Id = json['Ban1Id'];
    ban2 = json['Ban2'];
    ban2Id = json['Ban2Id'];
    ban3 = json['Ban3'];
    ban3Id = json['Ban3Id'];
    ban4 = json['Ban4'];
    ban4Id = json['Ban4Id'];
    ban5 = json['Ban5'];
    ban5Id = json['Ban5Id'];
    ban6 = json['Ban6'];
    ban6Id = json['Ban6Id'];
    ban7 = json['Ban7'];
    ban7Id = json['Ban7Id'];
    ban8 = json['Ban8'];
    ban8Id = json['Ban8Id'];
    ban9 = json['Ban9'];
    ban9Id = json['Ban9Id'];
    campsCleared = json['Camps_Cleared'];
    conquestLosses = json['Conquest_Losses'];
    conquestPoints = json['Conquest_Points'];
    conquestTier = json['Conquest_Tier'];
    conquestWins = json['Conquest_Wins'];
    damageBot = json['Damage_Bot'];
    damageDoneInHand = json['Damage_Done_In_Hand'];
    damageDoneMagical = json['Damage_Done_Magical'];
    damageDonePhysical = json['Damage_Done_Physical'];
    damageMitigated = json['Damage_Mitigated'];
    damagePlayer = json['Damage_Player'];
    damageTaken = json['Damage_Taken'];
    damageTakenMagical = json['Damage_Taken_Magical'];
    damageTakenPhysical = json['Damage_Taken_Physical'];
    deaths = json['Deaths'];
    distanceTraveled = json['Distance_Traveled'];
    duelLosses = json['Duel_Losses'];
    duelPoints = json['Duel_Points'];
    duelTier = json['Duel_Tier'];
    duelWins = json['Duel_Wins'];
    entryDatetime = json['Entry_Datetime'];
    finalMatchLevel = json['Final_Match_Level'];
    firstBanSide = json['First_Ban_Side'];
    godId = json['GodId'];
    goldEarned = json['Gold_Earned'];
    goldPerMinute = json['Gold_Per_Minute'];
    healing = json['Healing'];
    healingBot = json['Healing_Bot'];
    healingPlayerSelf = json['Healing_Player_Self'];
    itemId1 = json['ItemId1'];
    itemId2 = json['ItemId2'];
    itemId3 = json['ItemId3'];
    itemId4 = json['ItemId4'];
    itemId5 = json['ItemId5'];
    itemId6 = json['ItemId6'];
    itemActive1 = json['Item_Active_1'];
    itemActive2 = json['Item_Active_2'];
    itemActive3 = json['Item_Active_3'];
    itemActive4 = json['Item_Active_4'];
    itemPurch1 = json['Item_Purch_1'];
    itemPurch2 = json['Item_Purch_2'];
    itemPurch3 = json['Item_Purch_3'];
    itemPurch4 = json['Item_Purch_4'];
    itemPurch5 = json['Item_Purch_5'];
    itemPurch6 = json['Item_Purch_6'];
    joustLosses = json['Joust_Losses'];
    joustPoints = json['Joust_Points'];
    joustTier = json['Joust_Tier'];
    joustWins = json['Joust_Wins'];
    killingSpree = json['Killing_Spree'];
    killsBot = json['Kills_Bot'];
    killsDouble = json['Kills_Double'];
    killsFireGiant = json['Kills_Fire_Giant'];
    killsFirstBlood = json['Kills_First_Blood'];
    killsGoldFury = json['Kills_Gold_Fury'];
    killsPenta = json['Kills_Penta'];
    killsPhoenix = json['Kills_Phoenix'];
    killsPlayer = json['Kills_Player'];
    killsQuadra = json['Kills_Quadra'];
    killsSiegeJuggernaut = json['Kills_Siege_Juggernaut'];
    killsSingle = json['Kills_Single'];
    killsTriple = json['Kills_Triple'];
    killsWildJuggernaut = json['Kills_Wild_Juggernaut'];
    mapGame = json['Map_Game'];
    masteryLevel = json['Mastery_Level'];
    match = json['Match'];
    matchDuration = json['Match_Duration'];
    if (json['MergedPlayers'] != null) {
      mergedPlayers = <MergedPlayers>[];
      json['MergedPlayers'].forEach((v) {
        mergedPlayers!.add(MergedPlayers.fromJson(v));
      });
    }
    minutes = json['Minutes'];
    multiKillMax = json['Multi_kill_Max'];
    objectiveAssists = json['Objective_Assists'];
    partyId = json['PartyId'];
    rankStatConquest = json['Rank_Stat_Conquest'];
    rankStatDuel = json['Rank_Stat_Duel'];
    rankStatJoust = json['Rank_Stat_Joust'];
    referenceName = json['Reference_Name'];
    region = json['Region'];
    role = json['Role'];
    skin = json['Skin'];
    skinId = json['SkinId'];
    structureDamage = json['Structure_Damage'];
    surrendered = json['Surrendered'];
    taskForce = json['TaskForce'];
    team1Score = json['Team1Score'];
    team2Score = json['Team2Score'];
    teamId = json['TeamId'];
    teamName = json['Team_Name'];
    timeDeadSeconds = json['Time_Dead_Seconds'];
    timeInMatchSeconds = json['Time_In_Match_Seconds'];
    towersDestroyed = json['Towers_Destroyed'];
    wardsPlaced = json['Wards_Placed'];
    winStatus = json['Win_Status'];
    winningTaskForce = json['Winning_TaskForce'];
    hasReplay = json['hasReplay'];
    hzGamerTag = json['hz_gamer_tag'];
    hzPlayerName = json['hz_player_name'];
    matchQueueId = json['match_queue_id'];
    name = json['name'];
    playerId = json['playerId'];
    playerName = json['playerName'];
    playerPortalId = json['playerPortalId'];
    playerPortalUserId = json['playerPortalUserId'];
    retMsg = json['ret_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Account_Level'] = accountLevel;
    data['ActiveId1'] = activeId1;
    data['ActiveId2'] = activeId2;
    data['ActiveId3'] = activeId3;
    data['ActiveId4'] = activeId4;
    data['ActivePlayerId'] = activePlayerId;
    data['Assists'] = assists;
    data['Ban1'] = ban1;
    data['Ban10'] = ban10;
    data['Ban10Id'] = ban10Id;
    data['Ban11'] = ban11;
    data['Ban11Id'] = ban11Id;
    data['Ban12'] = ban12;
    data['Ban12Id'] = ban12Id;
    data['Ban1Id'] = ban1Id;
    data['Ban2'] = ban2;
    data['Ban2Id'] = ban2Id;
    data['Ban3'] = ban3;
    data['Ban3Id'] = ban3Id;
    data['Ban4'] = ban4;
    data['Ban4Id'] = ban4Id;
    data['Ban5'] = ban5;
    data['Ban5Id'] = ban5Id;
    data['Ban6'] = ban6;
    data['Ban6Id'] = ban6Id;
    data['Ban7'] = ban7;
    data['Ban7Id'] = ban7Id;
    data['Ban8'] = ban8;
    data['Ban8Id'] = ban8Id;
    data['Ban9'] = ban9;
    data['Ban9Id'] = ban9Id;
    data['Camps_Cleared'] = campsCleared;
    data['Conquest_Losses'] = conquestLosses;
    data['Conquest_Points'] = conquestPoints;
    data['Conquest_Tier'] = conquestTier;
    data['Conquest_Wins'] = conquestWins;
    data['Damage_Bot'] = damageBot;
    data['Damage_Done_In_Hand'] = damageDoneInHand;
    data['Damage_Done_Magical'] = damageDoneMagical;
    data['Damage_Done_Physical'] = damageDonePhysical;
    data['Damage_Mitigated'] = damageMitigated;
    data['Damage_Player'] = damagePlayer;
    data['Damage_Taken'] = damageTaken;
    data['Damage_Taken_Magical'] = damageTakenMagical;
    data['Damage_Taken_Physical'] = damageTakenPhysical;
    data['Deaths'] = deaths;
    data['Distance_Traveled'] = distanceTraveled;
    data['Duel_Losses'] = duelLosses;
    data['Duel_Points'] = duelPoints;
    data['Duel_Tier'] = duelTier;
    data['Duel_Wins'] = duelWins;
    data['Entry_Datetime'] = entryDatetime;
    data['Final_Match_Level'] = finalMatchLevel;
    data['First_Ban_Side'] = firstBanSide;
    data['GodId'] = godId;
    data['Gold_Earned'] = goldEarned;
    data['Gold_Per_Minute'] = goldPerMinute;
    data['Healing'] = healing;
    data['Healing_Bot'] = healingBot;
    data['Healing_Player_Self'] = healingPlayerSelf;
    data['ItemId1'] = itemId1;
    data['ItemId2'] = itemId2;
    data['ItemId3'] = itemId3;
    data['ItemId4'] = itemId4;
    data['ItemId5'] = itemId5;
    data['ItemId6'] = itemId6;
    data['Item_Active_1'] = itemActive1;
    data['Item_Active_2'] = itemActive2;
    data['Item_Active_3'] = itemActive3;
    data['Item_Active_4'] = itemActive4;
    data['Item_Purch_1'] = itemPurch1;
    data['Item_Purch_2'] = itemPurch2;
    data['Item_Purch_3'] = itemPurch3;
    data['Item_Purch_4'] = itemPurch4;
    data['Item_Purch_5'] = itemPurch5;
    data['Item_Purch_6'] = itemPurch6;
    data['Joust_Losses'] = joustLosses;
    data['Joust_Points'] = joustPoints;
    data['Joust_Tier'] = joustTier;
    data['Joust_Wins'] = joustWins;
    data['Killing_Spree'] = killingSpree;
    data['Kills_Bot'] = killsBot;
    data['Kills_Double'] = killsDouble;
    data['Kills_Fire_Giant'] = killsFireGiant;
    data['Kills_First_Blood'] = killsFirstBlood;
    data['Kills_Gold_Fury'] = killsGoldFury;
    data['Kills_Penta'] = killsPenta;
    data['Kills_Phoenix'] = killsPhoenix;
    data['Kills_Player'] = killsPlayer;
    data['Kills_Quadra'] = killsQuadra;
    data['Kills_Siege_Juggernaut'] = killsSiegeJuggernaut;
    data['Kills_Single'] = killsSingle;
    data['Kills_Triple'] = killsTriple;
    data['Kills_Wild_Juggernaut'] = killsWildJuggernaut;
    data['Map_Game'] = mapGame;
    data['Mastery_Level'] = masteryLevel;
    data['Match'] = match;
    data['Match_Duration'] = matchDuration;
    if (mergedPlayers != null) {
      data['MergedPlayers'] = mergedPlayers!.map((v) => v.toJson()).toList();
    }
    data['Minutes'] = minutes;
    data['Multi_kill_Max'] = multiKillMax;
    data['Objective_Assists'] = objectiveAssists;
    data['PartyId'] = partyId;
    data['Rank_Stat_Conquest'] = rankStatConquest;
    data['Rank_Stat_Duel'] = rankStatDuel;
    data['Rank_Stat_Joust'] = rankStatJoust;
    data['Reference_Name'] = referenceName;
    data['Region'] = region;
    data['Role'] = role;
    data['Skin'] = skin;
    data['SkinId'] = skinId;
    data['Structure_Damage'] = structureDamage;
    data['Surrendered'] = surrendered;
    data['TaskForce'] = taskForce;
    data['Team1Score'] = team1Score;
    data['Team2Score'] = team2Score;
    data['TeamId'] = teamId;
    data['Team_Name'] = teamName;
    data['Time_Dead_Seconds'] = timeDeadSeconds;
    data['Time_In_Match_Seconds'] = timeInMatchSeconds;
    data['Towers_Destroyed'] = towersDestroyed;
    data['Wards_Placed'] = wardsPlaced;
    data['Win_Status'] = winStatus;
    data['Winning_TaskForce'] = winningTaskForce;
    data['hasReplay'] = hasReplay;
    data['hz_gamer_tag'] = hzGamerTag;
    data['hz_player_name'] = hzPlayerName;
    data['match_queue_id'] = matchQueueId;
    data['name'] = name;
    data['playerId'] = playerId;
    data['playerName'] = playerName;
    data['playerPortalId'] = playerPortalId;
    data['playerPortalUserId'] = playerPortalUserId;
    data['ret_msg'] = retMsg;
    return data;
  }
}

class MergedPlayers {
  String? mergeDatetime;
  String? playerId;
  String? portalId;

  MergedPlayers({this.mergeDatetime, this.playerId, this.portalId});

  MergedPlayers.fromJson(Map<String, dynamic> json) {
    mergeDatetime = json['merge_datetime'];
    playerId = json['playerId'];
    portalId = json['portalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merge_datetime'] = mergeDatetime;
    data['playerId'] = playerId;
    data['portalId'] = portalId;
    return data;
  }
}
