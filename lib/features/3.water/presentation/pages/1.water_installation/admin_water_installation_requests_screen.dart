import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/entity/1.1water_installation_entity.dart';
import '../../cubit/water_cubit.dart';
import '../../cubit/water_states.dart';
import 'admin_water_installation_screen.dart';

class AdminWaterInstallationRequestsScreen extends StatefulWidget {
  const AdminWaterInstallationRequestsScreen({super.key});
  @override
  State<AdminWaterInstallationRequestsScreen> createState() => _AdminWaterInstallationRequestsScreenState();
}

class _AdminWaterInstallationRequestsScreenState extends State<AdminWaterInstallationRequestsScreen> {
  late WaterCubit waterCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WaterCubit()..getWaterInstallation(),
      child: BlocConsumer<WaterCubit, WaterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            waterCubit = WaterCubit.get(context);
            return DefaultScreen(
              body: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Expanded(
                    child: ListView.builder(
                      itemCount: waterCubit.waterInstallationRequestList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index)=> InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminWaterInstallationScreen(waterInstallationEntity: waterCubit.waterInstallationRequestList[index],)));
                        },
                        child: CardRequestWaterInstallation(waterInstallationEntity: waterCubit.waterInstallationRequestList[index],))
                    ),
                  ),
                ],
              )
            );
          },
        ),
    );
  }
}

class CardRequestWaterInstallation extends StatelessWidget{
  final WaterInstallationEntity waterInstallationEntity;
  const CardRequestWaterInstallation({super.key, required this.waterInstallationEntity});
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
                  text: waterInstallationEntity.customerName,
                  fontWeight: FontWeight.bold,
                  fontColor: Colors.black,
                  fontSize: 18.sp,
                ),
                SizedBox(height: 2.h,),
                TextWidget (
                  text: waterInstallationEntity.customerAddress,
                  fontWeight: FontWeight.w400,
                  fontColor: textGreyColor,
                  fontSize: 12.sp,
                ),
              ],
            ),
          ),
          TextWidget(
            text: waterInstallationEntity.homeType,
            fontWeight: FontWeight.w600,
            fontColor: textGreyColor,
            fontSize: 14.sp,
          ),
        ],
      )
    );
  }
}

