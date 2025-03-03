import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'dialog_viewmodel.dart';

class DialogListener extends StatelessWidget {
  const DialogListener({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DialogViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (viewModel.message != null && viewModel.title != null) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: viewModel.title,
          desc: viewModel.message,
          btnOkOnPress: () {
            viewModel.closeDialog();
          },
        ).show();
      }
    });

    return SizedBox.shrink();
  }
}
