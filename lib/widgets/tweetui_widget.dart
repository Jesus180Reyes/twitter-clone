import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/models/twitteritem_model.dart';
import 'package:twitter_clone/ui/actiontweet.widget.dart';

class TweetUIWidget extends StatelessWidget {
  const TweetUIWidget({
    Key? key,
    required this.item,
    required this.size,
  }) : super(key: key);

  final TwitterItem item;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 300,
          // height: 100,
          // color: Colors.red,
          child: Text(
            item.description,
            style: const TextStyle(
              fontSize: 14,
            ),
            maxLines: 4,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(item.isImage!.toString()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text('${item.views} Views'),
        SizedBox(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionsTweetWidget(
                size: size,
                icon: FontAwesomeIcons.comment,
                item: item.comments,
              ),
              ActionsTweetWidget(
                size: size,
                icon: Icons.favorite_border,
                item: item.likes,
              ),
              ActionsTweetWidget(
                size: size,
                icon: FontAwesomeIcons.retweet,
                item: item.retweets,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
