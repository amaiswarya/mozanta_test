import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonName;
  final double? fontSize;
  final FontWeight? fontweight;
  final double? height;
  final double? width;
  // final Color? color;

  final void Function()? onpressed;
  const ButtonWidget({
    Key? key,
    required this.buttonName,
    this.fontSize,
    this.fontweight,
    // this.color,
    this.onpressed,
    this.height,
    this.width,
  }) : super(key: key);
  static const txtStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onpressed,
        child: Container(
          height: height ?? 50,
          width: width ?? 130,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff374ABE), AppColors.primaryColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: fontSize ?? 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}
