import 'package:empat_school_flutter/models/enums/app_pages.dart';
import 'package:empat_school_flutter/views/main_view.dart';
import 'package:empat_school_flutter/views/tab_one.dart';
import 'package:empat_school_flutter/views/tab_one_detail.dart';
import 'package:empat_school_flutter/views/tab_three.dart';
import 'package:empat_school_flutter/views/tab_two.dart';
import 'package:empat_school_flutter/views/tab_two_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _tabOneNavigatorKey = GlobalKey<NavigatorState>();
final _tabTwoNavigatorKey = GlobalKey<NavigatorState>();
final _tabThreeNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppPages.tabOne.path,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _tabOneNavigatorKey,
          routes: [
            GoRoute(
              path: AppPages.tabOne.path,
              name: AppPages.tabOne.name,
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: TabOne()),
              routes: [
                GoRoute(
                  path: AppPages.tabOneDetail.path,
                  name: AppPages.tabOneDetail.name,
                  builder: (context, state) {
                    final options = state.extra as List<String>;
                    return TabOneDetail(options: options);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _tabTwoNavigatorKey,
          routes: [
            GoRoute(
              path: AppPages.tabTwo.path,
              name: AppPages.tabTwo.name,
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: TabTwo()),
              routes: [
                GoRoute(
                  path: AppPages.tabTwoDetail.path,
                  name: AppPages.tabTwoDetail.name,
                  builder: (context, state) => TabTwoDetail(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _tabThreeNavigatorKey,
          routes: [
            GoRoute(
              path: AppPages.tabThree.path,
              name: AppPages.tabThree.name,
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: TabThree()),
            ),
          ],
        ),
      ],
    ),
  ],
);
