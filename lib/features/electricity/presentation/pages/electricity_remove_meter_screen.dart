import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/upload_image_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/button_custom_widget.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/default_screen.dart';
import '../../../../core/widgets/label_Text_form_field.dart';
import '../cubit/electricity_cubit.dart';
import '../cubit/electricity_states.dart';

class ElectricityRemoveMeterScreen extends StatelessWidget {
  ElectricityRemoveMeterScreen({super.key,});
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController meterReadingController = TextEditingController();
  TextEditingController serviceTypeController = TextEditingController();
  TextEditingController detailController = TextEditingController();
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
                            text: 'رفع عداد الكهرباء',
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
                        hintText: "اكتب نوع الخدمة",
                        controller: serviceTypeController,
                        label: 'نوع الخدمة',
                      ),
                      SizedBox(height: 10.h,),
                      LabelTextFormField(
                        hintText: "رقم إثبات الشخصية",
                        controller: idController,
                        keyboardType: TextInputType.number,
                        label: 'رقم إثبات الشخصية',
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