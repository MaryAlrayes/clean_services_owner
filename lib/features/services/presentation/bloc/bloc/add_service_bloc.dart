import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services_owner/features/profile/data/basic_service.dart';

part 'add_service_event.dart';
part 'add_service_state.dart';

class AddServiceBloc extends Bloc<AddServiceEvent, AddServiceState> {
  AddServiceBloc() : super(AddServiceState.empty()) {
    on<ItemChangedEvent>((event, emit) {
      emit(state.copyWith(
          item: event.item,
          addServiceValidation: AddServiceValidation.initiail));
    });

    on<ItemTypeChangedEvent>((event, emit) {
      emit(state.copyWith(
          type: event.type,
          addServiceValidation: AddServiceValidation.initiail));
    });

    on<AddNewRowEvent>((event, emit) {
      BasicService basicService = BasicService.empty();
      List<BasicService> services = [];
      services.addAll(state.services);
      services.add(basicService);
      emit(state.copyWith(
          services: services,
          addServiceValidation: AddServiceValidation.initiail));
    });

    on<NewServiceAddedEvent>((event, emit) {
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
          addServiceValidation: AddServiceValidation.initiail));
    });

    on<NewPriceAddedEvent>((event, emit) {
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
          addServiceValidation: AddServiceValidation.initiail));
    });

    on<DeleteServiceEvent>((event, emit) {
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
          addServiceValidation: AddServiceValidation.initiail));
    });

    on<SubmitEvent>((event, emit) {
      if (state.item.isEmpty) {
        emit(state.copyWith(
            addServiceValidation: AddServiceValidation.itemEmpty));
      } else if (state.type.isEmpty) {
        emit(state.copyWith(
            addServiceValidation: AddServiceValidation.typeNotSelected));
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
                addServiceValidation: AddServiceValidation.emptyService));
            return;
          } else if (service.isNotEmpty && service != 'null' && price <= 0) {
            emit(state.copyWith(
                addServiceValidation: AddServiceValidation.priceNotValid));
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
              addServiceValidation: AddServiceValidation.noServices));
          return;
        }
        if (isValid) {
          emit(
            state.copyWith(
              services: validServices,
              addServiceValidation: AddServiceValidation.valid,
            ),
          );
        }
      }
    });
  }
}
