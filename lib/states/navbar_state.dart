abstract class NavbarState {
  int itemIndex();
}

class ShowHome extends NavbarState {
  @override
  itemIndex() => 0;
}

class ShowLikes extends NavbarState {
  @override
  itemIndex() => 1;
}

class ShowAccount extends NavbarState {
  @override
  itemIndex() => 2;
}
