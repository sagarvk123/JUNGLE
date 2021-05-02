import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String r4 = 'ChatScreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String message;
  void getUser() async {
    try {
      var user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessage() async {
    final messages = await _firestore.collection('message').get();
    for (var mess in messages.docs) {
      print(mess.data());
    }
  } //we have to call this function every time to get all (new especially) messages

  void messageStreams() async {
    await for (var snapshot in _firestore.collection('message').snapshots()) {
      for (var mess in snapshot.docs) print(mess.data());
    }
  } //this function will automatically adds or shows messages .No need to pull every time new messages adds

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
//                getMessage();
//                messageStreams();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        //Do something with the user input.
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageController.clear();
                      //Implement send functionality.
                      //message+user(loggedInUser.email)
                      _firestore.collection('message').add({
                        'text': message,
                        'user': loggedInUser.email,
                        'timestamp': FieldValue
                            .serverTimestamp() //for making messages come in order.Used in above stream
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('message')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          List<MessageBubble> messageBubbles = [];
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            );
          }
          final messages = snapshot.data.docs;

          for (var message in messages) {
//            final messageText = message.data()['text'] != 'clear function check'
//                ? message.data()['text']
//                : null; //try remove clear function check
            final messageText = message.data()['text'];
            final messageSender = message.data()['user']; //use fireStore
            final currentUser = loggedInUser.email; //use fireBase

            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isME: currentUser == messageSender,
            );
            messageBubbles.add(messageBubble);
          }
          //if closes
          return Expanded(
            child: ListView(
              reverse: true,
              children: messageBubbles,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
          );
        } //builder closes
        );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({
    this.text,
    this.sender,
    this.isME,
  });
  final String text;
  final String sender;
  final bool isME;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: getalignment(isME),
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          Material(
            borderRadius: isME == true
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
            color: isME == true ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Color getColor(bool isME) {
//  if (isME) {
//    return Colors.lightBlueAccent;
//  } else {
//    return Colors.white;
//  }
//}                   // use this function for color in MessageBubble Material
CrossAxisAlignment getalignment(bool isME) {
  if (isME)
    return CrossAxisAlignment.end;
  else
    return CrossAxisAlignment.start;
} //for crossAlignment of column in MessageBubble
