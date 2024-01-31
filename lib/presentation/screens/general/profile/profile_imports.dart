import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:journo_blog/core/constants/my_colors.dart';
import 'package:journo_blog/data/repositories/repository.dart';
import 'package:journo_blog/presentation/router/router_imports.gr.dart';
import 'package:journo_blog/presentation/screens/general/profile/profile_model.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utils/utils.dart';

part 'profile.dart';
part 'profile_view_model.dart';
