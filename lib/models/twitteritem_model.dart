class TwitterItem {
  final String id;
  final String description;
  final String imageUrl;
  final String name;
  final String? isImage;
  final String? isvideo;
  final String? isUrl;
  final DateTime createdAt;
  final int likes;
  final int comments;
  final int retweets;
  final int views;

  TwitterItem({
    this.isUrl,
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.name,
    this.isImage,
    this.isvideo,
    required this.createdAt,
    required this.likes,
    required this.comments,
    required this.retweets,
    required this.views,
  });
}
