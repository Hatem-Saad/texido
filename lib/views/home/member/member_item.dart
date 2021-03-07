import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:texido_app/constants/app_constants.dart';
import 'package:texido_app/constants/asset_path.dart';
import 'package:texido_app/models/member.dart';
import 'package:texido_app/widgets/custom_text.dart';

class MemberItem extends StatelessWidget {
  final MemberInfo member;
  MemberItem(this.member);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size * 4,
      padding: EdgeInsets.symmetric(horizontal: size * 0.5),
      margin: EdgeInsets.only(bottom: size),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Row(
        children: [
          Row(
            children: [
              member.image.isNotEmpty
                  ? CircleAvatar(
                      backgroundImage: FileImage(File(member.image)),
                      radius: size * 1.2,
                    )
                  : CircleAvatar(
                      backgroundColor: greyColor01.withOpacity(0.3),
                      radius: size * 1.2,
                      child: Icon(
                        Icons.person_outline,
                        color: greyColor02,
                        size: size,
                      ),
                    ),
            ],
          ),
          SizedBox(width: size),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText(
                  text: '${member.firstName} ${member.lastName}',
                  size: e,
                  color: darkGrey01,
                ),
                SizedBox(height: size * 0.5),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(mobile, color: darkGrey01),
                        SizedBox(width: size * 0.5),
                        RegularText(
                          text: '+966 ${member.phone}',
                          size: e,
                          color: darkGrey01,
                        ),
                      ],
                    ),
                    SizedBox(width: size * 2),
                    Row(
                      children: [
                        SvgPicture.asset(prize, color: darkGrey01),
                        SizedBox(width: size * 0.5),
                        RegularText(
                          text: member.membership,
                          size: e,
                          color: darkGrey01,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
