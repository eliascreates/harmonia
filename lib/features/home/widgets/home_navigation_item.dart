part of 'home_navigation_bar.dart';

class HomeNavigationItem extends StatelessWidget {
  const HomeNavigationItem({
    super.key,
    required this.currentIndex,
    required this.tab,
    required this.icon,
  });
  final int currentIndex;
  final HomeState tab;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Tooltip(
      
      message: tab.name,
      child: InkWell(
        onTap: () => context.read<HomeCubit>().changeTab(tab.index),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
            Icon(
              icon,
              size: 27,
              color: currentIndex == tab.index
                  ? theme.colorScheme.primary
                  : theme.colorScheme.secondary.withOpacity(0.5),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.fastLinearToSlowEaseIn,
              margin: EdgeInsets.only(
                top: tab.index == currentIndex ? 10 : 0,
                right: 15,
                left: 15,
              ),
              width: 45,
              height: tab.index == currentIndex ? 5 : 0,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
