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
import '../../cubit/gas_cubit.dart';
import '../../cubit/gas_states.dart';

class GasMaintenanceScreen extends StatefulWidget {
  GasMaintenanceScreen({super.key,});
  @override
  State<GasMaintenanceScreen> createState() => _GasMaintenanceScreenState();
}

class _GasMaintenanceScreenState extends State<GasMaintenanceScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  var formKey = GlobalKey <FormState> ();
  late GasCubit gasCubit;

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
      create: (context) => GasCubit(),
      child: BlocConsumer<GasCubit, GasStates>(
        listener: (context, state) {
          if(state is SendMaintenanceRequestSuccess){
            nameController.clear();
            addressController.clear();
            mobileController.clear();
            detailController.clear();
            gasCubit.imageReceiptMaintenanceUrl = null;
            defaultSnackBar(
                context: context,
                color: Colors.green,
                text: 'Successfully'
            );
          }
        },
        builder: (context, state) {
          gasCubit = GasCubit.get(context);
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
                              text: 'تعديل وصيانة عداد الغاز',
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
                              value: gasCubit.selectedTypeInstallation,
                              onChanged: (val){
                                gasCubit.changeItemInstallation(val);
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
                              gasCubit.uploadImageReceiptMaintenance();
                            },
                            imagePath: "assets/images/bill.png",
                            image: gasCubit.imageReceiptMaintenanceUrl,
                            imageWidget: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('${gasCubit.imageReceiptMaintenanceUrl}'),
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
                            if(formKey.currentState!.validate() && gasCubit.imageReceiptMaintenanceUrl != null){
                              gasCubit.sendMaintenanceRequest(
                                  customerName: nameController.text,
                                  customerAddress: addressController.text,
                                  customerMobile: mobileController.text,
                                  homeType: gasCubit.selectedTypeInstallation,
                                  details: detailController.text,
                                  imageReceiptMaintenance: gasCubit.imageReceiptMaintenanceUrl
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