import 'package:flutter/material.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          const _LogoWidget(),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(topInset: topInset),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(color: Colors.pink, height: 150.0),
                Container(color: Colors.cyan, height: 150.0),
                Container(color: Colors.indigo, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.pink, height: 150.0),
                Container(color: Colors.cyan, height: 150.0),
                Container(color: Colors.indigo, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 204,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(AppImages.scheduleBg),
            ),
            Positioned(
              left: 20,
              top: 84,
              child: Image.asset(AppImages.scheduleFfLogo),
            ),
            Positioned(
              right: 20,
              top: 64,
              child: Image.asset(AppImages.scheduleSurfLogo),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double _height = 56;
  final double topInset;

  _SliverAppBarDelegate({required this.topInset});

  @override
  double get minExtent => _height + topInset;
  @override
  double get maxExtent => _height + topInset;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _SectionButtonsWidget(
      topInset: topInset,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _SectionButtonsWidget extends StatelessWidget {
  final double topInset;
  const _SectionButtonsWidget({
    Key? key,
    required this.topInset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const totalItem = 4;
    const itemGradientWidth = 2;
    const halfItemGradientWidth = itemGradientWidth / 2;
    const endGradientPoint =
        totalItem * itemGradientWidth + halfItemGradientWidth;

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 20, right: 20, top: topInset),
        scrollDirection: Axis.horizontal,
        itemCount: totalItem,
        itemBuilder: (context, index) {
          final currentGradientStartPont =
              halfItemGradientWidth + index * itemGradientWidth;
          final currentGradientEndPont =
              endGradientPoint - currentGradientStartPont;
          return Center(
            child: SizedBox(
              height: 36,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  elevation: MaterialStateProperty.all(0),
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-currentGradientStartPont, 0.0),
                      end: Alignment(currentGradientEndPont, 0.0),
                      colors: const <Color>[
                        Color(0xFF00BD13),
                        Color(0xFF170AF4),
                      ],
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(80.0)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("Секция $index"),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}
