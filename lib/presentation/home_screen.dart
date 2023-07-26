import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: const Color.fromARGB(255, 10, 231, 227),
                pinned: _pinned,
                snap: _snap,
                floating: _floating,
                expandedHeight: 160.0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.all(16),
                  centerTitle: false,
                  title: const Text(
                    'SliverAppBar',
                    style: TextStyle(color: Colors.white),
                  ),
                  background: Image.asset(
                    "assets/images/rick.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                  child: Center(
                    child: Text('Scroll to see the SliverAppBar in effect.'),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      color: index.isOdd ? Colors.white : Colors.black12,
                      height: 100.0,
                      child: Center(
                        child: Text('$index', textScaleFactor: 5),
                      ),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          enableFeedback: true,
          isExtended: true,
          onPressed: () {},
          tooltip: 'Add Item',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: OverflowBar(
              overflowAlignment: OverflowBarAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('pinned'),
                    Switch(
                      onChanged: (bool val) {
                        setState(() {
                          _pinned = val;
                        });
                      },
                      value: _pinned,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('snap'),
                    Switch(
                      onChanged: (bool val) {
                        setState(() {
                          _snap = val;
                          // Snapping only applies when the app bar is floating.
                          _floating = _floating || _snap;
                        });
                      },
                      value: _snap,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('floating'),
                    Switch(
                      onChanged: (bool val) {
                        setState(() {
                          _floating = val;
                          _snap = _snap && _floating;
                        });
                      },
                      value: _floating,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
