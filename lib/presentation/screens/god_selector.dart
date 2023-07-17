import 'package:flutter/material.dart';
import 'package:smite_counter_build/models/gods_metadata.dart';
import 'package:smite_counter_build/presentation/widgets/god_display.dart';

class GodSelector extends StatefulWidget {
  final List<GodsMetadata> godsMetaData;
  final String headerText;
  final Function onSaveFunction;

  const GodSelector(
      {super.key,
      required this.godsMetaData,
      required this.headerText,
      required this.onSaveFunction});

  @override
  State<GodSelector> createState() => _GodSelectorState();
}

class _GodSelectorState extends State<GodSelector> {
  String typedText = "";

  @override
  Widget build(BuildContext context) {
    List<GodsMetadata> matchedGodMetaData = widget.godsMetaData;
    if (matchedGodMetaData.length > 1 && typedText.isNotEmpty) {
      matchedGodMetaData = widget.godsMetaData
          .where((element) =>
              element.name.toLowerCase().contains(typedText.toLowerCase()))
          .toList();

      // matchedGodMetaData = widget.godsMetaData.sublist(0, 10);
    }

    if (matchedGodMetaData.length > 1) {
      matchedGodMetaData = matchedGodMetaData.sublist(
          0, matchedGodMetaData.length < 10 ? matchedGodMetaData.length : 10);
    }

    List<Widget> matchedGodIconsToShow = matchedGodMetaData
        .map((godMetaData) =>
            GodBox(godsMetaData: godMetaData, onTap: widget.onSaveFunction))
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        Text(
          widget.headerText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 30),
        FractionallySizedBox(
          widthFactor: 0.3,
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                typedText = value;
              });
            },
            decoration: InputDecoration(
                // errorText: this.errorText,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                filled: true,
                fillColor: const Color.fromRGBO(232, 232, 232, 1),
                hintText: "Search"),
          ),
        ),
        const SizedBox(height: 20),
        FractionallySizedBox(
          widthFactor: 0.9,
          child: Card(
            color: const Color.fromRGBO(232, 232, 232, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: matchedGodIconsToShow.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Center(
                        child: Text("No God Found"),
                      ),
                    )
                  : Wrap(children: matchedGodIconsToShow),
            ),
          ),
        )
      ],
    );
  }
}
