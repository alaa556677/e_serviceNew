import 'package:e_services/core/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/button_custom_widget.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/default_screen.dart';
import '../../../../../core/widgets/label_Text_form_field.dart';
import '../../../../../core/widgets/snac_bar.dart';
import '../../cubit/water_cubit.dart';
import '../../cubit/water_states.dart';

class WaterRemoveMeterScreen extends StatefulWidget {
  const WaterRemoveMeterScreen({super.key,});
  @override
  State<WaterRemoveMeterScreen> createState() => _WaterRemoveMeterScreenState();
}

class _WaterRemoveMeterScreenState extends State<WaterRemoveMeterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController meterNumberController = TextEditingController();
  TextEditingController meterReadingController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  late WaterCubit waterCubit;

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    mobileController.dispose();
    meterNumberController.dispose();
    meterReadingController.dispose();
    detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WaterCubit(),
      child: BlocConsumer<WaterCubit, WaterStates>(
        listener: (context, state) {
          if(state is SendRemoveWaterMeterSuccess){
            nameController.clear();
            addressController.clear();
            mobileController.clear();
            meterNumberController.clear();
            meterReadingController.clear();
            detailController.clear();
            defaultSnackBar(
                context: context,
                color: Colors.green,
                text: 'Successfully'
            );
          }
        },
        builder: (context, state) {
          waterCubit = WaterCubit.get(context);
          return DefaultScreen(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'رفع عداد المياه',
                            fontColor: blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      LabelTextFormField(
                        hintText: "اكتب الاسم",
                        controller: nameController,
                        label: 'اسم العميل',
                      ),
                      SizedBox(height: 10.h,),
                      LabelTextFormField(
                        hintText: "اكتب العنوان",
                        controller: addressController,
                        label: 'العنوان',
                      ),
                      SizedBox(height: 10.h,),
                      LabelTextFormField(
                        hintText: "اكتب رقم موبايل",
                        controller: mobileController,
                        label: 'رقم الموبايل',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10.h,),
                      LabelTextFormField(
                        hintText: "رقم العداد",
                        controller: meterNumberController,
                        keyboardType: TextInputType.number,
                        label: 'رقم العداد',
                      ),
                      SizedBox(height: 10.h,),
                      LabelTextFormField(
                        hintText: "القراءة",
                        controller: meterReadingController,
                        label: 'أحدث قراءة للعداد',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10.h,),
                      LabelTextFormField(
                        hintText: "السبب",
                        controller: detailController,
                        label: 'سبب الرفع',
                      ),
                      SizedBox(height: 10.h,),
                      ButtonCustomWidget(
                        buttonColor: blueColor,
                        text: "إرسال",
                        color: whiteColor,
                        buttonWidth:
                        MediaQuery.of(context).size.width,
                        buttonHeight: 48,
                        onPressed: (){
                          waterCubit.sendRemoveWaterMeter(
                            customerName: nameController.text,
                            customerAddress: addressController.text,
                            customerMobile: mobileController.text,
                            meterNumber: meterNumberController.text,
                            nowReadingMeter: meterReadingController.text,
                            reason: detailController.text
                          );
                        },
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