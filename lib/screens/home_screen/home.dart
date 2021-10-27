import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/screens/auth_&_settings/settings_screen.dart';
import '/screens/home_screen/new_group_dialog.dart';
import '/screens/widgets/dropdown_list.dart';
import '/utils/page_surf.dart';

import 'display_groups.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  void showNewGroupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return const NewGroupDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   FocusScope.of(context).requestFocus(new FocusNode());
      // },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Shareminder',
            style: GoogleFonts.roboto(
              color: Colors.black87,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: homeOption(context),
        ),
        body: const DisplayGroups(),
      ),
    );
  }

  List<Widget> homeOption(BuildContext context) => [
        FilterMenu(
          options: homeMenu,
          optionIcons: homeMenuIcons,
          icon: Icons.more_vert,
          onSelect: (choice) {
            // FocusScope.of(context).requestFocus(new FocusNode());
            switch (choice) {
              case 'Settings':
                pushPage(context, const Settings());
                break;
              case 'New group':
                showNewGroupDialog(context);
                break;
              default:
                break;
            }
          },
        ),
      ];

  List<String> homeMenu = ['New group', 'Settings'];

  Map<String, List> homeMenuIcons = {
    'New group': [
      Icons.add,
      Colors.black87,
    ],
    'Settings': [
      Icons.settings,
      Colors.black87,
    ],
  };
}
