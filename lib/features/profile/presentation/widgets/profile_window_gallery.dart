import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileWindowGallery extends StatelessWidget {
  const ProfileWindowGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final numbers = [
      180.0,
      250.0,
      170.0,
      190.0,
      250.0,
      180.0,
      170.0,
      180.0,
      190.0,
      200.0,
      220.0,
      230.0,
      180.0,
      190.0
    ];
    final size = MediaQuery.sizeOf(context);
    return MasonryGridView.count(
      padding: const EdgeInsets.all(10.0),
      itemCount: numbers.length,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 2,
      itemBuilder: ((context, index) {
        final heightImage = numbers[index];

        final widthImage = size.width / 2;
        return GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: heightImage,
              width: widthImage,
              color: Theme.of(context).colorScheme.secondary,
              child: CachedNetworkImage(
                imageUrl:
                    'https://i.pinimg.com/564x/a1/3f/03/a13f033b04fa966d218a0ffa8bcacbd1.jpg',
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: widthImage,
                  height: heightImage,
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
