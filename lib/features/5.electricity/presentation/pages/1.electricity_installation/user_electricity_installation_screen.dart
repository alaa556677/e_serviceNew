import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:e_services/core/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/button_custom_widget.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/default_screen.dart';
import '../../../../../core/widgets/label_Text_form_field.dart';
import '../../../../../core/widgets/snac_bar.dart';
import '../../../../../core/widgets/upload_image_card.dart';
import '../../cubit/electricity_cubit.dart';
import '../../cubit/electricity_states.dart';


class ElectricityInstallationScreen extends StatefulWidget {
  ElectricityInstallationScreen({super.key,});
  @override
  State<ElectricityInstallationScreen> createState() => _ElectricityInstallationScreenState();
}

class _ElectricityInstallationScreenState extends State<ElectricityInstallationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  var formKey = GlobalKey <FormState> ();
  late ElectricityCubit electricityCubit;

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElectricityCubit(),
      child: BlocConsumer<ElectricityCubit, ElectricityStates>(
        listener: (context, state) {
          if(state is SendElectricityInstallationSuccess){
            nameController.clear();
            addressController.clear();
            mobileController.clear();
            electricityCubit.idImageUrl = null;
            electricityCubit.imageContractUl = null;
            electricityCubit.imageReceiptUrl = null;
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
                        ConditionalBuilder(
                          condition: state is !UploadIDImageLoading,
                          builder: (context) => UploadImageCard(
                            text: 'صورة إثبات ضخصية',
                            onTap: () {
                              electricityCubit.uploadImageId();
                            },
                            imagePath: "assets/images/upload_id.png",
                            image: electricityCubit.idImageUrl,
                            imageWidget: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('${electricityCubit.idImageUrl}'),
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
                          builder: (context) => UploadImageCard(
                            text: 'صورة عقد التمليك',
                            onTap: () {
                              electricityCubit.uploadImageContract();
                            },
                            imagePath: "assets/images/contract.png",
                            image: electricityCubit.imageContractUl,
                            imageWidget: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('${electricityCubit.imageContractUl}'),
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
                          builder: (context) => UploadImageCard(
                            text: 'ايصال مرفق باسم العميل',
                            onTap: () {
                              electricityCubit.uploadImageReceipt();
                            },
                            imagePath: "assets/images/bill.png",
                            image: electricityCubit.imageReceiptUrl,
                            imageWidget: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('${electricityCubit.imageReceiptUrl}'),
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
                            if(formKey.currentState!.validate() && electricityCubit.idImageUrl != null && electricityCubit.imageContractUl != null && electricityCubit.imageReceiptUrl != null){
                              electricityCubit.sendGasInstallation(
                                customerName: nameController.text,
                                customerAddress: addressController.text,
                                customerMobile: mobileController.text,
                                homeType: electricityCubit.selectedTypeInstallation,
                                idImage: electricityCubit.idImageUrl,
                                imageContract: electricityCubit.imageContractUl,
                                imageReceipt: electricityCubit.imageReceiptUrl,
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