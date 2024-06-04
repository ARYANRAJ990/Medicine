import 'package:medicine/auth_view_model.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => AuthViewModel()),
  // ChangeNotifierProvider(create: (_) => NavigationViewModel()),
  // ChangeNotifierProvider(create: (_) => UserViewModel()),
  // ChangeNotifierProvider(create: (_) => WatiViewModel()),
];
