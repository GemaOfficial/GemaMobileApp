class TokenModel {
  final String name;
  final String symbol;
  final String iconUrl;
  final String balance;
  final String fiatValue;

  TokenModel({
    required this.name,
    required this.symbol,
    required this.iconUrl,
    required this.balance,
    required this.fiatValue,
  });
}
