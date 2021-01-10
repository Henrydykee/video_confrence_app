import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../utils.dart';

class VideoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: [
          TopSection(),
          streamView(),
          footerButtons()
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Text(
              "ZOOM",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )),
        Expanded(
            flex: 6,
            child: ListTile(
              title: Text("Engagement & Nurture Marketing Strategy"),
              subtitle: Text("Social Media Marketing"),
            )),
        makeIconButtons(EvaIcons.cloudUploadOutline,Colors.black54),
        makeIconButtons(EvaIcons.settingsOutline,Colors.black54),
        makeIconButtons(EvaIcons.moreHorizotnalOutline,Colors.black54),
        finishButton("Finish the lesson", () {})
      ],
    ));
  }
}

class streamView extends StatefulWidget {
  @override
  _streamViewState createState() => _streamViewState();
}

class _streamViewState extends State<streamView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 6,
        child: Container(
          height: MediaQuery.of(context).size.height * .8,
          decoration: BoxDecoration(
            color: const Color(0xffbF2F4F7),
            image: DecorationImage(
                image: AssetImage('assets/image1.jpg'),
              fit: BoxFit.fill,
            ),
              border: Border.all(
              color: Colors.black,
                width: 0
          ),
            borderRadius: BorderRadius.circular(10)
          ),
        ));
  }
}

class footerButtons extends StatefulWidget {
  @override
  _footerButtonsState createState() => _footerButtonsState();
}

class _footerButtonsState extends State<footerButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        makeIconColumnButtons(EvaIcons.cameraOutline, "cam",Colors.black54),
        makeIconColumnButtons(EvaIcons.micOutline, "mic",Colors.black54 ),
        makeIconColumnButtons(EvaIcons.shareOutline, "Share",Colors.black54 ),
        makeIconColumnButtons(Icons.record_voice_over, "Rec",Colors.black54 ),
        makeIconColumnButtons(Icons.slideshow, "Slide",Colors.black54),
        makeIconColumnButtons(Icons.poll, "Poll",Colors.black54 ),

      ],
    );
  }
}

