class DataModel {
  int? likeCount;
  int? commentCount;
  String? profilePic;
  String? firstName;
  String? lastName;
  String? filePath;
  DataModel({
    required this.likeCount,
    required this.commentCount,
    required this.profilePic,
    required this.firstName,
    required this.lastName,
    required this.filePath,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
      profilePic: json['profilePic'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      filePath: json['filePath'],
    );
  }
}