class User {
  final String id;
  final String username;
  final String imagePath;
  final int followers;
  final int followings;
  final int likes;

  User({
    required this.id,
    required this.username,
    required this.imagePath,
    required this.followers,
    required this.followings,
    required this.likes,
  });

  static List<User> users = [
    User(
      id: "1",
      username: "Addison",
      imagePath: "assets/images/1.image.jpg",
      followers: 120,
      followings: 120,
      likes: 55,
    ),
    User(
      id: "2",
      username: "Abbey",
      imagePath: "assets/images/2.image.jpg",
      followers: 30,
      followings: 50,
      likes: 10,
    ),
    User(
      id: "3",
      username: "Kelvin",
      imagePath: "assets/images/3.image.jpg",
      followers: 200,
      followings: 28,
      likes: 33,
    ),
    User(
      id: "4",
      username: "Alvin",
      imagePath: "assets/images/4.image.jpg",
      followers: 350,
      followings: 120,
      likes: 205,
    ),
    User(
      id: "5",
      username: "Aisha",
      imagePath: "assets/images/5.image.jpg",
      followers: 10,
      followings: 12,
      likes: 55,
    ),
    User(
      id: "6",
      username: "Axel",
      imagePath: "assets/images/6.image.jpg",
      followers: 45,
      followings: 120,
      likes: 15,
    ),
  ];
}
