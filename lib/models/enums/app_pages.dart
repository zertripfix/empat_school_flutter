enum AppPages {
  tabOne('/tab_one'),
  tabTwo('/tab_two'),
  tabThree('/tab_three'),

  tabOneDetail('tab_one_detail'),
  tabTwoDetail('tab_two_detail');

  const AppPages(this.path);
  final String path;
}
