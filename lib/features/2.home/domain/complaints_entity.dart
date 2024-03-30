class ComplaintsEntity{
  late final String customerName;
  late final String customerMobile;
  late final String reason;
  ComplaintsEntity({
    required this.customerName,
    required this.customerMobile,
    required this.reason
  });
  ComplaintsEntity.fromJson(json){
    customerName = json['customerName'];
    customerMobile = json['customerMobile'];
    reason = json['reason'];
  }
}