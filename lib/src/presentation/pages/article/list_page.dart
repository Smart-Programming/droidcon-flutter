// ignore_for_file: unused_element, must_be_immutable

import 'package:droidcon_flutter/src/application/utils/custom_tag.dart';
import 'package:droidcon_flutter/src/application/utils/image_container.dart';
import 'package:droidcon_flutter/src/presentation/pages/article/single_topic_page.dart';
import 'package:droidcon_flutter/src/presentation/router/routes.dart';
import 'package:flutter/material.dart';

class ArticlesList extends StatefulWidget {
  const ArticlesList({super.key});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            )),
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[_TopicsList(), _Topics()],
      ),
    );
  }
}

class _Topics extends StatelessWidget {
  _Topics({super.key});

  List<Map<String, dynamic>> topics = <Map<String, dynamic>>[
    <String, dynamic>{
      'author': 'Steve Maina',
      'topic': 'Architecture',
      'file': 'layered_architecture.md',
      'linkedIn': 'steveMaina'
    },
    <String, dynamic>{
      'author': 'Paul Mburu',
      'topic': 'Infrastructure',
      'file': 'flutter_infrastructure.md',
      'linkedIn': 'PaulMburu'
    },
    <String, dynamic>{
      'author': 'Nderi Kamau',
      'topic': 'Architecture with testing',
      'file': 'flutter_testing.md',
      'linkedIn': 'Nder12'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'All Topics',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.more_horiz)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topics.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: const EdgeInsets.only(right: 15),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRoutes.singleArticleRoute,
                        arguments: Props(
                          file: topics[index]['file'],
                          topic: topics[index]['topic'],
                          author: topics[index]['author'],
                          linkedin: topics[index]['linkedIn'],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ImageContainer(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.width * 0.5),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            topics[index]['topic'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold, height: 1.5),
                          ),
                          Text(
                            'by ' + topics[index]['author'],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class _TopicsList extends StatelessWidget {
  const _TopicsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      padding: EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomTag(
              backgroundColor: Colors.grey.withAlpha(150),
              children: <Widget>[
                Text('Topics of the day',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white)),
              ]),
          const SizedBox(
            height: 10,
          ),
          Text(
              'Building Resilient Flutter Apps: Layered Architecture with a Focus on Testing and Infrastructure',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  height: 1.25,
                  fontWeight: FontWeight.bold)),
          Row(
            children: <Widget>[
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Text('Learn more')),
              const SizedBox(
                width: 10.0,
              ),
              Icon(Icons.arrow_right_alt)
            ],
          )
        ],
      ),
    );
  }
}
