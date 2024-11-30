class VpnInfo {
  String hostname;
  String ip;
  String ping;
  double speed;
  String countryLongName;
  String countryShortName;
  int vpnSessionNum;
  String base64OpenVpnConfiguration;

  VpnInfo({
    required this.hostname,
    required this.ip,
    required this.ping,
    required this.speed,
    required this.countryLongName,
    required this.countryShortName,
    required this.vpnSessionNum,
    required this.base64OpenVpnConfiguration,
  });

  // Factory constructor for JSON deserialization
  factory VpnInfo.fromJson(Map<String, dynamic> json) {
    return VpnInfo(
      hostname: json['HostName'] ?? "",
      ip: json['IP'] ?? "",
      ping: json['Ping'] ?? "",
      speed: (json['Speed'] as num?)?.toDouble() ?? 0.0,
      countryLongName: json['CountryLong'] ?? "",
      countryShortName: json['CountryShort'] ?? "",
      vpnSessionNum: json['NumVpnSessions'] ?? 0,
      base64OpenVpnConfiguration: json['OpenVPN_ConfigData_Base64'] ?? "",
    );
  }

  // Method for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'HostName': hostname,
      'IP': ip,
      'Ping': ping,
      'Speed': speed,
      'CountryLong': countryLongName,
      'CountryShort': countryShortName,
      'NumVpnSessions': vpnSessionNum,
      'OpenVPN_ConfigData_Base64': base64OpenVpnConfiguration,
    };
  }
}
