import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/upload_image_card.dart';
import 'package:e_services/features/water/presentation/cubit/water_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/button_custom_widget.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/default_screen.dart';
import '../../../../../core/widgets/label_Text_form_field.dart';
import '../../../../../core/widgets/snac_bar.dart';
import '../../cubit/water_states.dart';


class WaterInstallationScreen extends StatefulWidget {
  const WaterInstallationScreen({super.key,});
  @override
  State<WaterInstallationScreen> createState() => _WaterInstallationScreenState();
}

class _WaterInstallationScreenState extends State<WaterInstallationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  late WaterCubit waterCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WaterCubit(),
      child: BlocConsumer<WaterCubit, WaterStates>(
        listener: (context, state) {
          if(state is SendWaterInstallationSuccess){
            nameController.clear();
            addressController.clear();
            mobileController.clear();
            waterCubit.idImageUrl = null;
            waterCubit.imageContractUrl = null;
            waterCubit.imageReceiptUrl = null;
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
                            text: 'تعاقد عداد المياه',
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
                            value: waterCubit.selectedTypeInstallation,
                            onChanged: (val){
                              waterCubit.changeItemInstallation(val);

                            }
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      ConditionalBuilder(
                        condition: state is !UploadIDImageLoading,
                        builder: (context) => UploadImageCard(
                          text: 'صورة إثبات ضخصية',
                          onTap: () {
                            waterCubit.uploadImageId();
                          },
                          imagePath: "assets/images/upload_id.png",
                          image: waterCubit.idImageUrl,
                          imageWidget: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('${waterCubit.idImageUrl}'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        fallback: (context) => const Center(child: CircularProgressIndicator(),),
                      ),
                      SizedBox(height: 20.h,),
                      ConditionalBuilder(
                        condition: state is !UploadContractImageLoading,
                        builder: (context) =>  UploadImageCard(
                          text: 'صورة من عقد التمليك',
                          onTap: () {
                            waterCubit.uploadImageContract();
                          },
                          imagePath: "assets/images/contract.png",
                          image: waterCubit.imageContractUrl,
                          imageWidget: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('${waterCubit.imageContractUrl}'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        fallback: (context) => const Center(child: CircularProgressIndicator(),),
                      ),
                      SizedBox(height: 20.h,),
                      ConditionalBuilder(
                        condition: state is !UploadReceiptImageLoading,
                        builder: (context) =>  UploadImageCard(
                          text: 'ايصال مرفق باسم العميل',
                          onTap: () {
                            waterCubit.uploadImageReceipt();
                          },
                          imagePath: "assets/images/bill.png",
                          image: waterCubit.imageReceiptUrl,
                          imageWidget: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('${waterCubit.imageReceiptUrl}'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        fallback: (context) => const Center(child: CircularProgressIndicator(),),
                      ),
                      SizedBox(height: 20.h,),
                      ConditionalBuilder(
                        condition: state is !SendWaterInstallationLoading,
                        builder: (context) =>  ButtonCustomWidget(
                          buttonColor: blueColor,
                          text: "إرسال",
                          color: whiteColor,
                          buttonWidth:
                          MediaQuery.of(context).size.width,
                          buttonHeight: 48,
                          onPressed: (){
                            waterCubit.sendWaterInstallation(
                                customerName: nameController.text,
                                customerAddress: addressController.text,
                                customerMobile: mobileController.text,
                                homeType: waterCubit.selectedTypeInstallation,
                                idImage: waterCubit.idImageUrl,
                                imageContract: waterCubit.imageContractUrl,
                                imageReceipt: waterCubit.imageReceiptUrl
                            );
                          },
                        ),
                        fallback: (context) => const Center(child: CircularProgressIndicator(),),
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