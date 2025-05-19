class User {
  final int id;
  final String name;
  final String? username;
  final String email;
  final Address address;
  final String phone;

  User({
    required this.id,
    required this.name,
    this.username,
    required this.email,
    required this.address,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String?,
      email: json['email'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String,
    );
  }

  static List<User> listFromJson(List json) {
    List<User> list = [];
    for (var item in json) {
      list.add(User.fromJson(item as Map<String, dynamic>));
    }

    return list;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        if (username != null) 'username': username,
        'email': email,
        'address': address.toJson(),
        'phone': phone,
      };
}

class Address {
  final String street;
  final String city;
  final String zipcode;

  Address({
    required this.street,
    required this.city,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    // Handle nested address structure if present
    final addressData = json.containsKey('address') ? json['address'] as Map<String, dynamic> : json;
    
    return Address(
      street: addressData['street'] as String,
      city: addressData['city'] as String,
      zipcode: addressData['zipcode'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'street': street,
        'city': city,
        'zipcode': zipcode,
      };
}