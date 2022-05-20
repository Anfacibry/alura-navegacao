import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/app_images.dart';

class OrgsHighlightsCard extends StatelessWidget {
  final String img;
  final String title;
  final Color color;
  final String description;
  final void Function() btnAction;

  const OrgsHighlightsCard({
    required this.img,
    required this.title,
    required this.description,
    required this.color,
    required this.btnAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        width: 450,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.logoIcon,
                    width: 30,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkGrey),
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: btnAction,
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.bold)),
                    child: const Text("Ver agora"),
                  ),
                ],
              ),
              Expanded(child: Image.asset(img)),
            ],
          ),
        ),
      ),
    );
  }
}
