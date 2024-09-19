import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../core/config/router.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../broken/bloc/broken_bloc.dart';
import '../widgets/broken_card.dart';
import '../widgets/no_broken.dart';
import '../widgets/total_repaired_card.dart';
import '../widgets/view_all_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const CustomAppbar(
                title: 'Repair items',
                home: true,
              ),
              const SizedBox(height: 12),
              BlocBuilder<BrokenBloc, BrokenState>(
                builder: (context, state) {
                  if (state is BrokenLoadedState) {
                    if (state.brokens.isEmpty) return const NoBroken();

                    return Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          const SizedBox(height: 12),
                          TotalRepairedCard(repaired: getTotalRepaired()),
                          const SizedBox(height: 24),
                          const ViewAllCard(),
                          const SizedBox(height: 14),
                          ...List.generate(
                            state.brokens.length,
                            (index) {
                              return BrokenCard(broken: state.brokens[index]);
                            },
                          ),
                          SizedBox(height: 120 + getBottom(context)),
                        ],
                      ),
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 40 + getBottom(context),
                left: 20,
                right: 20,
              ),
              child: PrimaryButton(
                title: '+ New Broken Item',
                onPressed: () {
                  context.push(Routes.add);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
