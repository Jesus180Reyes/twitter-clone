// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/models/twitteritem_model.dart';
import 'package:twitter_clone/ui/actiontweet.widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return SizedBox(
      // color: Colors.red,
      width: size.width * 0.75,
      child: Column(
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
          const SizedBox(height: 15),
          item.isUrl != null
              ? GestureDetector(
                  onTap: () async {
                    final url = Uri.parse(item.isUrl!);
                    (await canLaunchUrl(url))
                        ? await launch(
                            url.toString(),
                          )
                        : await launchUrl(url);
                  },
                  child: SizedBox(
                    // color: Colors.green,
                    child: Text(
                      item.isUrl!,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          item.isImage != null
              ? Container(
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
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          Text('${item.views} Views'),
          SizedBox(
            width: 300,
            child: _ItemsIcons(item: item),
          ),
        ],
      ),
    );
  }
}

class _ItemsIcons extends StatelessWidget {
  const _ItemsIcons({
    Key? key,
    required this.item,
  }) : super(key: key);

  final TwitterItem item;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ActionsTweetWidget(
              icon: FontAwesomeIcons.comment,
              item: item.comments,
            ),
          ),
          ActionsTweetWidget(
            icon: Icons.favorite_border,
            item: item.likes,
          ),
          ActionsTweetWidget(
            icon: FontAwesomeIcons.retweet,
            item: item.retweets,
          ),
        ],
      ),
    );
  }
}
