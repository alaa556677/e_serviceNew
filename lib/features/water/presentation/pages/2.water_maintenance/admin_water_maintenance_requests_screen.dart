import 'package:e_services/features/water/presentation/pages/1.water_installation/admin_water_installation_screen.dart';
import 'package:e_services/features/water/presentation/pages/2.water_maintenance/admin_water_maintenance_screen.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:e_services/features/water/presentation/cubit/water_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/entity/2.1water_maintenance_entity.dart';
import '../../cubit/water_states.dart';

class AdminWaterMaintenanceRequestsScreen extends StatefulWidget {
  const AdminWaterMaintenanceRequestsScreen({super.key});
  @override
  State<AdminWaterMaintenanceRequestsScreen> createState() => _AdminWaterMaintenanceRequestsScreenState();
}

class _AdminWaterMaintenanceRequestsScreenState extends State<AdminWaterMaintenanceRequestsScreen> {
  late WaterCubit waterCubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WaterCubit, WaterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        waterCubit = WaterCubit.get(context);
        return DefaultScreen(
            body: Column(
              children: [
                SizedBox(height: 20.h,),
                Expanded(
                  child: ListView.builder(
                      itemCount: waterCubit.waterMaintenanceRequestList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context,int index)=> InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminWaterMaintenanceScreen(waterMaintenanceEntity: waterCubit.waterMaintenanceRequestList[index],)));
                          },
                          child: CardRequestWaterMaintenance(waterMaintenanceEntity: waterCubit.waterMaintenanceRequestList[index],))
                  ),
                ),
              ],
            ));
      },
    );
  }
}

class CardRequestWaterMaintenance extends StatelessWidget{
  final WaterMaintenanceEntity waterMaintenanceEntity;
  const CardRequestWaterMaintenance({super.key, required this.waterMaintenanceEntity});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.16),
                  blurRadius: 8,
                  offset: const Offset(0,0)
              )
            ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(backgroundImage: AssetImage('assets/images/profile_pic.jpg'),),
            SizedBox(width: 14.w,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget (
                    text: waterMaintenanceEntity.customerName,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.black,
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 2.h,),
                  TextWidget (
                    text: waterMaintenanceEntity.customerAddress,
                    fontWeight: FontWeight.w400,
                    fontColor: textGreyColor,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
            TextWidget(
              text: waterMaintenanceEntity.homeType,
              fontWeight: FontWeight.w600,
              fontColor: textGreyColor,
              fontSize: 14.sp,
            ),
          ],
        )
    );
  }
}
