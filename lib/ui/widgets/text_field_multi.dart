import 'package:bividpharma/ui/ui_helper.dart';
import 'package:flutter/material.dart';

class TextFieldMulti extends StatelessWidget {
  const TextFieldMulti({Key? key, this.noiDungController, this.labelText})
      : super(key: key);
  final TextEditingController? noiDungController;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: noiDungController,
      keyboardType: TextInputType.multiline,
      // textAlign: ,
      maxLines: 50,
      minLines: 3,
      style:
          const TextStyle(color: UIHelper.BIVID_BLACK_TEXT_COLOR, fontSize: 14),
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
          ),
          labelText: labelText ?? '',
          alignLabelWithHint: true,
          fillColor: Colors.transparent,
          labelStyle: const TextStyle(color: UIHelper.BIVID_BLACK_TEXT_COLOR)),
    );
  }
}
