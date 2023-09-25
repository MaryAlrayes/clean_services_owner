
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../../../profile/data/basic_service.dart';
import '../bloc/bloc/add_service_bloc.dart';
import '../bloc/bloc/edit_service_bloc.dart';

class ProviedServiceFields extends StatelessWidget {
  final bool isEdit;
  final BasicService? basicService;
  final Function onDeleteServiceCallback;
  final int index;

  const ProviedServiceFields({
    Key? key,
    required this.isEdit,
    this.basicService,
    required this.onDeleteServiceCallback,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('basic service: $basicService');
    return Card(
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.all(
          AppPadding.p8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDeleteBtn(context),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildServiceField(context),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: _buildPriceField(context),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  OutlinedButton _buildDeleteBtn(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () {
        onDeleteServiceCallback(index);
        if (!isEdit) {
          BlocProvider.of<AddServiceBloc>(context)
              .add(DeleteServiceEvent(index: index));
        } else {
          BlocProvider.of<EditServiceBloc>(context)
              .add(DeleteServiceEditEvent(index: index));
        }
      },
      label: Text(
        AppLocalizations.of(context)!.delete,
        style: getRegularStyle(color: Colors.red),
      ),
    );
  }

  Column _buildServiceField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.service_field,
          style: getBoldStyle(
            color: ColorManager.primary,
            fontSize: FontSize.s16,
          ),
        ),
        CustomTextField(
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!.service_field,
            initalValue: basicService != null ? basicService!.service : null,
            validator: (String? value) {
              if (value!.isEmpty) {}
              return null;
            },
            onChanged: (String? value) {
              if (value != null) {
                if (!isEdit) {
                  BlocProvider.of<AddServiceBloc>(context).add(
                    NewServiceAddedEvent(
                      index: index,
                      service: value,
                    ),
                  );
                } else {
                  BlocProvider.of<EditServiceBloc>(context).add(
                    NewServiceAddedEditEvent(
                      index: index,
                      service: value,
                    ),
                  );
                }
              }
            },
            isObscure: false),
      ],
    );
  }

  Column _buildPriceField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.price,
          style: getBoldStyle(
            color: ColorManager.primary,
            fontSize: FontSize.s16,
          ),
        ),
        CustomTextField(
            textInputAction: TextInputAction.done,
            textInputType: const TextInputType.numberWithOptions(decimal: true),
            isNumber: true,
            hintText: '0.0',
            initalValue:
                basicService != null ? basicService!.price.toString() : null,
            validator: (String? value) {
              if (value!.isEmpty) {}
              return null;
            },
            onChanged: (String? value) {
              if (value != null) {
                if (double.tryParse(value) != null) {
                  if (! isEdit) {
                    BlocProvider.of<AddServiceBloc>(context).add(
                      NewPriceAddedEvent(
                        index: index,
                        price: double.tryParse(value)!.toDouble(),
                      ),
                    );
                  } else {
                    BlocProvider.of<EditServiceBloc>(context).add(
                      NewPriceAddedEditEvent(
                        index: index,
                        price: double.tryParse(value)!.toDouble(),
                      ),
                    );
                  }
                }
              }
            },
            isObscure: false),
      ],
    );
  }
}
