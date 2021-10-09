// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kachasi_mobile/src/core/navigation/navigation_service.dart';
// import 'package:kachasi_mobile/src/router/page_route_constants.dart';
// import 'package:kachasi_mobile/src/core/presentation/widgets/gradient_text.dart';
// import 'package:kachasi_mobile/src/general/on_boarding/presentation/cubit/on_boarding_cubit.dart';
// import 'package:kachasi_mobile/src/res/app_colors.dart';
// import 'package:kachasi_mobile/src/res/assets.dart';
// import 'package:kachasi_mobile/src/res/font_family.dart';
// import 'package:kachasi_mobile/src/res/gradients.dart';
// import 'package:kachasi_mobile/src/res/strings.dart';
//
// import '../../../../di/components/service_locator.dart';
//
// class OnBoardingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => OnBoardingCubit(getIt()),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 32),
//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage(Assets.welcomeScreenBackground), fit: BoxFit.cover),
//         ),
//         constraints: BoxConstraints.expand(),
//         child: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               const Spacer(
//                 flex: 5,
//               ),
//               const Image(
//                 image: AssetImage(Assets.whiteKachasiLogo),
//                 width: 200,
//                 height: 100,
//               ),
//               const Spacer(
//                 flex: 5,
//               ),
//               const Text(
//                 Strings.welcomeHeading,
//                 style: TextStyle(
//                   fontFamily: FontFamily.poppins,
//                   decoration: TextDecoration.none,
//                   fontSize: 34,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const Spacer(
//                 flex: 1,
//               ),
//               const Text(
//                 Strings.welcomeSubHeading,
//                 style: TextStyle(
//                   fontFamily: FontFamily.poppins,
//                   fontStyle: FontStyle.normal,
//                   fontWeight: FontWeight.normal,
//                   decoration: TextDecoration.none,
//                   fontSize: 12,
//                   color: Colors.white,
//                 ),
//                 softWrap: true,
//               ),
//               const Spacer(
//                 flex: 4,
//               ),
//               _CompleteOnBoardingButton(),
//               const Spacer(
//                 flex: 5,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _CompleteOnBoardingButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<OnBoardingCubit, OnBoardingState>(
//       listener: (context, state) {
//         if (state is OnBoardingCompleted) {
//           getIt<NavigationService>().navigateTo(PageRouteConstants.login_screen);
//         }
//       },
//       child: GestureDetector(
//         onTap: () async {
//           context.read<OnBoardingCubit>().completeOnBoarding();
//         },
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//           decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               const GradientText(
//                   text: Text(
//                     Strings.logIn,
//                     style: TextStyle(
//                       fontFamily: FontFamily.poppins,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                       decoration: TextDecoration.none,
//                       color: Colors.blue,
//                     ),
//                   ),
//                   gradient: Gradients.loginTextGradient),
//               const Icon(
//                 Icons.arrow_forward,
//                 color: AppColors.green,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
