import 'package:flutter/material.dart';
import 'package:market_ui/utils/constants/market_constants.dart';
import 'package:market_ui/widgets/custom_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MarketConstants sources = MarketConstants();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cars",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.redAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.redAccent,
              ),
            ),
          ],
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.redAccent),
            dividerColor: const Color.fromRGBO(0, 0, 0, 0),
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: const EdgeInsets.symmetric(horizontal: 25),
            labelColor: Colors.white,
            indicatorColor: const Color.fromRGBO(0, 0, 0, 0),
            indicatorWeight: 0.00000000000000001,
            tabs: [
              for (String text in [
                "All",
                "Red",
                "Blue",
                "Green",
                "Yellow",
                "Black"
              ])
                Tab(
                  text: text,
                ),
            ],
          ),
        ),
        body: Expanded(
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTabView(sources: sources.imageSources),
              ),
              for (int i = 1; i <= 5; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTabView(
                      sources: sources.imageSources
                          .where((element) => element.contains("$i"))
                          .toList()),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
