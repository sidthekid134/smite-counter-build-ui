import 'package:smite_counter_build/data/smite.dart';
import 'package:bloc/bloc.dart';
import 'package:smite_counter_build/models/smite_constants.dart';
import 'package:smite_counter_build/models/user_selection_data.dart';

class SmiteCubit extends Cubit<UserSelectionData> {
  SmiteCubit() : super(UserSelectionData()) {
    // _smite = SMITE();
  }

  void addUserRole(SmiteRole role) {
    // UserSelectionData test = state.copyWith(playerRole: role);
    // emit(test);
    emit(state.copyWith(playerRole: role));
  }

  void removeUserRole() {
    emit(UserSelectionData());
  }
}
