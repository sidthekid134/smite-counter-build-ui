import 'package:flutter/material.dart';

class SelectedDataShower extends StatelessWidget {
  const SelectedDataShower({
    super.key,
    required this.assetUrl,
    required this.assetText,
    required this.headerText,
    required this.onTap,
  });

  final String assetUrl;
  final String assetText;
  final String headerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 30,
      child: Row(
        children: [
          Text(
            headerText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          Card(
            color: const Color.fromRGBO(232, 232, 232, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17.0),
            ),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(children: [
                  Image.asset(
                    assetUrl,
                    height: 50,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    assetText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}