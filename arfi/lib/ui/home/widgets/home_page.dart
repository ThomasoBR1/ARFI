import 'package:arfi/ui/home/tab/room/light_room.dart';
import 'package:arfi/ui/home/tab/room/sala.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, initialIndex: currentIndex, length: 2);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('A.R.F.I.')),
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[LuzQuarto(), LuzSala()],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ButtonNavigationBar(
                currentIndex: currentIndex,
                onItemTap: (i) => {
                  _tabController.index = i,
                  currentIndex = i,
                  setState(() {})
                },
                items: <Icon>[Icon(Icons.lightbulb_outline)],
              ),
            ],
          ),
        ));
  }
}

class _ButtonNavigationBar extends StatelessWidget {
  final Function(int) onItemTap;
  final List<Icon> items;
  final currentIndex;

  const _ButtonNavigationBar(
      {@required this.items,
      @required this.onItemTap,
      @required this.currentIndex})
      : assert(items != null),
        assert(onItemTap != null),
        assert(currentIndex != null);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items.map((icon) {
        final index = items.indexOf(icon);
        final isSelected = (index == currentIndex);
        return IconButton(
          icon: icon,
          color: isSelected ? Theme.of(context).accentColor : Colors.grey,
          onPressed: () => onItemTap(index),
        );
      }).toList(),
    );
  }
}

//class _addButton extends StatelessWidget {
  //final GestureTapCallback onTap;
  //final Icon icon;

  //const _addButton({@required this.icon, @required this.onTap})
    //  : assert(onTap != null),
      //  assert(icon != null);
  //@override
  //Widget build(BuildContext context) {
    //return Container(
      //width: 50,
      //height: 50,
      //decoration: BoxDecoration(
       //   color: Theme.of(context).primaryColor, shape: BoxShape.circle),
     // child: Center(
      //  child: icon,
     // ),
   // );
 // }
//}
