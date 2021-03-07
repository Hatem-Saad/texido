import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/widgets/custom_text.dart';

class ConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size * 20),
      child: FlatButton(
        onPressed: () => Get.close(1),
        padding: EdgeInsets.all(0.0),
        child: Container(
          height: size * 3.5,
          width: Get.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: SemiBoldText(
            text: "Confirm",
            size: c,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}

class UserImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: whiteColor, width: size * 0.4),
        image: DecorationImage(
          image: NetworkImage(
              "https://dq1eylutsoz4u.cloudfront.net/2016/12/07190305/not-so-nice-nice-guy.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            child: SvgPicture.asset(check, height: size * 1.3),
            right: 0.0,
            top: 0.0,
          ),
        ],
      ),
      height: size * 6,
      width: size * 6,
    );
  }
}

class ScanningData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size, vertical: size * 2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(tableIcon),
                  SizedBox(width: size),
                  MediumText(
                    text: "Table 45",
                    size: a,
                    color: redColor,
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(people),
                  SizedBox(width: size * 0.5),
                  RegularText(
                    text: "2 People",
                    size: a,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: size),
          Divider(),
          SizedBox(height: size),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(clock),
                  SizedBox(width: size),
                  MediumText(
                    text: "When",
                    size: a,
                    color: redColor,
                  )
                ],
              ),
              RegularText(
                text: "6:00 PM Sunday, Feb 04, 2020",
                size: a,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: size * 4),
        MediumText(text: "Saleem Salman", size: d),
        SizedBox(height: size),
        RegularText(
          text: "+976 123456789",
          size: a,
          color: greyColor05,
        ),
        SizedBox(height: size),
        prizer(),
      ],
    );
  }

  Widget prizer() {
    return Container(
      width: size * 4.5,
      height: size * 2,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            prize,
            color: whiteColor,
            height: size,
          ),
          SizedBox(width: size * .5),
          RegularText(
            text: "Gold",
            size: a,
            color: whiteColor,
          ),
        ],
      ),
    );
  }
}
