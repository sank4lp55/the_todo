import 'package:hive/hive.dart';

class User {
  String? name;
  String? avatar;

  User({this.name="",this.avatar=""});

  // Convert a User object into a Map (for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatar': avatar,
    };
  }

  // Create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }
}

// Manually creating a Hive Adapter for User class
class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;  // Unique ID for the adapter, must be different for each model

  @override
  User read(BinaryReader reader) {
    return User(
      name: reader.readString(),
      avatar: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.name??"");
    writer.writeString(obj.avatar??"");
  }
}
