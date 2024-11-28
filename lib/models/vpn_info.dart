class VpnInfo {
  final String hostname;
  final String id;
  final String ping;
  final double speed;
  final String countryLongName;
  final String countryShortName;
  final int vpnSessionNum;
  final String base64OpenVpnConfiguration;

  VpnInfo({
    required this.hostname,
    required this.id,
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
      hostname: json['hostname'] as String,
      id: json['id'] as String,
      ping: json['ping'] as String,
      speed: (json['speed'] as num).toDouble(),
      countryLongName: json['country_long'] as String,
      countryShortName: json['country_short'] as String,
      vpnSessionNum: json['vpn_session_num'] as int,
      base64OpenVpnConfiguration: json['openvpn_config'] as String,
    );
  }

  Future<Map<dynamic, dynamic>> toJson() async {
    return {
      'hostname': hostname,
      'id': id,
      'ping': ping,
      'speed': speed,
      'country_long': countryLongName,
      'country_short': countryShortName,
      'vpn_session_num': vpnSessionNum,
      'openvpn_config': base64OpenVpnConfiguration,
    };
  }
}
