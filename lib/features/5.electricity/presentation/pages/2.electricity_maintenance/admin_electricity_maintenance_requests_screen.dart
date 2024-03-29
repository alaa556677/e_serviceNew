import 'package:e_services/features/5.electricity/presentation/cubit/electricity_cubit.dart';
import 'package:e_services/features/5.electricity/presentation/pages/2.electricity_maintenance/admin_electricity_maintenance_screen.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/entity/2.1electricity_maintenance_entity.dart';
import '../../cubit/electricity_states.dart';

class AdminElectricityMaintenanceRequestScreen extends StatefulWidget {
  const AdminElectricityMaintenanceRequestScreen({super.key});
  @override
  State<AdminElectricityMaintenanceRequestScreen> createState() => _AdminElectricityMaintenanceRequestScreenState();
}

class _AdminElectricityMaintenanceRequestScreenState extends State<AdminElectricityMaintenanceRequestScreen> {
  late ElectricityCubit electricityCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElectricityCubit()..getElectricityMaintenance(),
      child: BlocConsumer<ElectricityCubit, ElectricityStates>(
        listener: (context, state) {},
        builder: (context, state) {
          electricityCubit = ElectricityCubit.get(context);
          return DefaultScreen(
                  body: Column(
                    children: [
                      SizedBox(height: 20.h,),
                      state is !GetElectricityMaintenanceListLoading ?
                      Expanded(
                        child: ListView.builder(
                            itemCount: electricityCubit.electricityMaintenanceRequestList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context,int index)=> InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminElectricityMaintenanceScreen(
                                    electricityMaintenanceEntity: electricityCubit.electricityMaintenanceRequestList[index],
                                  )));
                                },
                                child: CardRequestWaterMaintenance(electricityMaintenanceEntity: electricityCubit.electricityMaintenanceRequestList[index],))
                        ),
                      ) : const Center(child: CircularProgressIndicator(),),
                    ],
                  ));
        },
      ),
    );
  }
}

class CardRequestWaterMaintenance extends StatelessWidget{
  final ElectricityMaintenanceEntity electricityMaintenanceEntity;
  const CardRequestWaterMaintenance({super.key, required this.electricityMaintenanceEntity});
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
                    text: electricityMaintenanceEntity.customerName,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.black,
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 2.h,),
                  TextWidget (
                    text: electricityMaintenanceEntity.customerAddress,
                    fontWeight: FontWeight.w400,
                    fontColor: textGreyColor,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
            TextWidget(
              text: electricityMaintenanceEntity.homeType,
              fontWeight: FontWeight.w600,
              fontColor: textGreyColor,
              fontSize: 14.sp,
            ),
          ],
        )
    );
  }
}
