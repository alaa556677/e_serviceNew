import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/upload_image_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/button_custom_widget.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_screen.dart';
import '../../../../core/widgets/label_Text_form_field.dart';
import '../cubit/electricity_cubit.dart';
import '../cubit/electricity_states.dart';


class ElectricityMeterReadingScreen extends StatelessWidget {
  ElectricityMeterReadingScreen({super.key,});
  TextEditingController nowReadingController = TextEditingController();
  TextEditingController readingTypeController = TextEditingController();
  late ElectricityCubit electricityCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElectricityCubit(),
      child: BlocConsumer<ElectricityCubit, ElectricityStates>(
        listener: (context, state) {},
        builder: (context, state) {
          electricityCubit = ElectricityCubit.get(context);
          return DefaultScreen(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 20.w, vertical: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'قراءة عداد الكهرباء',
                            fontColor: blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      LabelTextFormField(
                        hintText: "القراءة الحالية",
                        controller: nowReadingController,
                        label: 'القراءة الحالية',
                      ),
                      SizedBox(height: 10.h,),
                      LabelTextFormField(
                        hintText: "نوع القراءة",
                        controller: readingTypeController,
                        label: 'نوع القراءة',
                      ),
                      SizedBox(height: 10.h,),
                      // UploadImageCard(
                      //   text: 'صورة العداد',
                      //   onTap: () {
                      //     electricityCubit.uploadImageMeter();
                      //   },
                      //   imagePath: 'assets/images/gas_meter.png',
                      //   image: electricityCubit.imageMeter,
                      // ),
                      // SizedBox(height: 20.h,),
                      // UploadImageCard(
                      //   text: 'صورة من الوصل',
                      //   onTap: () {
                      //     electricityCubit.uploadImageMeterReceipt();
                      //   },
                      //   imagePath: "assets/images/bill.png",
                      //   image: electricityCubit.imageMeterReceipt,
                      // ),
                      SizedBox(height: 20.h,),
                      ButtonCustomWidget(
                        buttonColor: blueColor,
                        text: "إرسال",
                        color: whiteColor,
                        buttonWidth:
                        MediaQuery.of(context).size.width,
                        buttonHeight: 48,
                        onPressed: (){},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}