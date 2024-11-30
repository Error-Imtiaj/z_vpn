class VpnStatus {
  String? byteIn;
  String? byteOut;
  String? durationTime;
  String? lastPacketReceive;

  VpnStatus({
    this.byteIn,
    this.byteOut,
    this.durationTime,
    this.lastPacketReceive,
  });

  factory VpnStatus.fromJson(Map<String, dynamic> jsonData) {
    return VpnStatus(
      byteIn: jsonData['byteIn'],
      byteOut: jsonData['byteOut'],
      durationTime: jsonData['durationTime'],
      lastPacketReceive: jsonData['lastPacketReceive'],
    );
  }

  Map<String, dynamic> toJson() {
    return{
      'byteIn': byteIn,
      'byteOut': byteOut,
      'durationTime': durationTime,
      'lastPacketReceive': lastPacketReceive,
    };
  }
}
