class Post {
  final String id;
  final String imageUrl;
  final String caption;
  final String artistId;
  final DateTime createdAt;
  final int likes;
  final List<String> tags;

  Post({
    required this.id,
    required this.imageUrl,
    required this.caption,
    required this.artistId,
    required this.createdAt,
    required this.likes,
    required this.tags,
  });
}
