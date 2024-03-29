import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/upload_image_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/button_custom_widget.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/default_screen.dart';
import '../../../../../core/widgets/label_Text_form_field.dart';
import '../../../../../core/widgets/snac_bar.dart';
import '../../cubit/electricity_cubit.dart';
import '../../cubit/electricity_states.dart';

class ElectricityMaintenanceScreen extends StatefulWidget {
  ElectricityMaintenanceScreen({super.key,});
  @override
  State<ElectricityMaintenanceScreen> createState() => _ElectricityMaintenanceScreenState();
}

class _ElectricityMaintenanceScreenState extends State<ElectricityMaintenanceScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  var formKey = GlobalKey <FormState> ();
  late ElectricityCubit electricityCubit;

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    mobileController.dispose();
    detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElectricityCubit(),
      child: BlocConsumer<ElectricityCubit, ElectricityStates>(
        listener: (context, state) {
          if(state is SendMaintenanceRequestSuccess){
            nameController.clear();
            addressController.clear();
            mobileController.clear();
            detailController.clear();
            electricityCubit.imageReceiptMaintenanceUrl = null;
            defaultSnackBar(
                context: context,
                color: Colors.green,
                text: 'Successfully'
            );
          }
        },
        builder: (context, state) {
          electricityCubit = ElectricityCubit.get(context);
          return DefaultScreen(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 20.w, vertical: 20.h),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: 'تعديل وصيانة عداد الكهرباء',
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
                              value: electricityCubit.selectedTypeInstallation,
                              onChanged: (val){
                                electricityCubit.changeItemInstallation(val);
                              }
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        LabelTextFormField(
                          hintText: "الوصف",
                          controller: detailController,
                          label: 'وصف الحالة',
                        ),
                        SizedBox(height: 10.h,),
                        ConditionalBuilder(
                          condition: state is !UploadMaintenanceReceiptImageLoading,
                          builder: (context) => UploadImageCard(
                            text: 'ايصال مرفق باسم العميل',
                            onTap: () {
                              electricityCubit.uploadImageReceiptMaintenance();
                            },
                            imagePath: "assets/images/bill.png",
                            image: electricityCubit.imageReceiptMaintenanceUrl,
                            imageWidget: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('${electricityCubit.imageReceiptMaintenanceUrl}'),
                                      fit: BoxFit.cover
                                  )
                              ),
                            ),
                          ),
                          fallback: (context) => const Center(child: CircularProgressIndicator(),),
                        ),
                        SizedBox(height: 20.h,),
                        ButtonCustomWidget(
                          buttonColor: blueColor,
                          text: "إرسال",
                          color: whiteColor,
                          buttonWidth:
                          MediaQuery.of(context).size.width,
                          buttonHeight: 48,
                          onPressed: (){
                            if(formKey.currentState!.validate() && electricityCubit.imageReceiptMaintenanceUrl != null){
                              electricityCubit.sendMaintenanceRequest(
                                  customerName: nameController.text,
                                  customerAddress: addressController.text,
                                  customerMobile: mobileController.text,
                                  homeType: electricityCubit.selectedTypeInstallation,
                                  details: detailController.text,
                                  imageReceiptMaintenance: electricityCubit.imageReceiptMaintenanceUrl
                              );
                            }else{
                              defaultSnackBar(
                                  context: context,
                                  color: Colors.red,
                                  text: 'من فضلك تأكد من ارسال كل المعلومات المطلوبة والصور المطلوبة'
                              );
                            }
                          },
                        ),
                      ],
                    ),
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