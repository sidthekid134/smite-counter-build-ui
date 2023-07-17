import 'package:flutter/material.dart';
import 'package:smite_counter_build/data/smite_god.dart';
import 'package:smite_counter_build/models/smite_constants.dart';
import 'package:smite_counter_build/presentation/widgets/role_card.dart';

class PlayerRoleSelector extends StatelessWidget {
  final SmiteRole? playerRole;

  const PlayerRoleSelector({super.key, this.playerRole});

  @override
  Widget build(BuildContext context) {
    if (playerRole == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Text(
            "Select Your Role:",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              RoleCard(
                imagePath: 'classes/carry-logo.png',
                roleName: SmiteRole.carry,
              ),
              SizedBox(width: 10),
              RoleCard(
                imagePath: 'classes/support-logo.png',
                roleName: SmiteRole.support,
              ),
              SizedBox(width: 10),
              RoleCard(
                imagePath: 'classes/mid-logo.png',
                roleName: SmiteRole.mid,
              ),
              SizedBox(width: 10),
              RoleCard(
                imagePath: 'classes/jungle-logo.png',
                roleName: SmiteRole.jungle,
              ),
              SizedBox(width: 10),
              RoleCard(
                imagePath: 'classes/solo-logo.png',
                roleName: SmiteRole.solo,
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
