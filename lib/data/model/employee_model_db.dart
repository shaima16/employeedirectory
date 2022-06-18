class EmployeeModelDb {
  EmployeeModelDb({
    this.id,
    this.name,
    this.username,
    this.email,
    this.profileImage,
    this.phone,
    this.website,
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.companyName,
  });

  int? id;
  String? name;
  String? profileImage;
  String? companyName;
  String? username;
  String? email;
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  String? phone;
  String? website;
}
