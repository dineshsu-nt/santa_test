class Child {
  final String name;
  final String country;
  late final bool isNice;

  Child({
    required this.name,
    required this.country,
    required this.isNice,
  });

  Child copyWith({
    String? name,
    String? country,
    bool? isNice,
  }) {
    return Child(
      name: name ?? this.name,
      country: country ?? this.country,
      isNice: isNice ?? this.isNice,
    );
  }
}
