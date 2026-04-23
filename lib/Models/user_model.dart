class UserModel {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final String phonenumber;
  final String address;
  final String image;

  UserModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phonenumber,
    required this.address, required this.image,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      lastname: map['lastname'] ?? '',
      email: map['email'] ?? '',
      phonenumber: map['phonenumber'] ?? '',
      address: map['address'] ?? '',
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'email': email,
      'phonenumber': phonenumber,
      'address': address,
      'image': image,
    };
  }
}