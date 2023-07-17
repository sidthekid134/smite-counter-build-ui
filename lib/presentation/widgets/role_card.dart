import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smite_counter_build/business_logic/smite_bloc/smite_cubit.dart';
import 'package:smite_counter_build/models/smite_constants.dart';

@immutable
class RoleCard extends StatefulWidget {
  final String imagePath;
  final SmiteRole roleName;

  const RoleCard({super.key, required this.imagePath, required this.roleName});

  @override
  State<RoleCard> createState() => _RoleCardState();
}

class _RoleCardState extends State<RoleCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hovering) {
        setState(() {
          isHovering = hovering;
        });
      },
      onTap: () => context.read<SmiteCubit>().addUserRole(widget.roleName),
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
        side: BorderSide.none,
      ),
      child: Card(
        color: isHovering
            ? Colors.lightBlue
            : const Color.fromRGBO(232, 232, 232, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 200,
            height: 250,
            child: Column(children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 40),
                  child: FractionallySizedBox(
                      widthFactor: 0.65,
                      heightFactor: 0.65,
                      child: Image.asset(
                          "${(kDebugMode && kIsWeb) ? "" : "assets/"}${widget.imagePath}")),
                ),
              ),
              Text(
                widget.roleName.value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
