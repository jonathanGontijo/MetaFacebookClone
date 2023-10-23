import 'package:flutter/material.dart';
import 'package:meta_facebook/components/profile_image_buttom.dart';
import 'package:meta_facebook/models/models.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: Text(
              "Contatos",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]),
            )),
            IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          ],
        ),
        Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.0),
                itemCount: users.length,
                itemBuilder: (context, indice) {
                  User user = users[indice];
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ProfileImageButtom(user: user, onTap: () {}),
                  );
                }))
      ]),
    );
  }
}
