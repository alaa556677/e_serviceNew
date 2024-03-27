class GasMeterReadingEntity {
  late final String customerName;
  late final String customerAddress;
  late final String nowReading;
  late final String previousReading;
  late final String meterNumber;
  late final String imageReceipt;

  GasMeterReadingEntity({
    required this.customerName,
    required this.customerAddress,
    required this.nowReading,
    required this.previousReading,
    required this.meterNumber,
    required this.imageReceipt
  });

  GasMeterReadingEntity.fromJson(json){
    customerName = json['customerName'];
    customerAddress = json['customerAddress'];
    meterNumber = json['meterNumber'];
    previousReading = json['previousReading'];
    nowReading = json['nowReading'];
    imageReceipt = json['imageMeterReceipt'];
  }
}