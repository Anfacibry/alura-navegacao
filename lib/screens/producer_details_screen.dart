import 'package:flutter/material.dart';
import 'package:navegacao/screens/package_details_screen.dart';

import '../components/orgs_packages_card.dart';
import '../core/app_colors.dart';
import '../core/app_images.dart';
import '../models/package_model.dart';
import '../models/producer_model.dart';

class ProducerDetailsScreen extends StatelessWidget {
  final Producer producer;
  const ProducerDetailsScreen({
    required this.producer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Detalhe da empresa',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                AppImages.bgProducer,
                fit: BoxFit.fitWidth,
                width: double.infinity,
                height: 180,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 150, 20, 15),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(producer.logo!),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      producer.name!,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                    Text(
                      '${producer.distance} km',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(producer.description!,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 18,
                )),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              'Cestas',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: ListView(
                children: _generatePackageList(context, producer.packages!)),
          )),
        ],
      ),
    );
  }

  List<Widget> _generatePackageList(BuildContext context, List packages) {
    List<Widget> children = [];
    for (final package in packages) {
      final pack = Package.fromJson(package);

      children.add(InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PackageDetailsScreen(
                    package: pack,
                    producer: producer,
                  )),
        ),
        child: OrgsPackagesCard(
          title: pack.title!,
          price: pack.price,
          description: pack.description!,
        ),
      ));
    }

    return children;
  }
}
