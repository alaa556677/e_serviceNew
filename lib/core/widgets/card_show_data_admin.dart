import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import '../utils/colors.dart';
import 'custom_text.dart';

class CardShowDataWaterInstallation extends StatelessWidget{
  final String title;
  final String? customerName;
  final bool isImage;
  final String? imageUrl;
  const CardShowDataWaterInstallation({super.key, required this.title, this.isImage = false, this.imageUrl, this.customerName});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: title,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          fontColor: Colors.grey,
        ),
        SizedBox(height: 4.h,),
        isImage ? Center(child: InstaImageViewer(child: Image.network(imageUrl!, height: 80.h, width: 80.w,)))
            : Center(child: TextWidget(
          text: customerName,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontColor: Colors.black,
        ),),
        SizedBox(height:4.h,),
        Container(decoration: BoxDecoration(border: Border.all(color: textGreyColor),),),
        SizedBox(height: 8.h,),
      ],
    );
  }
}