import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';


class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Colors.white),
      child: SideBarTabs(),
    );
  }
}

class SideBarTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    makeColumn() {
      return Column(
        children: [
          makePollSection(),
          Expanded(child: makeChatSection()),
          footerBox()
        ],
      );
    }

    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          body: Column(
            children: [
              TabBar(
                  labelPadding: EdgeInsets.only(right: 0, bottom: 0),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(width: 0.0, color: Colors.transparent),
                  ),
                  tabs: <Widget>[
                    Tab(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text("Chat", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Tab(child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Attendee", style: TextStyle(color: Colors.black),),
                    ),)
                  ]),
              Container(
                child: Expanded(
                  child: TabBarView(
                    children: [
                      makeColumn(),
                      Text(" "),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
makePollSection() =>  Container(
  padding: EdgeInsets.only(top: 15, left: 15,  right: 15),
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color:  const Color(0xffb1B4A43)
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 30.0,child: Text("Which platform will be the leader in your company", style: TextStyle(fontSize: 12, color: Colors.white),)),
      makeProgressBar(0.3),
      makeProgressText("33% Facebook"),
      makeProgressBar(0.6),
      makeProgressText("62% Twitter"),
      makeProgressBar(0.2),
      makeProgressText("16% Clubhouse"),
    ],
  ),
);

SizedBox makeProgressBar(double value) => SizedBox(
    height: 2.0,
    child: LinearProgressIndicator(value: value, backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation(Colors.white))
);

Padding makeProgressText(String label) => Padding(
    padding: EdgeInsets.only(bottom: 15, top: 1),
    child: Text(label, style: TextStyle(fontSize: 12, color: Colors.white),));


makeChatSection() => ListView(
  children: [
    sender("Elwin Shelvin"),
    chatRow("Hey-hey 👋 😎"),
    sender("Kita Chihoko"),
    chatRow("High Everyone"),
    chatRow("Joseph here from california"),
    ChatBubble(
      clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 20),
      elevation: 0,
      backGroundColor: Color(0xffC6E4D9),
      child: Container(
        constraints: BoxConstraints(
        ),
        child: Text(
          "There will also be recording available.",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
    sender("Gvozden Boskovsky"),
    chatRow("Hi everyone! Gvozden here from California"),
  ],
);

Padding sender(String name) => Padding(
  padding: EdgeInsets.only(left: 50, top: 20),
  child: Text(name, style: TextStyle(fontSize: 11, color: Color(0xffD7D7D7)),),);

Container chatRow(String message) {
  return Container(
    padding: EdgeInsets.only(top: 5),
    child: Row(children: [
      CircleAvatar(
        radius: 18.0,
        backgroundImage: new AssetImage('images/photo1.jpg'),
      ),
      ChatBubble(
        clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 2, left: 10),
        elevation: 0,
        backGroundColor: Color(0xffF2F4F7),
        child: Container(
          constraints: BoxConstraints(
//          maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Container(
            width: 170,
            child: Text(
              message,
              style: TextStyle(color: Colors.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
          ),
        ),
      ),
    ],),
  );
}

Align footerBox() {
  return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(Icons.alternate_email, size: 18, color: Colors.grey),
              ),
              Padding(
                padding: const  EdgeInsets.only(right: 10.0),
                child: Icon(Icons.filter_none, size: 18, color: Colors.grey),
              ),
              Padding(
                padding: const  EdgeInsets.only(right: 10.0),
                child: Icon(Icons.attachment, size: 18, color: Colors.grey),
              ),
            ],),
          TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                hintText: ("Write your message"),
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none
                    ,borderRadius: BorderRadius.circular(0.0)),
              )
          ),
        ],
      )
  );
}