// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/core/utils/enums/enums.dart';
import 'package:saudi_clean_services_owner/features/profile/data/basic_service.dart';
import 'package:saudi_clean_services_owner/features/profile/data/laundry_service.dart';

part 'edit_service_event.dart';
part 'edit_service_state.dart';

class EditServiceBloc extends Bloc<EditServiceEvent, EditServiceState> {
  final LaundryService laundryService;
  EditServiceBloc({
    required this.laundryService,
  }) : super(
          EditServiceState(
              item: laundryService.item,
              services: laundryService.service,
              type: laundryService.serviceType,
              validation: EditServiceValidation.initiail),
        ) {
    on<ItemChangedEditEvent>((event, emit) {
      emit(state.copyWith(
          item: event.item,
          validation: EditServiceValidation.initiail));
    });

    on<ItemTypeChangedEditEvent>((event, emit) {
      emit(state.copyWith(
          type: event.type,
           validation: EditServiceValidation.initiail));
    });

    on<AddNewRowEditEvent>((event, emit) {
      BasicService basicService = BasicService.empty();
      List<BasicService> services = [];
      services.addAll(state.services);
      services.add(basicService);
      emit(state.copyWith(
          services: services,
            validation: EditServiceValidation.initiail));
    });

    on<NewServiceAddedEditEvent>((event, emit) {
      List<BasicService> services = [];
      services.addAll(state.services);
      if (event.index <= services.length - 1) {
        BasicService currentBasicService = state.services[event.index];
        BasicService newBasicService = BasicService(
            service: event.service, price: currentBasicService.price);

        print('edit');
        services[event.index] = newBasicService;
      } else {
        print('add');
        BasicService basicService =
            BasicService(service: event.service, price: 0);
        services.add(basicService);
      }
      emit(state.copyWith(
          services: services,
           validation: EditServiceValidation.initiail));
    });

    on<NewPriceAddedEditEvent>((event, emit) {
      List<BasicService> services = [];
      services.addAll(state.services);
      if (event.index <= services.length - 1) {
        BasicService currentBasicService = state.services[event.index];
        BasicService newBasicService = BasicService(
            service: currentBasicService.service, price: event.price);

        print('edit');
        services[event.index] = newBasicService;
      } else {
        print('add');
        BasicService basicService =
            BasicService(service: '', price: event.price);
        services.add(basicService);
      }
      emit(state.copyWith(
          services: services,
           validation: EditServiceValidation.initiail));
    });

    on<DeleteServiceEditEvent>((event, emit) {
      List<BasicService> services = [];
      services.addAll(state.services);
      if (event.index <= services.length - 1) {
        BasicService newBasicService = BasicService.ignore();

        print('edit');
        services[event.index] = newBasicService;
      } else {
        print('add');
      }
      emit(state.copyWith(
          services: services,
            validation: EditServiceValidation.initiail));
    });

    on<EditEvent>((event, emit) {
      if (state.item.isEmpty) {
        emit(state.copyWith(
            validation: EditServiceValidation.itemEmpty));
      } else {
        List<BasicService> validServices = [];

        bool isValid = false;
        int numOfIgnore = 0;
        print('length ${state.services.length}');

        for (int i = 0; i < state.services.length; i++) {
          String service = state.services[i].service;
          double price = state.services[i].price;
          if (service == '' || price == 0) {
            print('both empty');
            emit(state.copyWith(
                 validation: EditServiceValidation.emptyService));
            return;
          } else if (service.isNotEmpty && service != 'null' && price <= 0) {
            emit(state.copyWith(
                 validation: EditServiceValidation.priceNotValid));
            return;
          } else if (service == 'null' && price == double.infinity) {
            numOfIgnore++;
          } else if (service != 'null' && price != double.infinity) {
            validServices.add(state.services[i]);
            isValid = true;
          }
        }

        if (state.services.isEmpty || numOfIgnore == state.services.length) {
          emit(state.copyWith(
                validation: EditServiceValidation.noServices));
          return;
        }
        if (isValid) {
          emit(
            state.copyWith(
              services: validServices,
              validation: EditServiceValidation.valid,
            ),
          );
        }
      }
    });
  }
}
