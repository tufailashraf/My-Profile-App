class User {
  final String name;
  final String profession;
  final String bio;
  final String email;
  final String phone;
  final String location;
  final String imageUrl;

  User({
    required this.name,
    required this.profession,
    required this.bio,
    required this.email,
    required this.phone,
    required this.location,
    required this.imageUrl,
  });
}

final demoUser = User(
  name: 'Tufail Ashraf',
  profession: 'Flutter Developer',
  bio: 'Passionate about building beautiful mobile UIs and functional apps with Flutter.',
  email: 'tufail@example.com',
  phone: '+92-300-0000000',
  location: 'Gilgit Baltistan, Pakistan',
  imageUrl: 'assets/images/profile.jpg',
);
