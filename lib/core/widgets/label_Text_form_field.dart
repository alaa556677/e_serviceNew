import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import 'custom_text.dart';
import 'custom_text_form_field.dart';

class LabelTextFormField extends StatelessWidget{
  String label;
  String hintText;
  TextEditingController controller;
  TextInputType? keyboardType;
  LabelTextFormField({super.key, required this.label, required this.controller, required this.hintText, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: label,
          fontColor: textGreyColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
        SizedBox(height: 5.h,),
        CustomTextFormField(
          controller: controller,
          radius: 10,
          validator: (value) {
            if (value!.isEmpty) {
              return 'require';
            }
            return null;
          },
          hint: hintText,
          autoFocus: false,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}