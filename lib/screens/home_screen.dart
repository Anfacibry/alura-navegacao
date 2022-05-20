import 'package:flutter/material.dart';
import 'package:navegacao/screens/producer_details_screen.dart';

import '../components/orgs_cards_list.dart';
import '../components/orgs_drawer.dart';
import '../components/orgs_highlights_card.dart';
import '../components/orgs_search_bar.dart';
import '../components/orgs_spotlight_card.dart';
import '../components/orgs_stores_card.dart';
import '../core/app_colors.dart';
import '../core/app_images.dart';
import '../models/producer_model.dart';
import '../repository/data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      backgroundColor: Colors.grey[100],
      drawer: const OrgsDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppImages.logo,
                    height: kToolbarHeight,
                  ),
                  IconButton(
                    color: Colors.transparent,
                    icon: const Icon(Icons.menu,
                        color: AppColors.green), // set your color here
                    onPressed: () =>
                        widget.scaffoldKey.currentState!.openDrawer(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Olá, Leonardo',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkGrey),
              ),
              const SizedBox(height: 10),
              const Text(
                'Encontre os melhores produtores',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              const OrgsSearchBar(),
              const SizedBox(height: 10),
              FutureBuilder<OrgsCardsList>(
                future: _generateHighlightsCards(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Cestas em destaque',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkGrey),
              ),
              const SizedBox(height: 10),
              FutureBuilder<OrgsCardsList>(
                future: _generateSpotlightCards(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data!;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Mais acessados',
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              FutureBuilder<List<Widget>>(
                future: _generateProducerList(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(children: snapshot.data!);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Widget>> _generateProducerList(BuildContext context) async {
    List<Widget> children = [];
    final data = await Data.getJson();
    final producers = data["producers"];

    for (final producer in producers.keys) {
      final prod = Producer.fromJson(producers[producer]);

      children.add(OrgsStoresCard(
        action: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProducerDetailsScreen(producer: prod)),
        ),
        img: prod.logo!,
        distance: prod.distance,
        title: prod.name!,
      ));

      children.add(
        const SizedBox(height: 10),
      );
    }

    return children;
  }

  Future<OrgsCardsList> _generateHighlightsCards() async {
    List<Widget> children = [];
    final data = await Data.getJson();
    final highlights = data["highlights"];

    for (final highlight in highlights) {
      children.add(OrgsHighlightsCard(
        img: highlight["image"],
        title: highlight["name"],
        description: highlight["description"],
        color: AppColors.white,
        btnAction: () {},
      ));
    }

    return OrgsCardsList(heightList: 160, cards: children);
  }

  Future<OrgsCardsList> _generateSpotlightCards() async {
    List<Widget> children = [];
    final data = await Data.getJson();
    final spotlights = data["spotlights"];

    for (final spotlight in spotlights) {
      children.add(OrgsSpotlightCard(
          img: spotlight["image"],
          price: spotlight["price"],
          description: spotlight["description"],
          color: AppColors.frostMint,
          store: spotlight["store"]));
    }

    return OrgsCardsList(heightList: 140, cards: children);
  }
}
