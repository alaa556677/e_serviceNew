import 'package:e_services/admin_features/admin_gas/cubit/admin_gas_cubit.dart';
import 'package:e_services/admin_features/admin_gas/pages/admin_gas_meter_readin_requests_screen.dart';
import 'package:e_services/admin_features/admin_gas/pages/admin_gas_installation_requests_screen.dart';
import 'package:e_services/admin_features/admin_gas/pages/admin_gas_maintenance_requests_screen.dart';
import 'package:e_services/admin_features/admin_gas/pages/admin_gas_remove_meter_requests_screen.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/card_basic_item.dart';


class AdminGasScreen extends StatelessWidget {
  const AdminGasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminGasCubit(),
      child: BlocConsumer<AdminGasCubit, AdminGasState>(
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
                        title: 'طلبات التعاقد عداد الغاز',
                        subTitle: 'طلبات التعاقدات لتركيب عدادات جديدة',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminGasInstallationRequestScreen()));
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminGasMaintenanceRequestScreen()));
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
                        title: 'قراءة عداد الغاز',
                        subTitle: 'القراءات المرسلة من جهة المستهلك',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminGasMeterReadingRequestScreen()));
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
                        title: 'طلبات رفع عداد الغاز',
                        subTitle: 'طلبات رفع العدادات التي سبق تركيبها',
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminGasRemoveMeterRequestScreen()));
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
