import 'package:e_services/admin_features/admin_water/presentation/cubit/admin_water_cubit.dart';
import 'package:e_services/admin_features/admin_water/presentation/pages/admin_water_installation_requests_screen.dart';
import 'package:e_services/admin_features/admin_water/presentation/pages/admin_water_maintenance_requests_screen.dart';
import 'package:e_services/admin_features/admin_water/presentation/pages/admin_water_meter_readin_requests_screen.dart';
import 'package:e_services/admin_features/admin_water/presentation/pages/admin_water_remove_meter_requests_screen.dart';
import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/card_basic_item.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:e_services/features/water/presentation/pages/water_installation_screen.dart';
import 'package:e_services/features/water/presentation/pages/water_maintenance_screen.dart';
import 'package:e_services/features/water/presentation/pages/water_remove_meter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AdminWaterScreen extends StatelessWidget {
  const AdminWaterScreen({super.key});
  Future pickCameraImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminWaterCubit(),
      child: BlocConsumer<AdminWaterCubit, AdminWaterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultScreen(
            body: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardBasicItem(
                        title: 'طلبات التعاقد عداد مياه',
                        subTitle: 'طلبات التعاقدات لتركيب عدادات جديدة',

                        //subTitle: 'يمكنك تقديم طلب لتركيب عداد جديد بدون الحاجة للذهاب الى الشركة',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminWaterInstallationRequestsScreen()));
                        },
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/installation.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                      SizedBox(height: 20.h,),
                      CardBasicItem(
                        title: 'طلبات التعديل والصيانة',
                        subTitle: 'طلبات تعديلات وصيانة العدادات التي سبق التقديم عليها',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminWaterMaintenanceRequestsScreen()));
                        },
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/maintenance.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                      SizedBox(height: 20.h,),
                      CardBasicItem(
                        title: 'قراءة عداد المياه',
                        subTitle: 'القراءات المرسلة من جهة المستهلك',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminWaterMeterReadingRequestScreen()));
                        },
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/gas_meter.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
                      ),
                  SizedBox(height: 20.h,),
                      CardBasicItem(
                        title: 'طلبات رفع عداد المياه',
                        subTitle: 'طلبات رفع العدادات التي سبق تركيبها',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminWaterRemoveMeterRequestsScreen()));
                        },
                        fontSizeTitle: 18.sp,
                        fontWeightTitle: FontWeight.w600,
                        fontColorSubTitle: textGreyColor,
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w300,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/request_remove.png',
                        imageWidth: 60,
                        imageHeight: 60,
                        fontColorTitle: blackColor,
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
