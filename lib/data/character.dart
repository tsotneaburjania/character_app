class Character {
  final String name;
  final String homeWorld;
  String homeWorldReal = "";
  Character({required this.name, required this.homeWorld});
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] as String,
      homeWorld: json['homeworld'] as String,
    );
  }
}