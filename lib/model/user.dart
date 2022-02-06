import '../utils.dart';

class UserField {
  static final String lastMessageTime = 'lastMessageTime';
}

class User {
  final String? uid;
  final String name;
  final String url;
  final DateTime lastMessageTime;

  const User({
    this.uid,
    required this.name,
    required this.url,
    required this.lastMessageTime,
  });

  User copyWith({
    String? idUser,
    String? name,
    String? urlAvatar,
    String? lastMessageTime,
  }) =>
      User(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        url: url ?? this.url,
        lastMessageTime: this.lastMessageTime,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        uid: json['uid'],
        name: json['name'],
        url: json['url'],
        lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'url': url,
        'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime),
      };
}
