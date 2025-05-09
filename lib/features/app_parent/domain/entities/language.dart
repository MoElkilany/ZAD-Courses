class Language {
  final String code;
  final String name;

  Language({
    required this.code,
    required this.name,
  });
  @override
  String toString() {
    return 'Language(code: $code, name: $name)';
  }

  @override
  int get hashCode => code.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is! Language) return false;
    return hashCode == other.hashCode;
  }
}
