import 'package:e_services/features/4.gas/presentation/cubit/gas_cubit.dart';
import 'package:e_services/features/4.gas/presentation/pages/3.gas_meter_reading/admin_gas_meter_readin_screen.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/entity/3.1gas_meter_reading_entity.dart';
import '../../cubit/gas_states.dart';

class AdminGasMeterReadingRequestScreen extends StatefulWidget {
  const AdminGasMeterReadingRequestScreen({super.key});
  @override
  State<AdminGasMeterReadingRequestScreen> createState() => _AdminGasMeterReadingRequestScreenState();
}

class _AdminGasMeterReadingRequestScreenState extends State<AdminGasMeterReadingRequestScreen> {
  late GasCubit gasCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GasCubit()..getGasMeterReading(),
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
                            itemCount: gasCubit.gasMeterReadingRequestList.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context,int index)=> InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminGasMeterReadingScreen(gasMeterReadingEntity: gasCubit.gasMeterReadingRequestList[index],)));
                                },
                                child: CardRequestWaterMaintenance(gasMeterReadingEntity: gasCubit.gasMeterReadingRequestList[index],))
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
  final GasMeterReadingEntity gasMeterReadingEntity;
  const CardRequestWaterMaintenance({super.key, required this.gasMeterReadingEntity});
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
                    text: gasMeterReadingEntity.customerName,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.black,
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 2.h,),
                  TextWidget (
                    text: gasMeterReadingEntity.customerAddress,
                    fontWeight: FontWeight.w400,
                    fontColor: textGreyColor,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
            TextWidget(
              text: gasMeterReadingEntity.meterNumber,
              fontWeight: FontWeight.w600,
              fontColor: textGreyColor,
              fontSize: 14.sp,
            ),
          ],
        )
    );
  }
}