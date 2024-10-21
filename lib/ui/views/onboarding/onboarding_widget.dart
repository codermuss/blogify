part of 'onboarding_view.dart';

class _OnboardingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const _OnboardingWidget({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [context.palette.greenPrimary, context.palette.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: Radiuses.b16r,
            child: Image.network(
              image,
              height: .4.sh,
              fit: BoxFit.cover,
            ),
          ),
          Spaces.verticalSpaceMedium,
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: context.palette.white,
                  letterSpacing: 1.2.w,
                ),
            textAlign: TextAlign.center,
          ),
          Spaces.verticalSpaceMedium,
          Text(
            description,
            style: AppTextStyles.bodyText3.copyWith(
              color: context.palette.white.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ).p16a,
    );
  }
}
