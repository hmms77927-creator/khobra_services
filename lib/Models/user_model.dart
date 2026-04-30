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
required this.address,
required this.image,
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




class ProviderModel {
  final String id;
  final String person;
  final String person1;
  final String email;
  final String password;
  final String phonenumber;
  final String city;
  final String state;
  final String country;
  final String address;
  final String image;

  ProviderModel({
    required this.id,
    required this.person,
    required this.person1,
    required this.email,
    required this.password,
    required this.phonenumber,
    required this.city,
    required this.state,
    required this.country,
    required this.address,
    required this.image,
  });

  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    return ProviderModel(
      id: map['id'] ?? '',
      person: map['person'] ?? '',
      person1: map['person1'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      phonenumber: map['phonenumber'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      country: map['country'] ?? '',
      address: map['address'] ?? '',
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'person': person,
      'person1': person1,
      'email': email,
      'password': password,
      'phonenumber': phonenumber,
      'city': city,
      'state': state,
      'country': country,
      'address': address,
      'image': image,
    };
  }
}



class DriverModel {
  String id;
  String name;
  String username;
  String email;
  String phone;
  String city;
  String password;
  String image;

  DriverModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.city,
    required this.password,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "username": username,
      "email": email,
      "phone": phone,
      "city": city,
      "password": password,
      "image": image,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map, String id) {
    return DriverModel(
      id: id,
      name: map["name"] ?? "",
      username: map["username"] ?? "",
      email: map["email"] ?? "",
      phone: map["phone"] ?? "",
      city: map["city"] ?? "",
      password: map["password"] ?? "",
      image: map["image"] ?? "",
    );
  }
}

class BookingItem {
  String name;
  double price;
  int quantity;
  int hours;
  int minutes;
  String image;

  BookingItem({
    required this.name,
    required this.price,
    this.quantity = 1,
    required this.hours,
    required this.minutes,
    required this.image,
  });

  double get subtotal => price * quantity;
}