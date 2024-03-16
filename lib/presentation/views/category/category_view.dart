import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:joke_app/presentation/views/category/notifier/category_page_state.dart';
import 'package:joke_app/presentation/views/category/notifier/category_state_notifier.dart';
import 'package:joke_app/presentation/views/category_joke/notifier/category_joke_state_notifier.dart';
import 'package:joke_app/presentation/widgets/error_massage.dart';
import 'package:joke_app/routes/routes_location.dart';

class CategoryView extends ConsumerStatefulWidget {
  const CategoryView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryViewState();
}

class _CategoryViewState extends ConsumerState<CategoryView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(categoryPageStateProvider.notifier).getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(
      categoryPageStateProvider.select((p) => p.status),
    );

    return status == PageStatus.initial || status == PageStatus.loading
        ? const Center(child: CircularProgressIndicator())
        : Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final state = ref.watch(categoryPageStateProvider);

            return status == PageStatus.failure
                ? ErrorMassage(errorMsg: state.errorMsg)
                : SafeArea(
                    child: ListView.builder(
                        itemCount: state.categories.length,
                        itemBuilder: (_, int index) {
                          return InkWell(
                            onTap: () => _navigateToCategoryJoke(
                                state.categories[index]),
                            child: SizedBox(
                              height: 45,
                              child: Column(
                                children: [
                                  Text(state.categories[index]),
                                  const Divider()
                                ],
                              ),
                            ),
                          );
                        }),
                  );
          });
  }

  void _navigateToCategoryJoke(String category) {
    ref.read(categoryJokePageStateProvider.notifier).getCategoryJoke(category);
    context.push(RouteLocation.categoryJoke);
  }
}
