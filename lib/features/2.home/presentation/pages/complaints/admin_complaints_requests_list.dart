import 'package:e_services/core/widgets/default_screen.dart';
import 'package:e_services/features/2.home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_text.dart';
import '../../../domain/complaints_entity.dart';
import '../../cubit/home_states.dart';
import 'admin_complaints_screen.dart';

class AdminComplaintsRequestsScreen extends StatefulWidget {
  const AdminComplaintsRequestsScreen({super.key});
  @override
  State<AdminComplaintsRequestsScreen> createState() => _AdminComplaintsRequestsScreenState();
}

class _AdminComplaintsRequestsScreenState extends State<AdminComplaintsRequestsScreen> {
  late HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getComplaintsList(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          homeCubit = HomeCubit.get(context);
          return Column(
            children: [
              SizedBox(height: 20.h,),
              state is !GetComplaintsListLoading ?
              Expanded(
                child: ListView.builder(
                    itemCount: homeCubit.complaintsRequestsList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context,int index)=> InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminComplaintsShowScreen(
                            complaintsEntity: homeCubit.complaintsRequestsList[index],
                          )));
                        },
                        child: CardRequest(complaintsEntity: homeCubit.complaintsRequestsList[index],))
                ),
              ) : const Center(child: CircularProgressIndicator(),),
            ],
          );
        },
      ),
    );
  }
}

class CardRequest extends StatelessWidget{
  final ComplaintsEntity complaintsEntity;
  const CardRequest({super.key, required this.complaintsEntity});

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
                    text: complaintsEntity.customerName,
                    fontWeight: FontWeight.bold,
                    fontColor: Colors.black,
                    fontSize: 18.sp,
                  ),
                  SizedBox(height: 2.h,),
                  TextWidget (
                    text: complaintsEntity.customerMobile,
                    fontWeight: FontWeight.w400,
                    fontColor: textGreyColor,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
