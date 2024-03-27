class WaterMaintenanceEntity {
  late final String customerName;
  late final String customerAddress;
  late final String customerMobile;
  late final String homeType;
  late final String details;
  late final String receiptImageUrl;
  WaterMaintenanceEntity({
    required this.customerName,
    required this.customerAddress,
    required this.customerMobile,
    required this.homeType,
    required this.details,
    required this.receiptImageUrl
  });

  WaterMaintenanceEntity.fromJson(json){
    customerName = json['customerName'];
    customerAddress = json['customerAddress'];
    customerMobile = json['customerMobile'];
    homeType = json['homeType'];
    details = json['details'];
    receiptImageUrl = json['imageReceiptMaintenance'];
  }
}