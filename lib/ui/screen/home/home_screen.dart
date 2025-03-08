// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:socchat/core/enums/enums.dart';
// import 'package:socchat/core/services/database_service.dart';
// import 'package:socchat/ui/screen/home/home_viewmodel.dart';
// import 'package:socchat/ui/screen/other/user_provider.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final userProvider = Provider.of<UserProvider>(context);
//     return ChangeNotifierProvider(
//       create: (context) => HomeViewmodel(DatabaseService()),
//       child: Consumer<HomeViewmodel>(builder: (context, model, _) {
//         return Scaffold(
//           body: Center(
//             child: userProvider.user == null
//                 ? CircularProgressIndicator()
//                 : InkWell(
//                     onTap: () async {},
//                     child: Text(userProvider.user.toString())),
//           ),
//         );
//       }),
//     );
//   }
// }
