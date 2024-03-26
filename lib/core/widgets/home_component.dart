import 'package:e_services/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeComponent extends StatelessWidget{
  const HomeComponent({
    super.key,
    this.isSvg = false,
    this.colorContainer,
    this.heightContainer,
    this.widthContainer,
    this.radius = 15,
    this.pathImage,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.imageHeight,
    this.imageWidth, this.onTap,
    this.subTitle, this.fontWeightSubTitle, this.fontSizeSubTitle, this.fontColorSubTitle
  });
  final double? widthContainer;
  final double? heightContainer;
  final Color? colorContainer;
  final double radius;
  final bool isSvg;
  final String? pathImage;
  final double? imageWidth;
  final double? imageHeight;
  /////////////////////////////
  final String? text;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final void Function()? onTap;

  final String? subTitle;
  final double? fontSizeSubTitle;
  final Color? fontColorSubTitle;
  final FontWeight? fontWeightSubTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: widthContainer,
        height: heightContainer,
        alignment: Alignment.center,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
            color: colorContainer,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  offset: const Offset (0,0),
                  blurRadius: 14
              )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isSvg ? SvgPicture.asset(
              pathImage!,
              width: imageWidth,
              height: imageHeight,
            ) : Image.asset(
              pathImage!,
              width: imageWidth,
              height: imageHeight,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextWidget(
                  text: text,
                  fontSize: fontSize,
                  fontColor: fontColor,
                  fontWeight: fontWeight,
                ),
                SizedBox(height: 8.h,),
                TextWidget(
                  text: subTitle,
                  fontSize: fontSizeSubTitle,
                  fontColor: fontColorSubTitle,
                  fontWeight: fontWeightSubTitle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}