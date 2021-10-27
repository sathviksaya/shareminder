import 'package:flutter/material.dart';

class FilterMenu extends StatelessWidget {
  final List<String> options;
  final Map<String, List> optionIcons;
  final Function(String choice) onSelect;
  final IconData? icon;
  const FilterMenu({
    Key? key,
    required this.options,
    required this.optionIcons,
    required this.onSelect,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      // enableFeedback: true,
      color: Colors.white,
      elevation: 20,
      tooltip: 'Options',
      icon: Icon(
        icon,
        color: Colors.black87,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onSelected: onSelect,
      itemBuilder: (BuildContext context) {
        return options.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  optionIcons[choice]![0],
                  color: optionIcons[choice]![1],
                  size: 17,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  choice,
                  style: TextStyle(
                    color: optionIcons[choice]![1],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
