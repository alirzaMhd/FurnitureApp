import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:furniture_app/screens/home.dart';
import '../bloc/navbar_bloc.dart';
import '../states/navbar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  NavbarBloc _navbarBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _navbarBloc,
      builder: (BuildContext context, NavbarState state) {
        if (state is ShowLikes)
          return buildHomepage(state.itemIndex());
        else if (state is ShowAccount)
          return buildHomepage(state.itemIndex());
        else  
          return buildHomepage(state.itemIndex());
      },
    );
  }

  Scaffold buildHomepage(int currentIndex) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(4, (index) => Home()),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: navigationTapped,
          type: BottomNavigationBarType.fixed,
          items: bottomNavabarItems(),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavabarItems() {
    var navBarItems = List<BottomNavigationBarItem>();
    navBarItems = [
      BottomNavigationBarItem(
        icon: Icon(
          Feather.home,
        ),
        title: Container(height: 0.0),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Feather.heart,
        ),
        title: Container(height: 0.0),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Feather.user,
        ),
        title: Container(height: 0.0),
      ),
    ];
    return navBarItems;
  }

  void navigationTapped(int index) {
    if (index == 0) _navbarBloc.add(NavbarItems.Home);
    if (index == 1) _navbarBloc.add(NavbarItems.Likes);
    if (index == 2) _navbarBloc.add(NavbarItems.Account);
  }

  @override
  void initState() {
    super.initState();
    _navbarBloc = NavbarBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _navbarBloc.close();
  }
}
