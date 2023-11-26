import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars/repositories/repositories.dart';

class SearchState<T> extends Equatable {
  final String search;
  final int page;
  final bool loading;
  final List<T> itemList;

  const SearchState({
    required this.search,
    required this.page,
    required this.loading,
    required this.itemList,
  });

  @override
  List<Object> get props => [search, page, loading, itemList];

  SearchState<T> copyWith({
    String? search,
    int? page,
    bool? loading,
    List<T>? itemList,
  }) {
    return SearchState(
      search: search ?? this.search,
      page: page ?? this.page,
      loading: loading ?? this.loading,
      itemList: itemList ?? this.itemList,
    );
  }
}

sealed class SearchBlocEvent {}

final class FetchMoreEvent extends SearchBlocEvent {}

final class SearchEvent extends SearchBlocEvent {
  final String search;

  SearchEvent(this.search);
}

class SearchBloc<T> extends Bloc<SearchBlocEvent, SearchState<T>> {
  static const pageSize = 10;

  final RemoteRepository<T> remoteRepository;

  Future<void> fetchCurrentPage(Emitter<SearchState<T>> emit) async {
    final newItems = await remoteRepository.fetchMany(
      state.search,
      state.page,
    );
    emit(state.copyWith(
      loading: false,
      itemList: [...state.itemList, ...newItems],
    ));
  }

  SearchBloc(this.remoteRepository)
      : super(const SearchState(
          search: "",
          page: 1,
          loading: false,
          itemList: [],
        )) {
    on<FetchMoreEvent>((event, emit) async {
      if (state.search.length < 2 || state.loading) {
        return;
      }
      emit(state.copyWith(loading: true, page: state.page + 1));
      await fetchCurrentPage(emit);
    });

    on<SearchEvent>((event, emit) async {
      if (event.search.length < 2 || state.loading) {
        return;
      }
      emit(SearchState(
        search: event.search,
        page: 1,
        loading: true,
        itemList: const [],
      ));
      await fetchCurrentPage(emit);
    });
  }
}
