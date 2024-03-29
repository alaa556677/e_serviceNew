import 'package:e_services/features/5.electricity/presentation/cubit/electricity_cubit.dart';
import 'package:e_services/features/5.electricity/presentation/pages/3.electricity_meter_reading/admin_electricity_meter_readin_screen.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/entity/3.1electricity_meter_reading_entity.dart';
import '../../cubit/electricity_states.dart';

class AdminElectricityMeterReadingRequestScreen extends StatefulWidget {
  const AdminElectricityMeterReadingRequestScreen({super.key});
  @override
  State<AdminElectricityMeterReadingRequestScreen> createState() => _AdminElectricityMeterReadingRequestScreenState();
}

class _AdminElectricityMeterReadingRequestScreenState extends State<AdminElectricityMeterReadingRequestScreen> {
  late ElectricityCubit electricityCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElectricityCubit()..getElectricityMeterReading(),
      child: BlocConsumer<ElectricityCubit, ElectricityStates>(
        listener: (context, state) {},
        builder: (context, state) {
          electricityCubit = ElectricityCubit.get(context);
          return DefaultScreen(
                  body: Column(
                    children: [
                      SizedBox(height: 20.h,),
                      state is !GetElectricityMeterReadingLoading ?
                      Expanded(
                        child: ListView.builder(
                            itemCount: electricityCubit.electricityMeterReadingRequestList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context,int index)=> InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminElectricityMeterReadingScreen(
                                    electricityMeterReadingEntity: electricityCubit.electricityMeterReadingRequestList[index],
                                  )));
                                },
                                child: CardRequestWaterMaintenance(electricityMeterReadingEntity: electricityCubit.electricityMeterReadingRequestList[index],))
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
  final ElectricityMeterReadingEntity electricityMeterReadingEntity;
  const CardRequestWaterMaintenance({super.key, required this.electricityMeterReadingEntity});
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
                    text: electricityMeterReadingEntity.customerName,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.black,
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 2.h,),
                  TextWidget (
                    text: electricityMeterReadingEntity.customerAddress,
                    fontWeight: FontWeight.w400,
                    fontColor: textGreyColor,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
            TextWidget(
              text: electricityMeterReadingEntity.meterNumber,
              fontWeight: FontWeight.w600,
              fontColor: textGreyColor,
              fontSize: 14.sp,
            ),
          ],
        )
    );
  }
}
