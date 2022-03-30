import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.currentUserEmail,
    required this.sender,
    required this.text,
  }) : super(key: key);

  final String currentUserEmail;
  final String sender;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: currentUserEmail == sender
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Text(
              sender,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ),
          Align(
            alignment: currentUserEmail == sender
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Material(
              elevation: 5,
              color: currentUserEmail == sender
                  ? Colors.lightBlueAccent
                  : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(currentUserEmail == sender ? 30 : 0),
                topRight: Radius.circular(currentUserEmail == sender ? 0 : 30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10,
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    color: currentUserEmail == sender
                        ? Colors.white
                        : Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
