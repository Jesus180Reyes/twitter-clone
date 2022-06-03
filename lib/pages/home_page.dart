import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/data/data.dart';
import 'package:twitter_clone/helpers/statusbar.dart';
import 'package:twitter_clone/models/twitteritem_model.dart';
import 'package:twitter_clone/widgets/tweetui_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarColorStatus();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: customAppbar(context),
      body: const ListItems(),
    );
  }

  AppBar customAppbar(context) {
    return AppBar(
      centerTitle: true,
      title: const Icon(FontAwesomeIcons.twitter, color: Colors.blueAccent),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'profile'),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://lastfm.freetls.fastly.net/i/u/ar0/d01a2fa285488359147cac52d66f4a3e',
            ),
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.stream_sharp, color: Colors.black),
        ),
      ],
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ...listTwitterItem.map((e) => ListTwitterItems(item: e)).toList()
        ],
      ),
    );
  }
}

class ListTwitterItems extends StatelessWidget {
  final TwitterItem item;
  const ListTwitterItems({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'profile'),
            child: CircleAvatar(
              radius: 27,
              // minRadius: 20,
              backgroundImage: NetworkImage(item.imageUrl),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details'),
            child: TweetUIWidget(item: item, size: size),
          ),
          Divider(thickness: 3, color: Colors.grey[200]),
        ],
      ),
    );
  }
}
