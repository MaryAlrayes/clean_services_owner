// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:saudi_clean_services_owner/core/managers/color_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/font_manager.dart';
import 'package:saudi_clean_services_owner/core/managers/styles_manager.dart';
import 'package:saudi_clean_services_owner/features/profile/data/basic_service.dart';
import 'package:saudi_clean_services_owner/features/services/presentation/bloc/bloc/add_service_bloc.dart';
import 'package:saudi_clean_services_owner/features/services/presentation/bloc/bloc/edit_service_bloc.dart';

import '../../../../core/ui/widgets/custom_label.dart';
import 'provided_service_fields.dart';

class ProvidedServices extends StatefulWidget {
  final List<BasicService>? services;
  final bool isEdit;
  ProvidedServices({
    Key? key,
    required this.isEdit,
    this.services,
  }) : super(key: key);

  @override
  State<ProvidedServices> createState() => _ProvidedServicesState();
}

class _ProvidedServicesState extends State<ProvidedServices> {
  List<Widget> newService = [];
  int index = 0;
  @override
  void initState() {
    super.initState();

    if (widget.services != null) {
      index = widget.services!.length - 1;
      for (int i = 0; i < widget.services!.length; i++) {
        newService.add(_buildRowAddService(i,basicService: widget.services![i]));
      }
    } else {
      newService.add(_buildRowAddService(index));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomLabel(
            text:
                AppLocalizations.of(context)!.services_provided_with_the_item),
        _buildProvidedServicesList(),
        const SizedBox(
          height: 4,
        ),
        _buildAddBtn(context)
      ],
    );
  }

  ListView _buildProvidedServicesList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return newService[index];
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 4,
      ),
      itemCount: newService.length,
    );
  }

  Widget _buildRowAddService(int index,{BasicService? basicService}) {
    return ProviedServiceFields(
      onDeleteServiceCallback: onDeleteNewService,
      index: index,
      basicService:basicService,
      isEdit: widget.isEdit,
    );
  }

  Widget _buildAddBtn(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        if (widget.services == null) {
          BlocProvider.of<AddServiceBloc>(context).add(AddNewRowEvent());
        } else {
          BlocProvider.of<EditServiceBloc>(context).add(AddNewRowEditEvent());
        }

        onAddNewService();
      },
      icon: const Icon(Icons.add),
      label: Text(
        AppLocalizations.of(context)!.add_new_service_for_item,
        style: getBoldStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s16,
        ).copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
      style: TextButton.styleFrom(
        foregroundColor: ColorManager.primary,
      ),
    );
  }

  void onAddNewService() {
    setState(() {
      index++;
      newService.add(_buildRowAddService(index));
    });
  }

  void onDeleteNewService(int index) {
    setState(() {
      newService[index] = Container();
    });
  }
}
