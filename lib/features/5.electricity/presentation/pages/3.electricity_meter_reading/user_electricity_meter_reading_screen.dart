import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
import '../../../../../core/widgets/upload_image_card.dart';
import '../../cubit/electricity_cubit.dart';
import '../../cubit/electricity_states.dart';

class ElectricityMeterReadingScreen extends StatefulWidget {
  const ElectricityMeterReadingScreen({super.key,});
  @override
  State<ElectricityMeterReadingScreen> createState() => _ElectricityMeterReadingScreenState();
}

class _ElectricityMeterReadingScreenState extends State<ElectricityMeterReadingScreen> {
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController meterReadingController = TextEditingController();
  TextEditingController nowReadingController = TextEditingController();
  TextEditingController previousTypeController = TextEditingController();
  var formKey = GlobalKey <FormState> ();
  late ElectricityCubit electricityCubit;

  @override
  void dispose() {
    customerNameController.dispose();
    customerAddressController.dispose();
    meterReadingController.dispose();
    nowReadingController.dispose();
    previousTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElectricityCubit(),
      child: BlocConsumer<ElectricityCubit, ElectricityStates>(
        listener: (context, state) {
          if(state is SendElectricityReadingSuccess){
            nowReadingController.clear();
            previousTypeController.clear();
            customerNameController.clear();
            customerAddressController.clear();
            meterReadingController.clear();
            electricityCubit.imageMeterReceiptUrl = null;
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
                              text: 'قراءة عداد الكهرباء',
                              fontColor: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 24.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h,),
                        LabelTextFormField(
                          hintText: "اسم العميل",
                          controller: customerNameController,
                          label: 'اسم العميل',
                        ),
                        SizedBox(height: 10.h,),
                        LabelTextFormField(
                          hintText: "العنوان",
                          controller: customerAddressController,
                          label: 'العنوان',
                        ),
                        SizedBox(height: 10.h,),
                        LabelTextFormField(
                          hintText: "رقم العداد",
                          controller: meterReadingController,
                          keyboardType: TextInputType.number,
                          label: 'رقم العداد',
                        ),
                        SizedBox(height: 10.h,),
                        LabelTextFormField(
                          hintText: "القراءة السابقة",
                          controller: nowReadingController,
                          keyboardType: TextInputType.number,
                          label: 'القراءة السابقة',
                        ),
                        SizedBox(height: 10.h,),
                        LabelTextFormField(
                          hintText: "القراءة الحالية",
                          controller: previousTypeController,
                          keyboardType: TextInputType.number,
                          label: 'القراءة الحالية',
                        ),
                        SizedBox(height: 10.h,),
                        ConditionalBuilder(
                          condition: state is !UploadImageMeterLoading,
                          builder: (context) =>  UploadImageCard(
                            text: 'صورة ايصال',
                            onTap: () {
                              electricityCubit.uploadImageMeterReceipt();
                            },
                            imagePath: "assets/images/bill.png",
                            image: electricityCubit.imageMeterReceiptUrl,
                            imageWidget: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('${electricityCubit.imageMeterReceiptUrl}'),
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
                            if(formKey.currentState!.validate() && electricityCubit.imageMeterReceiptUrl != null){
                              electricityCubit.sendGasMeterReading(
                                  customerName: customerNameController.text,
                                  customerAddress: customerAddressController.text,
                                  meterNumber: meterReadingController.text,
                                  previousReading: previousTypeController.text,
                                  nowReading: nowReadingController.text,
                                  imageMeterReceipt: electricityCubit.imageMeterReceiptUrl
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