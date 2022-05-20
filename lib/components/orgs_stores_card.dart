import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../core/app_colors.dart';

class OrgsStoresCard extends StatelessWidget {
  final String img;
  final String title;
  final String? distance;
  final void Function() action;

  const OrgsStoresCard({
    required this.img,
    required this.title,
    this.distance,
    required this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: InkWell(
        onTap: action,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1.0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    img,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SmoothStarRating(
                      rating: 5,
                      color: AppColors.green,
                      borderColor: AppColors.green,
                      isReadOnly: false,
                      starCount: 5,
                    ),
                  ],
                ),
                _favoriteOrDistance(distance),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _favoriteOrDistance(distance) {
    if (distance != null) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('Distância',
                style: TextStyle(color: AppColors.darkGrey)),
            Text('$distance km')
          ],
        ),
      );
    }

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.favorite,
            color: AppColors.green,
            size: 30,
          ),
        ],
      ),
    );
  }
}
