import 'package:bividpharma/ui/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FuntionItemWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const FuntionItemWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textcolor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: UIHelper.linearPrimaryBackground(context),
              ),
              child: Icon(
                icon,
                size: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                softWrap: true,
                style: GoogleFonts.raleway(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: textcolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
