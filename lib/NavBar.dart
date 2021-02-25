import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  List<String> elemTags;
  List<Icon> icons;
  int current;

  Color bg = Colors.black87;
  Color ec = Colors.purple;
  Function(int) onPressed;

  NavBar(this.bg, this.ec, this.elemTags, this.icons, this.current, this.onPressed);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bg,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getChildren(),
      ),
    );
  }

  List<Widget> getChildren() {
    List<Widget> retVal = [];
    for (int i = 0; i < widget.elemTags.length; i++) {
      retVal.add(
        Expanded(
          child: NavbarElement(widget.elemTags[i], widget.icons[i], widget.onPressed, i, widget.current == i, widget.ec),
        ),
      );
    }

    return retVal;
  }
}

class NavbarElement extends StatefulWidget {
  String tag;
  Icon icon;
  Color color;
  int position;
  bool opened;
  Function(int) press;

  NavbarElement(
    this.tag,
    this.icon,
    this.press,
    this.position,
    this.opened,
    this.color,
  );

  @override
  _NavbarElementState createState() => _NavbarElementState();
}

class _NavbarElementState extends State<NavbarElement> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.press(widget.position);
      },
      child: Container(
        height: 75,
        child: Stack(
          children: [
            AnimatedPositioned(
              right: 0,
              left: 0,
              bottom: widget.opened ? -50 : 0,
              top: 0,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                curve: Curves.easeInOut,
                opacity: widget.opened ? 0 : 1,
                duration: Duration(milliseconds: 300),
                child: widget.icon,
              ),
            ),
            AnimatedPositioned(
              right: 0,
              left: 0,
              bottom: widget.opened ? 0 : -50,
              top: 0,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                curve: Curves.easeInOut,
                opacity: widget.opened ? 1 : 0,
                duration: Duration(milliseconds: 300),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.tag,
                      style: TextStyle(
                        color: widget.color,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ClipOval(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(color: widget.color),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
