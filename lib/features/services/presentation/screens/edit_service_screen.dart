// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/core/managers/values_manager.dart';
import 'package:saudi_clean_services_owner/core/ui/widgets/background.dart';
import 'package:saudi_clean_services_owner/core/utils/helpers/snackbar.dart';

import 'package:saudi_clean_services_owner/features/profile/data/laundry_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:saudi_clean_services_owner/features/services/presentation/bloc/bloc/edit_service_bloc.dart';
import 'package:saudi_clean_services_owner/features/services/presentation/widgets/item_type_field.dart';
import 'package:saudi_clean_services_owner/features/services/presentation/widgets/provided_services.dart';
import 'package:saudi_clean_services_owner/features/services/presentation/widgets/service_type_drop_down.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EditServiceScreen extends StatelessWidget {
  static const routeName = 'edit_service_screen';
  final LaundryService laundryService;
  const EditServiceScreen({
    Key? key,
    required this.laundryService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditServiceBloc(laundryService: laundryService),
      child: Builder(builder: (context) {
        return BlocListener<EditServiceBloc, EditServiceState>(
          listener: (context, state) {
            if (state.validation == EditServiceValidation.valid) {
              Navigator.pop(context);
            } else {
              _getSnackbar(context, state.validation);
            }
          },
          child: Scaffold(
            persistentFooterButtons: [_buildPersistentBtns(context)],
            appBar: AppBar(
              title:  Text(AppLocalizations.of(context)!.edit_service),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // _buildText(),
                        _buildItemName(),
                         const SizedBox(
                          height: 16,
                        ),
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
              ],
            ),
          ),
        );
      }),
    );
  }
  Widget _buildText() {
    return BlocBuilder<EditServiceBloc, EditServiceState>(
      builder: (context, state) {
        print('${state.services.toString()}');
        return Text(state.services.toString());
      },
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
        BlocProvider.of<EditServiceBloc>(context).add(
          EditEvent(),
        );
      },
      child: Text(AppLocalizations.of(context)!.edit),
    );
  }

  Widget _buildItemName() {
    return ItemTypeField(
      initValue: laundryService.item,
    );
  }

  Widget _buildServiceType() {
    return ServiceTypeDropDown(
      itemWeight: laundryService.serviceType,
    );
  }

  Widget _buildService() {

    return  ProvidedServices(services: laundryService.service,isEdit: true,);
  }

  _getSnackbar(BuildContext context, EditServiceValidation validation) {
    switch (validation) {
      case EditServiceValidation.initiail:
        break;
      case EditServiceValidation.valid:
        break;
      case EditServiceValidation.itemEmpty:
        showSnackbar(
            context, AppLocalizations.of(context)!.item_type_missed_msg);
        break;
      case EditServiceValidation.typeNotSelected:
        showSnackbar(
            context, AppLocalizations.of(context)!.item_weight_missed_msg);
        break;
      case EditServiceValidation.emptyService:
        showSnackbar(
            context, AppLocalizations.of(context)!.empty_services_fields_msg);
        break;
      case EditServiceValidation.priceNotValid:
        showSnackbar(context, AppLocalizations.of(context)!.wrong_price_msg);
        break;
      case EditServiceValidation.noServices:
        showSnackbar(context,
            AppLocalizations.of(context)!.one_service_should_added_least);
        break;
    }
  }
}
