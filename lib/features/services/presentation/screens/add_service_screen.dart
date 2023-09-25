import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/background.dart';

import '../../../../core/managers/values_manager.dart';
import '../../../../core/utils/helpers/snackbar.dart';
import '../bloc/bloc/add_service_bloc.dart';
import '../widgets/item_type_field.dart';
import '../widgets/provided_services.dart';
import '../widgets/service_type_drop_down.dart';

class AddServiceScreen extends StatelessWidget {
  static const routeName = 'add_service_screen';
  const AddServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddServiceBloc(),
      child: Builder(
        builder: (context) => BlocListener<AddServiceBloc, AddServiceState>(
          listener: (context, state) {
            if (state.addServiceValidation == AddServiceValidation.valid) {
              Navigator.pop(context);
            } else {
              _getSnackbar(context, state.addServiceValidation);
            }
          },
          child: Scaffold(
            persistentFooterButtons: [_buildPersistentBtns(context)],
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.add_service),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildItemName(),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildServiceType(),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildService(),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildPersistentBtns(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildAddBtn(context),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: _buildCancelBtn(
            context,
          ),
        ),
      ],
    );
  }

  ElevatedButton _buildCancelBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      child: Text(AppLocalizations.of(context)!.cancel),
    );
  }

  ElevatedButton _buildAddBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<AddServiceBloc>(context).add(
          SubmitEvent(),
        );
      },
      child: Text(AppLocalizations.of(context)!.add),
    );
  }

  Widget _buildItemName() {
    return  ItemTypeField();
  }

  Widget _buildServiceType() {
    return  ServiceTypeDropDown();
  }

  Widget _buildService() {
    return  ProvidedServices(isEdit: false,);
  }

  Widget _buildText() {
    return BlocBuilder<AddServiceBloc, AddServiceState>(
      builder: (context, state) {
        print('${state.services.toString()}');
        return Text(state.services.toString());
      },
    );
  }

  _getSnackbar(BuildContext context, AddServiceValidation validation) {
    switch (validation) {
      case AddServiceValidation.initiail:
        break;
      case AddServiceValidation.valid:
        break;
      case AddServiceValidation.itemEmpty:
        showSnackbar(
            context, AppLocalizations.of(context)!.item_type_missed_msg);
        break;
      case AddServiceValidation.typeNotSelected:
        showSnackbar(
            context, AppLocalizations.of(context)!.item_weight_missed_msg);
        break;
      case AddServiceValidation.emptyService:
        showSnackbar(
            context, AppLocalizations.of(context)!.empty_services_fields_msg);
        break;
      case AddServiceValidation.priceNotValid:
        showSnackbar(context, AppLocalizations.of(context)!.wrong_price_msg);
        break;
      case AddServiceValidation.noServices:
        showSnackbar(context,
            AppLocalizations.of(context)!.one_service_should_added_least);
        break;
    }
  }
}
