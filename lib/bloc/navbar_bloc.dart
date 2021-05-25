import 'package:bloc/bloc.dart';
import '../states/navbar_state.dart';

enum NavbarItems { Home, Likes, Account }

class NavbarBloc extends Bloc<NavbarItems, NavbarState> {
  @override
  NavbarBloc() : super(ShowHome());

  @override
  Stream<NavbarState> mapEventToState(NavbarItems event) async* {
    switch (event) {
      case NavbarItems.Likes:
        yield ShowLikes();
        break;
      case NavbarItems.Account:
        yield ShowAccount();
        break;
      default:
        yield ShowHome();
        break;
    }
  }
}
