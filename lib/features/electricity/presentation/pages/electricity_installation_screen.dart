import 'package:flutter/material.dart';
import 'package:e_services/core/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/button_custom_widget.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/default_screen.dart';
import '../../../../core/widgets/label_Text_form_field.dart';
import '../../../../core/widgets/upload_image_card.dart';
import '../cubit/electricity_cubit.dart';
import '../cubit/electricity_states.dart';


class ElectricityInstallationScreen extends StatelessWidget {
  ElectricityInstallationScreen({super.key,});
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController homeTypeController = TextEditingController();
  TextEditingController serviceTypeController = TextEditingController();
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
                            text: 'تعاقد عداد الكهرباء',
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
                      TextWidget(
                        text: "نوع العقار",
                        fontSize: 14.sp,
                        fontColor: textGreyColor,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 5.h,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: textGreyColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                            items: ['شقة', 'وحدة سكنية', 'محل إيجار'].map((e) => DropdownMenuItem(
                                value: e,
                                child: TextWidget(
                                  text: e,
                                  fontColor: blackColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                )
                            )).toList(),
                            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                            borderRadius: BorderRadius.circular(10.r),
                            underline: Container(),
                            isExpanded: true,
                            value: electricityCubit.selectedTypeInstallation,
                            onChanged: (val){
                              electricityCubit.changeItemInstallation(val);
                            }
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      // UploadImageCard(
                      //   text: 'صورة إثبات ضخصية',
                      //   onTap: () {
                      //     electricityCubit.uploadImageId();
                      //   },
                      //   imagePath: "assets/images/upload_id.png",
                      //   image: electricityCubit.imageId,
                      // ),
                      // SizedBox(height: 20.h,),
                      // UploadImageCard(
                      //   text: 'صورة من عقد التمليك',
                      //   onTap: () {
                      //     electricityCubit.uploadImageContract();
                      //   },
                      //   imagePath: "assets/images/contract.png",
                      //   image: electricityCubit.imageContract,
                      // ),
                      // SizedBox(height: 20.h,),
                      // UploadImageCard(
                      //   text: 'ايصال مرفق باسم العميل',
                      //   onTap: () {
                      //     electricityCubit.uploadImageReceipt();
                      //   },
                      //   imagePath: "assets/images/bill.png",
                      //   image: electricityCubit.imageReceipt,
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