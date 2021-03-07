class MemberInfo {
  final String image;
  final String firstName;
  final String lastName;
  final String phone;
  final String membership;
  final String gender;
  final String email;
  final String date;
  final String notes;

  MemberInfo({
    this.image,
    this.firstName,
    this.lastName,
    this.phone,
    this.membership,
    this.gender,
    this.email,
    this.date,
    this.notes,
  });
  factory MemberInfo.fromMap(Map<String, dynamic> data) {
    return MemberInfo(
      image: data['userImage'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      phone: data['phone'],
      membership: data['membership'],
      gender: data['gender'],
      email: data['email'],
      date: data['date'],
      notes: data['notes'],
    );
  }
}
