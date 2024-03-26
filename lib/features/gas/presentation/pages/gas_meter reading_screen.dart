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
import '../cubit/gas_cubit.dart';
import '../cubit/gas_states.dart';

class GasMeterReadingScreen extends StatelessWidget {
  GasMeterReadingScreen({super.key,});
  TextEditingController nowReadingController = TextEditingController();
  TextEditingController readingTypeController = TextEditingController();
  late GasCubit gasCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GasCubit(),
      child: BlocConsumer<GasCubit, GasStates>(
        listener: (context, state) {},
        builder: (context, state) {
          gasCubit = GasCubit.get(context);
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
                            text: 'قراءة عداد الغاز',
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
                      //     gasCubit.uploadImageMeter();
                      //   },
                      //   imagePath: 'assets/images/gas_meter.png',
                      //   image: gasCubit.imageMeter,
                      // ),
                      // SizedBox(height: 20.h,),
                      // UploadImageCard(
                      //   text: 'صورة من الوصل',
                      //   onTap: () {
                      //     gasCubit.uploadImageMeterReceipt();
                      //   },
                      //   imagePath: "assets/images/bill.png",
                      //   image: gasCubit.imageMeterReceipt,
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