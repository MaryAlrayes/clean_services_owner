import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/custom_label.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/extensions/extensions.dart';
import '../bloc/bloc/add_service_bloc.dart';
import '../bloc/bloc/edit_service_bloc.dart';

class ServiceTypeDropDown extends StatefulWidget {
  final ItemWeight? itemWeight;

  ServiceTypeDropDown({Key? key, this.itemWeight}) : super(key: key);

  @override
  State<ServiceTypeDropDown> createState() => _ServiceTypeDropDownState();
}

class _ServiceTypeDropDownState extends State<ServiceTypeDropDown> {
  ItemWeight? selected;
  @override
  void initState() {
    super.initState();
    selected = widget.itemWeight;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomLabel(text: AppLocalizations.of(context)!.item_weight),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),

          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppSize.s8,
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              child: DropdownButton<ItemWeight>(
                value: selected,
                hint: Text(AppLocalizations.of(context)!.choose_item_weight),
                items: ItemWeight.values
                    .map((e) => _buildDropMenuItem(context, e))
                    .toList(),
                onChanged: ((value) {
                  if (widget.itemWeight == null) {
                    BlocProvider.of<AddServiceBloc>(context).add(
                      ItemTypeChangedEvent(
                        type: value!.displayText(
                          context,
                        ),
                      ),
                    );
                  } else {
                    BlocProvider.of<EditServiceBloc>(context)
                        .add(ItemTypeChangedEditEvent(type: value!));
                  }
                  setState(() {
                    selected = value;
                  });
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<ItemWeight> _buildDropMenuItem(
      BuildContext context, ItemWeight e) {
    return DropdownMenuItem(
      value: e,
      child: Text(
        e.displayText(context),
        style: getRegularStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
