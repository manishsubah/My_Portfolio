import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/about/presentation/pages/about_page.dart';
import '../../features/skills/presentation/pages/skills_page.dart';
import '../../features/experience/presentation/pages/experience_page.dart';
import '../../features/projects/presentation/pages/projects_page.dart';
import '../../features/certifications/presentation/pages/certifications_page.dart';
import '../../features/resume/presentation/pages/resume_page.dart';
import '../../features/contact/presentation/pages/contact_page.dart';
import '../../presentation/pages/main_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: AboutRoute.page),
    AutoRoute(page: SkillsRoute.page),
    AutoRoute(page: ExperienceRoute.page),
    AutoRoute(page: ProjectsRoute.page),
    AutoRoute(page: CertificationsRoute.page),
    AutoRoute(page: ResumeRoute.page),
    AutoRoute(page: ContactRoute.page),
  ];
}

