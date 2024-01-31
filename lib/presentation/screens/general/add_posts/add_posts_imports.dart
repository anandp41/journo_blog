import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:journo_blog/core/constants/my_colors.dart';
import 'package:journo_blog/data/repositories/repository.dart';
import 'package:journo_blog/presentation/router/router_imports.gr.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../enums/navigate_type.dart';
import '../categories/categories_model.dart';
import '../profile/profile_model.dart';
import '../tags/tags_model.dart';

part 'add_posts.dart';
part 'add_posts_view_model.dart';
