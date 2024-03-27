import 'package:e_services/features/4.gas/presentation/cubit/gas_cubit.dart';
import 'package:e_services/features/4.gas/presentation/pages/4.remove_gas_meter/admin_gas_remove_meter_screen.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/entity/4.1gas_remove_meter_entity.dart';
import '../../cubit/gas_states.dart';

class AdminGasRemoveMeterRequestScreen extends StatefulWidget {
  const AdminGasRemoveMeterRequestScreen({super.key});
  @override
  State<AdminGasRemoveMeterRequestScreen> createState() => _AdminGasRemoveMeterRequestScreenState();
}

class _AdminGasRemoveMeterRequestScreenState extends State<AdminGasRemoveMeterRequestScreen> {
  late GasCubit gasCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GasCubit()..getWaterRemoveMeter(),
      child: BlocConsumer<GasCubit, GasStates>(
        listener: (context, state) {},
        builder: (context, state) {
          gasCubit = GasCubit.get(context);
          return DefaultScreen(
                  body: Column(
                    children: [
                      SizedBox(height: 20.h,),
                      Expanded(
                        child: ListView.builder(
                            itemCount: gasCubit.gasRemoveMeterList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context,int index)=>InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminGasRemoveMeterScreen(gasRemoveMeterEntity: gasCubit.gasRemoveMeterList[index],)));
                                },
                                child: CardRequestWaterMaintenance(gasRemoveMeterEntity: gasCubit.gasRemoveMeterList[index],))
                        ),
                      ),
                    ],
                  ));
        },
      ),
    );
  }
}

class CardRequestWaterMaintenance extends StatelessWidget{
  final GasRemoveMeterEntity gasRemoveMeterEntity;
  const CardRequestWaterMaintenance({super.key, required this.gasRemoveMeterEntity});
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
                    text: gasRemoveMeterEntity.customerName,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.black,
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 2.h,),
                  TextWidget (
                    text: gasRemoveMeterEntity.customerAddress,
                    fontWeight: FontWeight.w400,
                    fontColor: textGreyColor,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
            TextWidget(
              text: gasRemoveMeterEntity.meterNumber,
              fontWeight: FontWeight.w600,
              fontColor: textGreyColor,
              fontSize: 14.sp,
            ),
          ],
        )
    );
  }
}
