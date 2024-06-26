import 'dart:convert';

class ToolModel {
  int? toolId;
  String? name;
  String? description;
  String? rentTime;
  String? college;
  String? university;
  int? price;
  dynamic department;
  List<dynamic>? photos;

  ToolModel({
    this.toolId,
    this.name,
    this.description,
    this.rentTime,
    this.college,
    this.university,
    this.price,
    this.department,
    this.photos,
  });

  factory ToolModel.fromMap(Map<String, dynamic> data) => ToolModel(
        toolId: data['toolId'] as int?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        rentTime: data['rentTime'] as String?,
        college: data['college'] as String?,
        university: data['university'] as String?,
        price: data['price'] as int?,
        department: data['department'] as dynamic,
        photos: data['photos'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'toolId': toolId,
        'name': name,
        'description': description,
        'rentTime': rentTime,
        'college': college,
        'university': university,
        'price': price,
        'department': department,
        'photos': photos,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ToolModel].
  factory ToolModel.fromJson(String data) {
    return ToolModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ToolModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
