import 'package:flutter/material.dart';

class ProfileBiography extends StatelessWidget {
  const ProfileBiography({super.key, required this.bioText});

  final String bioText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(
                  color: Colors.grey,
                  width: 0.7,
                ),
              ),
            ),
            child: Text(
              bioText,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                  color: Theme.of(context).unselectedWidgetColor, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}