import 'package:e_services/admin_features/admin_water/presentation/pages/admin_water_installation_screen.dart';
import 'package:e_services/core/widgets/default_screen.dart';
import 'package:flutter/material.dart';

class AdminElectricityInstallationRequestScreen extends StatelessWidget {
  const AdminElectricityInstallationRequestScreen({super.key});
  static List<String> names=['علاء بكر','علاء بكر','علاء بكر','علاء بكر','علاء بكر','علاء بكر','علاء بكر','علاء بكر','علاء بكر','علاء بكر',];
  static List<String> propertyType =['شقة','مسجد','فيلا','محل','شقة','مسجد','فيلا','محل','فيلا','محل',];

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
        body: ListView.builder(

            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context,int index)=>Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
                  ),
                  title: Text(names[index],style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),),
                  subtitle: Text(propertyType[index],style: TextStyle(color: Colors.grey),),
                  trailing: Text("نوع الخدمة: عداد جديد"),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  AdminWaterInstallationScreen()));
                  },

                ),
              ),
            )
        ));
  }
}
