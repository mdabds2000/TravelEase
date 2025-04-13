import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

TextStyle h1Style = TextStyle(
  fontSize: 23.sp,
  fontWeight: FontWeight.bold,
  fontFamily: 'PlusJakartaSans-Bold',
  color: Colors.black,
);

TextStyle h2Style = TextStyle(
  fontFamily: 'PlusJakartaSans-SemiBold',
  fontSize: 19.sp,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

TextStyle h3Style = TextStyle(
  fontSize: 17.sp,
  fontFamily: 'PlusJakartaSans-Regular',
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

        

TextStyle h4Style = TextStyle(
  fontSize: 15.sp,
  fontFamily: 'PlusJakartaSans-Regular',
  fontWeight: FontWeight.normal,
  color: Colors.black,
);

const bodyTextLight = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w600,
  color: Colors.black45,
);

const subtitleLight = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  color: Colors.black45,
);

final textFieldStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(25),
  borderSide: const BorderSide(color: Colors.transparent),
);

abstract class AppTextStyle {
  /// headingH1 figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 48px
  /// height: 150%
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle headingH1 = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 48,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );

  /// headingH2 figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 40px
  /// height: 150%
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle headingH2 = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 40,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  /// headingH3 figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 32px
  /// height: 150%
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle headingH3 = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 32,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  /// headingH4 figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 24px
  /// height: 150%
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle headingH4 = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 24,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  /// headingH5 figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 20px
  /// height: 150%
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle headingH5 = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  /// headingH6 figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 18px
  /// height: 150%
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle headingH6 = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 18,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  /// bodyBodyXLargeSemibold figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 24px
  /// height: 150%
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle bodyBodyXLargeSemibold = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 24,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  /// bodyBodyXLargeMedium figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 24px
  /// height: 150%
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle bodyBodyXLargeMedium = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 24,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  /// bodyBodyXLargeRegular figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 24px
  /// height: 150%
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle bodyBodyXLargeRegular = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 24,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  /// bodyBodyLargeSemibold figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 20px
  /// height: 150%
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle bodyBodyLargeSemibold = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  /// bodyBodyLargeMedium figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 20px
  /// height: 150%
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle bodyBodyLargeMedium = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  /// bodyBodyLargeRegular figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 20px
  /// height: 150%
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle bodyBodyLargeRegular = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  /// bodyBodyMd1Semibold figma properties
  /// fontFamily: Plus Jakarta Sans
  /// fontSize: 18px
  /// height: 150%
  /// fontWeight: 600
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static const TextStyle bodyBodyMd1Semibold = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 18,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyBodyMd1Medium = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 18,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyBodyMd1Regular = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 18,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyBodyMd2Semibold = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyBodyMd2Medium = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyBodyMd2Regular = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyBodySm1Semibold = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 14,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyBodySm1Medium = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 14,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyBodySm1Regular = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 14,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyBodySm2Semibold = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyBodySm2Medium = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyBodySm2Regular = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );
}
