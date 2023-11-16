import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileVideoGridList extends StatelessWidget {
  const ProfileVideoGridList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MasonryGridView.count(
      padding: const EdgeInsets.all(10.0),
      itemCount: 12,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 2,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 120,
              width: size.width / 2,
              color: Theme.of(context).colorScheme.secondary,
              child: CachedNetworkImage(
                imageUrl:
                    'https://i.pinimg.com/originals/e9/93/c5/e993c51e3b971ec3c57ef177d264fa67.gif',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: size.width / 2,
                  height: 120,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
