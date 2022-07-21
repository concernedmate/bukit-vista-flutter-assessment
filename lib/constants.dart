import 'package:responsive_framework/responsive_wrapper.dart';

//config ResponsiveWrapper
const double kResponsiveMinWidth = 480;
const double kResponsiveMaxWidth = 1200;
const kResponsiveBreakPoints = [
  ResponsiveBreakpoint.resize(480, name: MOBILE),
  ResponsiveBreakpoint.autoScale(768, name: TABLET),
];
const kResponsiveDefaultScale = true;
const double kResponsiveDefaultScaleFactor = 1;

//TODO replace in production
//'http://10.0.2.2:8000';
const kBASE_URL = 'http://10.0.2.2:8000';
