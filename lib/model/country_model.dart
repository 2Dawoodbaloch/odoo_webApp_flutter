class CountryModel {
  const CountryModel({
    required this.name,
    required this.isoCode,
    required this.dialCode,
    required this.flagEmoji,
  });

  final String name;       // "Pakistan"
  final String isoCode;    // "PK"
  final String dialCode;   // "+92"
  final String flagEmoji;  // "🇵🇰"

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] as String,
      isoCode: json['isoCode'] as String,
      dialCode: json['dialCode'] as String,
      flagEmoji: json['flagEmoji'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'isoCode': isoCode,
        'dialCode': dialCode,
        'flagEmoji': flagEmoji,
      };

  // ✅ needed for correct selection/comparison in dropdowns
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is CountryModel && other.isoCode == isoCode);

  @override
  int get hashCode => isoCode.hashCode;

  @override
  String toString() => name;
}