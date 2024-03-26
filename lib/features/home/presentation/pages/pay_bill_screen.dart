import 'package:e_services/core/utils/colors.dart';
import 'package:e_services/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_horizontal_divider.dart';

class PayBillScreen extends StatelessWidget {
  const PayBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding:  EdgeInsetsDirectional.only(
            top: MediaQuery.of(context).size.height *0.05,
            start:  MediaQuery.of(context).size.width *0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
            text: 'Pay Bill',
          fontColor: blueColor,
          fontSize: 35,
              fontWeight: FontWeight.bold,
        ),
            SizedBox(height:  MediaQuery.of(context).size.height *0.025,),
            Stack(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.width *0.02),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:  MediaQuery.of(context).size.width *0.04,
                        vertical:  MediaQuery.of(context).size.height *0.015),
                    height:  MediaQuery.of(context).size.height *0.65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        payWidget(text: 'ق سابقة'),
                        payWidget(text: 'ق حالية'),
                        payWidget(text: 'متوسط'),
                        payWidget(text: 'ك استهلاك'),
                        payWidget(text: 'قيمة استهلاك'),
                        payWidget(text: 'صرف'),
                        payWidget(text: 'خصومات'),
                        payWidget(text: 'منطقة'),
                        payWidget(text: 'إجمالى الفاتورة'),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:  MediaQuery.of(context).size.height *0.12,
                    ),
                    Container(
                      width:  MediaQuery.of(context).size.width *0.06,
                      height:  MediaQuery.of(context).size.height *0.06,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        // gradient: LinearGradient(
                        //     colors: [Colors.white, constantColor]),
                      ),
                    ),
                    SizedBox(
                      height:  MediaQuery.of(context).size.height *0.268,
                    ),
                    Container(
                      width:  MediaQuery.of(context).size.width * 0.06,
                      height:  MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        // gradient: LinearGradient(
                        //     colors: [Colors.white, constantColor]),
                      ),
                    ),

                  ],
                ),
              ],
            ),
            SizedBox(height:  MediaQuery.of(context).size.height *0.02,),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 250,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(

                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(blueColor)),
                    onPressed: (){},
                    child: Text('ادفع الان',style: TextStyle(
                        fontSize: 30
                    ),)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class payWidget extends StatelessWidget {
  payWidget({
    super.key,
    required this.text
  });
String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: text,
          fontColor: blueColor,
          fontSize: 20,
        ),
        TextWidget(
          text: '1990',
          fontColor: textGreyColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 4,),
        CustomHorizontalDivider(
          width: double.infinity,
        ),
      ],
    );
  }
}
