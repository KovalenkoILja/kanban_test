import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_test/authentication/presentation/manager/authentication_bloc.dart';
import 'package:kanban_test/localization/app_localizations.dart';

class CardsAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(""),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            context
                .read<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested());
          },
          child: Icon(Icons.arrow_back_rounded, color: Colors.white),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            primary: Colors.greenAccent,
            onPrimary: Colors.red,
          ),
        ),
      ],
      bottom: TabBar(
        tabs: [
          Tab(text: AppLocalizations.of(context).translate('tab_bar_on_hold')),
          Tab(
              text: AppLocalizations.of(context)
                  .translate('tab_bar_in_progress')),
          Tab(
              text: AppLocalizations.of(context)
                  .translate('tab_bar_needs_review')),
          Tab(text: AppLocalizations.of(context).translate('tab_bar_approved')),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
