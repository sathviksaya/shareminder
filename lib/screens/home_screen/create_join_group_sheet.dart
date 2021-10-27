import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/screens/widgets/dialog_head.dart';
import '/shared/my_textfield.dart';
import '/utils/group_functions.dart';

class GroupDialog extends StatelessWidget {
  final bool create;
  GroupDialog({Key? key, required this.create}) : super(key: key);

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DialogHead(
                  heading: create ? 'Create Group' : 'Join Group',
                ),
                const SizedBox(height: 20),
                dialogbody(context),
                const SizedBox(
                  height: 20,
                ),
                submitButton(context),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dialogbody(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      labeledField(
        create ? 'Group Name' : 'Group ID',
        create ? "Enter the group name" : "Enter the group id",
        controller1,
      ),
      const SizedBox(height: 20),
      labeledField(
        create ? 'Description' : 'Extension',
        create ? "Short description..." : "Ex: 123456",
        controller2,
        inputType: create ? TextInputType.text : TextInputType.number,
      ),
    ],
  );

  Widget labeledField(
    String label,
    String hint,
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              label,
              style: GoogleFonts.roboto(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 5),
          MyTextField(
            inputType: inputType,
            controller: controller,
            hint: hint,
          ),
        ],
      );

  Widget submitButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            child: const SizedBox(
              height: 30,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 10,
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: create
                ? () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    createGroup(
                      context,
                      controller1.text,
                      controller2.text,
                    );
                  }
                : () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    joinGroup(
                      context,
                      controller1.text,
                      controller2.text,
                    );
                  },
          ),
        ],
      );
}
