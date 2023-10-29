import 'package:flutter/material.dart';

class ChattingHomeScreen extends StatefulWidget {
  static const String routeName = '/chatting_home';
  const ChattingHomeScreen({super.key});

  @override
  State<ChattingHomeScreen> createState() => _ChattingHomeScreenState();
}

class _ChattingHomeScreenState extends State<ChattingHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding( // Wrap the ListView with Padding
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView(
          children: [
            ChatMessage(
              senderName: 'John Doe',
              messageText: 'Hello, I am interested in your property',
              time: '10:00 AM',
              imageUrl: 'assets/images/3bhk.png',
            ),
            ChatMessage(
              senderName: 'Jane carter  ',
              messageText: 'I have a question about the property details',
              time: '10:15 AM',
              imageUrl: 'assets/images/aparto.png',
            ),
            ChatMessage(
              senderName: 'David Smith Jr.',
              messageText: 'Can you send me more photos of the property?',
              time: '10:30 AM',
              imageUrl: 'assets/images/3bhk.png',
            ),
            ChatMessage(
              senderName: 'Samantha da Silva',
              messageText: 'Sure, here you go',
              time: '10:45 AM',
              imageUrl: 'assets/images/aparto.png',
            ),
            ChatMessage(
              senderName: 'Ahmad Dahlan',
              messageText: 'Thank you',
              time: '11:00 AM',
              imageUrl: 'assets/images/3bhk.png',
            ),
            ChatMessage(
              senderName: 'Issa El-Khateeb',
              messageText: 'You are welcome',
              time: '11:15 AM',
              imageUrl: 'assets/images/aparto.png',
            ),
            // Add more chat messages here
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String senderName;
  final String messageText;
  final String time;
  final String imageUrl;

  ChatMessage({
    required this.senderName,
    required this.messageText,
    required this.time,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imageUrl),
            ),
          ),
          Expanded( // Wrap the Row with Expanded
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  senderName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  messageText,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
