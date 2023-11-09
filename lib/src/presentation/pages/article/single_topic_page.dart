import 'package:droidcon_flutter/src/application/utils/custom_tag.dart';
import 'package:droidcon_flutter/src/application/utils/image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/src/services/asset_bundle.dart';
import 'package:url_launcher/url_launcher.dart';

class Props {
  final String file;
  final String topic;
  final String author;
  final String linkedin;

  Props({
    required this.file,
    required this.topic,
    required this.author,
    required this.linkedin,
  });
}

class SingleTopicPage extends StatefulWidget {
  const SingleTopicPage({super.key, required this.props});
  final Props props;

  @override
  State<SingleTopicPage> createState() => _SingleTopicPageState();
}

class _SingleTopicPageState extends State<SingleTopicPage> {
  Future<void> _launchLinkedInProfile() async {
    final String url =
        'https://www.linkedin.com/in/${widget.props.linkedin}'; // Replace with the actual LinkedIn profile URL

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      width: double.infinity,
      opacity: 0.4,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              )),
        ),
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TopicHeadline(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    CustomTag(backgroundColor: Colors.black, children: <Widget>[
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage('assets/landing.jpg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(widget.props.author,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white)),
                    ]),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomTag(
                        backgroundColor: Colors.grey.withAlpha(150),
                        children: <Widget>[
                          CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage('assets/linkedIn.jpg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: _launchLinkedInProfile,
                            child: Text('@${widget.props.linkedin}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.white)),
                          ),
                        ])
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: FutureBuilder(
                    future: rootBundle.loadString('assets/${widget.props.file}'),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Markdown(
                            data: snapshot.data,
                          );
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        }
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopicHeadline extends StatelessWidget {
  const _TopicHeadline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text('Architecture \nwith Testing',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.25)),
        ],
      ),
    );
  }
}
