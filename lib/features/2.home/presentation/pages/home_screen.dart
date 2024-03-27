import 'package:e_services/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/home_component.dart';
import '../../../3.water/presentation/pages/water_screen.dart';
import '../../../4.gas/presentation/pages/gas_screen.dart';
import '../../../5.electricity/presentation/pages/electricity_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHome = true;

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
                    text: 'المياه',
                    fontColor: blackColor,
                    fontWeight: FontWeight.w700,
                    subTitle: 'يمكنك متابعة عدادك من خلالنا',
                    fontSizeSubTitle: 12.sp,
                    fontWeightSubTitle: FontWeight.w400,
                    fontColorSubTitle: textGreyColor,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const WaterScreen()));
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
                    text: 'الغاز',
                    fontSize: 18.sp,
                    fontColor: blackColor,
                    fontWeight: FontWeight.w700,
                    subTitle: 'يمكنك متابعة عدادك من خلالنا',
                    fontSizeSubTitle: 12.sp,
                    fontWeightSubTitle: FontWeight.w400,
                    fontColorSubTitle: textGreyColor,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const GasScreen()));
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
                    text: 'الكهرباء',
                    fontSize: 18.sp,
                    fontColor: blackColor,
                    fontWeight: FontWeight.w700,
                    subTitle: 'يمكنك متابعة عدادك من خلالنا',
                    fontSizeSubTitle: 12.sp,
                    fontWeightSubTitle: FontWeight.w400,
                    fontColorSubTitle: textGreyColor,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ElectricityScreen()));
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


