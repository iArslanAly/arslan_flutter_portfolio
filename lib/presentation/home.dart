import 'package:arslan_flutter_portfolio/core/widgets/desktop_appbar.dart';
import 'package:arslan_flutter_portfolio/presentation/widgets/hero.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopAppBar(
        title: Text("Ali.", style: Theme.of(context).textTheme.displayLarge),
      ),
      body: AppHero(),
    );
  }
}
