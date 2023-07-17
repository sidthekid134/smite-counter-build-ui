import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smite_counter_build/business_logic/smite_bloc/smite_cubit.dart';
import 'package:smite_counter_build/models/gods_metadata.dart';

class GodBox extends StatefulWidget {
  const GodBox({super.key, required this.godsMetaData, required this.onTap});

  final GodsMetadata godsMetaData;
  final Function onTap;

  @override
  State<GodBox> createState() => _GodBoxState();
}

class _GodBoxState extends State<GodBox> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      child: Card(
        color: isHovering
            ? Colors.lightBlue
            : const Color.fromRGBO(232, 232, 232, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        child: InkWell(
          onHover: (hovering) {
            setState(() {
              isHovering = hovering;
            });
          },
          onTap: () => widget.onTap(widget.godsMetaData),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
            side: BorderSide.none,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
            child: SizedBox(
              width: 150,
              height: 200,
              child: Column(children: [
                Flexible(
                  child: FractionallySizedBox(
                      widthFactor: 0.65,
                      heightFactor: 0.65,
                      child: CachedNetworkImage(
                        imageUrl: widget.godsMetaData.godIconURL,
                      )),
                ),
                const SizedBox(height: 30),
                Text(
                  widget.godsMetaData.name,
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
      ),
    );
  }
}
