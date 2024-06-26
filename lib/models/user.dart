import 'dart:convert';

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? university;
  dynamic government;
  dynamic birthDate;
  dynamic academicYear;
  dynamic college;
  dynamic department;
  dynamic frontIdImage;
  dynamic backIdImage;
  dynamic collegeCardFrontImage;
  dynamic collegeCardBackImage;
  dynamic personalImage;
  dynamic nationalId;
  bool? isComplete;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.university,
    this.government,
    this.birthDate,
    this.academicYear,
    this.college,
    this.department,
    this.frontIdImage,
    this.backIdImage,
    this.collegeCardFrontImage,
    this.collegeCardBackImage,
    this.personalImage,
    this.nationalId,
    this.isComplete,
  });

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, university: $university, government: $government, birthDate: $birthDate, academicYear: $academicYear, college: $college, department: $department, frontIdImage: $frontIdImage, backIdImage: $backIdImage, collegeCardFrontImage: $collegeCardFrontImage, collegeCardBackImage: $collegeCardBackImage, personalImage: $personalImage, nationalId: $nationalId, isComplete: $isComplete,)';
  }

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        university: data['university'] as String?,
        government: data['government'] as dynamic,
        birthDate: data['birthDate'] as dynamic,
        academicYear: data['academicYear'] as dynamic,
        college: data['college'] as dynamic,
        department: data['department'] as dynamic,
        frontIdImage: data['frontIdImage'] as dynamic,
        backIdImage: data['backIdImage'] as dynamic,
        collegeCardFrontImage: data['collegeCardFrontImage'] as dynamic,
        collegeCardBackImage: data['collegeCardBackImage'] as dynamic,
        personalImage: data['personalImage'] as dynamic,
        nationalId: data['nationalId'] as dynamic,
        isComplete: data['isComplete'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'university': university,
        'government': government,
        'birthDate': birthDate,
        'academicYear': academicYear,
        'college': college,
        'department': department,
        'frontIdImage': frontIdImage,
        'backIdImage': backIdImage,
        'collegeCardFrontImage': collegeCardFrontImage,
        'collegeCardBackImage': collegeCardBackImage,
        'personalImage': personalImage,
        'nationalId': nationalId,
        'isComplete': isComplete,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());
}
