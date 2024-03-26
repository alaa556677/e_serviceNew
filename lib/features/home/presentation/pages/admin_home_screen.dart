import 'package:e_services/admin_features/admin_electicity/pages/admin_electricity_screen.dart';
import 'package:e_services/admin_features/admin_gas/pages/admin_gas_screen.dart';
import 'package:e_services/admin_features/admin_water/presentation/pages/admin_water_screen.dart';
import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/home_component.dart';
import 'package:e_services/features/electricity/presentation/pages/electricity_screen.dart';
import 'package:e_services/features/gas/presentation/pages/gas_screen.dart';
import 'package:e_services/features/water/presentation/pages/water_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  bool isAdminHome = true;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding:  const EdgeInsetsDirectional.only(top: 56),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .65,
                  alignment: Alignment.center,
                  padding: EdgeInsetsDirectional.only(
                    top: MediaQuery.of(context).size.height * (50 / 932),
                    bottom: MediaQuery.of(context).size.height * (50 / 932),
                    start: MediaQuery.of(context).size.width * (25 / 430),
                    end: MediaQuery.of(context).size.width * (25 / 430),
                  ),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: blackColor.withOpacity(.2),
                            offset: const Offset(0, 0),
                            blurRadius: 14)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeComponent(
                        text: 'خدمات المياه',
                        fontColor: blackColor,
                        fontWeight: FontWeight.w700,
                        subTitle: 'يمكنك إدارة خدمات المياه',
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w400,
                        fontColorSubTitle: textGreyColor,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminWaterScreen()));
                        },
                        fontSize: 18.sp,
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/water.jpg',
                        imageWidth: 60.w,
                        imageHeight: 60.h,
                      ),
                      SizedBox(height: 20.h,),
                      HomeComponent(
                        text: 'خدمات الغاز',
                        fontSize: 18.sp,
                        fontColor: blackColor,
                        fontWeight: FontWeight.w700,
                        subTitle: 'يمكنك إدارة خدمات الغاز',
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w400,
                        fontColorSubTitle: textGreyColor,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminGasScreen()));
                        },
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/gas.png',
                        imageWidth: 60.w,
                        imageHeight: 60.h,
                      ),
                      SizedBox(height: 20.h,),
                      HomeComponent(
                        text: 'خدمات الكهرباء',
                        fontSize: 18.sp,
                        fontColor: blackColor,
                        fontWeight: FontWeight.w700,
                        subTitle: 'يمكنك إدارة خدمات الكهرباء',
                        fontSizeSubTitle: 12.sp,
                        fontWeightSubTitle: FontWeight.w400,
                        fontColorSubTitle: textGreyColor,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminElectricityScreen()));
                        },
                        widthContainer: MediaQuery.of(context).size.width,
                        colorContainer: whiteColor,
                        isSvg: false,
                        pathImage: 'assets/images/electricity.png',
                        imageWidth: 60.w,
                        imageHeight: 60.h,

                      ),
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}
