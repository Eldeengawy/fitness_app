import 'package:fitness_app/core/extensions/sized_box.dart';
import 'package:fitness_app/core/utils/colors.dart';
import 'package:fitness_app/modules/home/controller/home_cubit/home_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r), color: AppColors.blackD),
      child: Row(
        children: [
          Icon(
            FeatherIcons.search,
            color: AppColors.grey600,
            size: 24.sp,
          ),
          8.pw,
          Expanded(
            child: TextField(
              style: TextStyle(color: AppColors.grey600, fontSize: 16.sp),
              decoration: const InputDecoration(
                hintText: 'Search your workout ...',
                hintStyle: TextStyle(color: AppColors.grey600),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                HomeCubit.get(context).searchExercises(value);
                if (kDebugMode) {
                  print("Search query: $value");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
