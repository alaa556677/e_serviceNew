import 'package:e_services/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardBasicItem extends StatelessWidget{
  CardBasicItem({
    super.key,
    this.isSvg = false,
    this.colorContainer,
    this.heightContainer,
    this.widthContainer,
    this.radius = 15,
    this.pathImage,
    this.title,
    this.subTitle,
    this.fontSizeTitle,
    this.fontWeightTitle,
    this.fontColorTitle,
    this.fontColorSubTitle,
    this.fontSizeSubTitle,
    this.fontWeightSubTitle,
    this.imageHeight,
    this.imageWidth, this.onTap
  });
  double? widthContainer;
  double? heightContainer;
  Color? colorContainer;
  double radius;
  bool isSvg;
  String? pathImage;
  double? imageWidth;
  double? imageHeight;
  /////////////////////////////
  String? title;
  String? subTitle;
  double? fontSizeTitle;
  double? fontSizeSubTitle;
  Color? fontColorTitle;
  Color? fontColorSubTitle;
  FontWeight? fontWeightTitle;
  FontWeight? fontWeightSubTitle;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: widthContainer,
        height: heightContainer,
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
            SizedBox(width: 14.w,),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: title,
                      fontSize: fontSizeTitle,
                      fontColor: fontColorTitle,
                      fontWeight: fontWeightTitle,
                    ),
                    SizedBox(height: 10.h,),
                    TextWidget(
                      text: subTitle,
                      fontSize: fontSizeSubTitle,
                      fontColor: fontColorSubTitle,
                      fontWeight: fontWeightSubTitle,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}