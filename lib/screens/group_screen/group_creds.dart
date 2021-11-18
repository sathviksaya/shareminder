import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/dialog_head.dart';
import '/utils/show_msg.dart';

class GroupCreds extends StatelessWidget {
  final String groupId;
  final String extension;
  const GroupCreds({
    Key? key,
    required this.groupId,
    required this.extension,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DialogHead(heading: 'Group credentials'),
              const SizedBox(
                height: 20,
              ),
              showInfo(
                'Group Id',
                groupId,
              ),
              const SizedBox(
                height: 20,
              ),
              showInfo(
                'Extension',
                extension,
              ),
              const SizedBox(
                height: 30,
              ),
              copyButton(
                groupId,
                extension,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget copyButton(String groupId, String extension) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(
                  text: "Group Id : $groupId \nExtension : $extension",
                ),
              );
              showToast('Copied to clipboard');
            },
            icon: const Icon(
              Icons.copy,
              color: Colors.black54,
            ),
          ),
        ],
      );

  Widget showInfo(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 13,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: GoogleFonts.roboto(
            fontSize: 17,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
