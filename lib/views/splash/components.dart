import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/widgets/custom_text.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(splash, height: size * 11),
        SizedBox(height: size),
        MediumText(
          text: "Redefining elegance!",
          size: c,
          color: blueGrey,
        ),
      ],
    );
  }
}
