class ElectricityInstallationEntity {
  late final String customerName;
  late final String customerAddress;
  late final String customerMobile;
  late final String homeType;
  late final String idImageUrl;
  late final String contractImageUrl;
  late final String receiptImageUrl;
  ElectricityInstallationEntity({
    required this.customerName,
    required this.customerAddress,
    required this.customerMobile,
    required this.homeType,
    required this.idImageUrl,
    required this.contractImageUrl,
    required this.receiptImageUrl
  });

  ElectricityInstallationEntity.fromJson(json){
    customerName = json['customerName'];
    customerAddress = json['customerAddress'];
    customerMobile = json['customerMobile'];
    homeType = json['homeType'];
    idImageUrl = json['idImage'];
    contractImageUrl = json['imageContract'];
    receiptImageUrl = json['imageReceipt'];
  }

}