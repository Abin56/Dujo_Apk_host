

import 'package:dujo_application/controllers/database/database_hive.dart';
import 'package:dujo_application/firebase_options.dart';
import 'package:dujo_application/selct_language.dart';
import 'package:dujo_application/signing/appLoginInterface.dart';
import 'package:dujo_application/widget/permission.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'controllers/Bloc/Phone_otp/auth_cubit.dart';
import 'controllers/Bloc/Phone_otp/auth_state.dart';
import 'controllers/get_schoolList/getx_language.dart';

bool? seenonboard;
late Box<DBStudentList> studentdataDB;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenonboard = pref.getBool('seenonboard') ?? false;
  ScreenUtil.ensureScreenSize();
  requestpermission();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DBStudentListAdapter().typeId)) {
    Hive.registerAdapter(DBStudentListAdapter());
  }
  studentdataDB = await Hive.openBox<DBStudentList>('studentlist');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, device) {
      return ScreenUtilInit(
          designSize: const Size(423.5294196844927, 925.0980565145541),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return BlocProvider(
              create: (context) => AuthCubit(),
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                translations: GetxLanguage(),
                locale: Locale('en', 'US'),
                home: BlocBuilder<AuthCubit, AuthState>(
                  buildWhen: (oldstate, newstate) {
                    return oldstate is AuthInitialState;
                  },
                  builder: (context, state) {
                    if (state is AuthLoggedInState) {
                      return OpeningPage();
                    } else if (state is AuthLoggedOutState) {
                      return SelectLanguage();
                    }
                    return OpeningPage();
                  },
                ),

                // home:Onboardingpage(),
              ),
            );
          });
    });
  }
}
