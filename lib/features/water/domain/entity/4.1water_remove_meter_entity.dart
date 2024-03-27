class WaterRemoveMeterEntity {
  late final String customerName;
  late final String customerAddress;
  late final String customerMobile;
  late final String nowReading;
  late final String meterNumber;
  late final String reason;

  WaterRemoveMeterEntity({
    required this.customerName,
    required this.customerAddress,
    required this.customerMobile,
    required this.nowReading,
    required this.meterNumber,
    required this.reason
  });

  WaterRemoveMeterEntity.fromJson(json){
    customerName = json['customerName'];
    customerAddress = json['customerAddress'];
    customerMobile = json['customerMobile'];
    nowReading = json['nowReadingMeter'];
    meterNumber = json['meterNumber'];
    reason = json['reason'];
  }
}