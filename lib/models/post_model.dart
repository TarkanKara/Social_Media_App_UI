import 'user_model.dart';

enum PostType { image, video, audio }

class Post {
  final User user;
  final String id;
  final PostType type;
  final String caption;
  final String videoPath;

  Post({
    required this.user,
    required this.id,
    required this.type,
    required this.caption,
    required this.videoPath,
  });

  static List<Post> posts = [
    Post(
      user: User.users[0],
      id: "1",
      type: PostType.video,
      caption:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
      videoPath: "assets/videos/1.play.mp4",
    ),
    Post(
      user: User.users[1],
      id: "2",
      type: PostType.video,
      caption:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
      videoPath: "assets/videos/2.play.mp4",
    ),
    Post(
      user: User.users[2],
      id: "3",
      type: PostType.video,
      caption:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
      videoPath: "assets/videos/3.play.mp4",
    ),
    Post(
      user: User.users[3],
      id: "4",
      type: PostType.video,
      caption:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
      videoPath: "assets/videos/4.play.mp4",
    ),
    Post(
      user: User.users[4],
      id: "5",
      type: PostType.video,
      caption:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
      videoPath: "assets/videos/5.play.mp4",
    ),
    Post(
      user: User.users[5],
      id: "6",
      type: PostType.video,
      caption:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
      videoPath: "assets/videos/6.play.mp4",
    ),
  ];
}
