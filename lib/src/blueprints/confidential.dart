class Confidential {
  final String botToken;

  Confidential(this.botToken);

  static Confidential fromJson(dynamic data) {
    return Confidential(data['botToken'] as String);
  }
}
