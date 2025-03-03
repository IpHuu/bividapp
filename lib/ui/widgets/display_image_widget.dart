import 'package:bividpharma/ui/ui_helper.dart';
import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  // Constructor
  const DisplayImage({
    Key? key,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = UIHelper.BIVID_PRIMARY_COLOR;
    return Center(
        child: Stack(children: [
      buildImage(color),
      Positioned(
        right: 4,
        top: 15,
        child: buildEditIcon(color),
      )
    ]));
  }

  // Builds Profile Image
  Widget buildImage(Color color) {
    final image = imagePath.contains('https://')
        ? NetworkImage(imagePath)
        : Image.asset(imagePath).image;

    return CircleAvatar(
      radius: 80,
      backgroundColor: color,
      child: CircleAvatar(
        backgroundImage: image,
        radius: 90,
      ),
    );
  }

  // Builds Edit Icon on Profile Picture
  Widget buildEditIcon(Color color) => buildCircle(
      all: 5,
      child: Icon(
        Icons.edit,
        color: color,
        size: 24,
      ));

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ));
}
