import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/card_basic_item.dart';
import '1.water_installation/user_water_installation_screen.dart';
import '2.water_maintenance/user_water_maintenance_screen.dart';
import '3.water_meter_reading/user_water_meter_reading_screen.dart';
import '4.water_remove_meter/user_water_remove_meter_screen.dart';

class WaterScreen extends StatelessWidget{
  const WaterScreen({super.key});
  Future pickCameraImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardBasicItem(
                  title: 'تعاقد عداد مياه',
                  subTitle: 'يمكنك تقديم طلب لتركيب عداد جديد بدون الحاجة للذهاب الى الشركة',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  WaterInstallationScreen()));
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
                  title: 'تعديل وصيانة عداد المياه',
                  subTitle: 'يمكنك تقديم طلب للتعديل او لصيانة العداد من خلال البرنامج وسيتم التواصل معك للمتابعة',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  WaterMaintenanceScreen()));
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
                  subTitle: 'يمكنك تصوير العداد لرفع القراءة بدون الحاجة لحضور المحصل',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  WaterMeterReadingScreen()));
                  },
                  fontSizeTitle: 18.sp,
                  fontWeightTitle: FontWeight.w600,
                  fontColorSubTitle: textGreyColor,
                  fontSizeSubTitle: 12.sp,
                  fontWeightSubTitle: FontWeight.w300,
                  widthContainer: MediaQuery.of(context).size.width,
                  colorContainer: whiteColor,
                  isSvg: false,
                  pathImage: 'assets/images/water_meter.png',
                  imageWidth: 60,
                  imageHeight: 60,
                  fontColorTitle: blackColor,
                ),
                SizedBox(height: 20.h,),
                CardBasicItem(
                  title: 'رفع عداد المياه',
                  subTitle: 'يمكنك تقديم طلب لرفع العداد بدود الحضور الى مقر الشركة',
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  WaterRemoveMeterScreen()));
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
  }
}