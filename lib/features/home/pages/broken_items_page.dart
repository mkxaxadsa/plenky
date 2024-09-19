import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../broken/bloc/broken_bloc.dart';
import '../widgets/broken_card.dart';

class BrokenItemsPage extends StatelessWidget {
  const BrokenItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'Broken items'),
          const SizedBox(height: 12),
          BlocBuilder<BrokenBloc, BrokenState>(
            builder: (context, state) {
              if (state is BrokenLoadedState) {
                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      const SizedBox(height: 12),
                      ...List.generate(
                        state.brokens.length,
                        (index) {
                          return BrokenCard(broken: state.brokens[index]);
                        },
                      ),
                      SizedBox(height: 6 + getBottom(context)),
                    ],
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
