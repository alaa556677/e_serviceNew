import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/entity/3.1water_meter_reading_entity.dart';
import '../../cubit/water_cubit.dart';
import '../../cubit/water_states.dart';
import 'admin_water_meter_readin_screen.dart';

class AdminWaterMeterReadingRequestScreen extends StatefulWidget {
  const AdminWaterMeterReadingRequestScreen({super.key});
  @override
  State<AdminWaterMeterReadingRequestScreen> createState() => _AdminWaterMeterReadingRequestScreenState();
}

class _AdminWaterMeterReadingRequestScreenState extends State<AdminWaterMeterReadingRequestScreen> {
  late WaterCubit waterCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WaterCubit()..getWaterMeterReading(),
      child: BlocConsumer<WaterCubit, WaterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            waterCubit = WaterCubit.get(context);
            return DefaultScreen(
                body: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    state is !GetWaterMeterReadingLoading?
                    Expanded(
                      child: ListView.builder(
                          itemCount: waterCubit.waterMeterReadingRequestList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context,int index)=> InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminWaterMeterReadingScreen(waterMeterReadingEntity: waterCubit.waterMeterReadingRequestList[index],)));
                              },
                              child: CardRequestWaterMaintenance(waterMeterReadingEntity: waterCubit.waterMeterReadingRequestList[index],))
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
  final WaterMeterReadingEntity waterMeterReadingEntity;
  const CardRequestWaterMaintenance({super.key, required this.waterMeterReadingEntity});
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
                    text: waterMeterReadingEntity.customerName,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.black,
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 2.h,),
                  TextWidget (
                    text: waterMeterReadingEntity.customerAddress,
                    fontWeight: FontWeight.w400,
                    fontColor: textGreyColor,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
            TextWidget(
              text: waterMeterReadingEntity.meterNumber,
              fontWeight: FontWeight.w600,
              fontColor: textGreyColor,
              fontSize: 14.sp,
            ),
          ],
        )
    );
  }
}

