

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_ui_concepts/projects/cuberto/cuberto_liquid_transition/friend_tile.dart';

class CubertoLiquidTransition extends StatefulWidget {
  const CubertoLiquidTransition({Key? key}) : super(key: key);

  @override
  State<CubertoLiquidTransition> createState() => _CubertoLiquidTransitionState();
}

class _CubertoLiquidTransitionState extends State<CubertoLiquidTransition> {

List<FriendDetails> friendsNearby=[
  FriendDetails(name: 'Lessie Brody', avatarUrl: ''),
  FriendDetails(name: 'Moreen Rosalynne', avatarUrl: ''),
  FriendDetails(name: 'Roy Melantha', avatarUrl: ''),
  FriendDetails(name: 'Terell Osbourne', avatarUrl: '')
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
body: SingleChildScrollView(child: Column(
  children: [
    Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.yellow.shade200
          ),
        )
      ],
      
    ),
    Text('Friends Nearby'),
    ListView.builder(itemBuilder: (context, index) {
      return DecoratedBox(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey.withOpacity(0.1)
      ),
      child: ListTile(leading: CircleAvatar(
        child: Image.network(friendsNearby[index].avatarUrl),
      ),
      title: Text(friendsNearby[index].name),
      ),
      );
    },
    itemCount: friendsNearby.length,
    )

  ],
)),
    );
  }
}