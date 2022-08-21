import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smite_counter_build/models/gods_metadata.dart';
import 'package:smite_counter_build/models/smite_constants.dart';

class GodSelectorField extends StatelessWidget {
  final GlobalKey<AutoCompleteTextFieldState<GodsMetadata>> fieldKey;
  final List<GodsMetadata>? godsMetadata;
  final GodsMetadata? thisGodMetadata;
  final ValueSetter<GodsMetadata> onGodSelection;
  final GlobalKey<AutoCompleteTextFieldState<SmiteRole>>? playerRolekey;
  final SmiteRole? playerRole;
  final ValueSetter<SmiteRole>? onPlayerRoleSection;

  const GodSelectorField({
    Key? key,
    required this.fieldKey,
    this.godsMetadata,
    this.thisGodMetadata,
    required this.onGodSelection,
    this.playerRolekey,
    this.playerRole,
    this.onPlayerRoleSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: AutoCompleteTextField<GodsMetadata>(
            key: fieldKey,
            suggestions: godsMetadata ?? [],
            // decoration: const InputDecoration(errorText: "God Not Found!"),
            controller: TextEditingController(text: thisGodMetadata?.name),
            itemBuilder: (context, suggestion) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  title: Text(suggestion.name),
                  trailing: Text("Role: ${suggestion.roles}")),
            ),
            itemSorter: (a, b) => 1,
            itemFilter: (suggestion, input) =>
                suggestion.name.toLowerCase().startsWith(input.toLowerCase()),
            itemSubmitted: onGodSelection,
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          flex: 1,
          child: thisGodMetadata != null
              ? CachedNetworkImage(
                  imageUrl: thisGodMetadata!.godIconURL,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                )
              : Container(),
        ),
        playerRolekey != null
            ? const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text("Role:"),
              )
            : Container(),
        playerRolekey != null
            ? Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: AutoCompleteTextField<SmiteRole>(
                    key: playerRolekey!,
                    suggestions: SmiteRole.values,
                    // decoration: const InputDecoration(errorText: "Role Not Found!"),
                    controller: TextEditingController(text: playerRole?.value),
                    itemBuilder: (context, suggestion) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(suggestion.value),
                      ),
                    ),
                    itemSorter: (a, b) => 1,
                    itemFilter: (suggestion, input) => suggestion.value
                        .toLowerCase()
                        .contains(input.toLowerCase()),
                    itemSubmitted: onPlayerRoleSection,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
