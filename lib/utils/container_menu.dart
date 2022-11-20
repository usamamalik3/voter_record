
import 'package:flutter/material.dart';
import 'package:voterrecord/models/dashboardItem.dart';
class ContainerMenuNoIcon extends StatelessWidget {
  const ContainerMenuNoIcon({super.key, required this.list, required this.crossAxisSpacing, required this.mainAxisSpacing, required this.crossAxisCount, required this.childAspectRatio});
  final List<BodyItem> list;
final double crossAxisSpacing;
final double mainAxisSpacing;
final int crossAxisCount;
final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: GridView.count(
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          children: list.map((data) {
            return InkWell(
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.pushNamed(context, '/zonebody',arguments: data.title);
              
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:Theme.of(context).inputDecorationTheme.fillColor!,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   
                    Text(
                      data.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const  SizedBox(height: 8),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
class ContainerMenu extends StatelessWidget {
  const ContainerMenu({
    Key? key, required this.list, required this.crossAxisSpacing, required this.mainAxisSpacing, required this.crossAxisCount, required this.childAspectRatio,
  }) : super(key: key);
final List<Items> list;
final double crossAxisSpacing;
final double mainAxisSpacing;
final int crossAxisCount;
final double childAspectRatio;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: GridView.count(
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          children: list.map((data) {
            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(0.2), blurRadius: 0)],
                borderRadius: BorderRadius.circular(12),
                color:Theme.of(context).inputDecorationTheme.fillColor!,
              ),
              child: InkWell(
                splashColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                data.onPressed(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    data.icon,
                    const SizedBox(height: 14),
                    Text(
                      data.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const  SizedBox(height: 8),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

