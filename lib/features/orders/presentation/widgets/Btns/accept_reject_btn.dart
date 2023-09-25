// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AcceptRejectBtn extends StatelessWidget {
  final bool isEqual;
  const AcceptRejectBtn({
    Key? key,
    required this.isEqual,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isEqual? _buildEquals(context): _buildNotEquals(context);
  }

  Row _buildNotEquals(BuildContext context) {
    return Row(
    children: [
      _buildAcceptBtn(context),
      const SizedBox(
        width: 4,
      ),
      _buildRejectBtn(context)
    ],
  );
  }


  Row _buildEquals(BuildContext context) {
    return Row(
    children: [
      Expanded(child: _buildAcceptBtn(context)),
      const SizedBox(
        width: 8,
      ),
      Expanded(child: _buildRejectBtn(context))
    ],
  );
  }

  ElevatedButton _buildRejectBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.all(
          0,
        ),
      ),
      child: Text(AppLocalizations.of(context)!.reject_btn),
    );
  }

  ElevatedButton _buildAcceptBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
      ),
      child: Text(AppLocalizations.of(context)!.accept_btn),
    );
  }
}
