import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/button_custom_widget.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../../../core/widgets/label_Text_form_field.dart';
import '../../../../../core/widgets/snac_bar.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_states.dart';

class UserComplaintRequestScreen extends StatefulWidget {
  const UserComplaintRequestScreen({super.key});

  @override
  State<UserComplaintRequestScreen> createState() =>
      _UserComplaintRequestScreenState();
}

class _UserComplaintRequestScreenState
    extends State<UserComplaintRequestScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  var formKey = GlobalKey <FormState>();
  late HomeCubit homeCubit;

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if(state is SendComplaintsSuccess){
            nameController.clear();
            mobileController.clear();
            detailController.clear();
            defaultSnackBar(
                context: context,
                color: Colors.green,
                text: 'Successfully'
            );
          }
        },
        builder: (context, state) {
          homeCubit = HomeCubit.get(context);
          return DefaultScreen(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 20.h),
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
                              text: 'طلب شكوي',
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
                          hintText: "اكتب رقم موبايل",
                          controller: mobileController,
                          label: 'رقم الموبايل',
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 10.h,),
                        LabelTextFormField(
                          hintText: "سبب الشكوي",
                          controller: detailController,
                          label: 'سبب الشكوي',
                          minLines: 6,
                          maxLines: 8,
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
                            if(formKey.currentState!.validate()){
                              homeCubit.sendComplaintsRequest(
                                  customerName: nameController.text,
                                  customerMobile: mobileController.text,
                                  reason: detailController.text
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
            )
          );
        },
      ),
    );
  }
}