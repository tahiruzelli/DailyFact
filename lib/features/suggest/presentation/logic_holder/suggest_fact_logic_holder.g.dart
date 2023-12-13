// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_fact_logic_holder.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SuggestFactLogicHolder on _SuggestFactLogicHolderBase, Store {
  late final _$selectedCategoryAtom = Atom(
      name: '_SuggestFactLogicHolderBase.selectedCategory', context: context);

  @override
  CategoryItem? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(CategoryItem? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$isAddSuggestButtonLoadingAtom = Atom(
      name: '_SuggestFactLogicHolderBase.isAddSuggestButtonLoading',
      context: context);

  @override
  bool get isAddSuggestButtonLoading {
    _$isAddSuggestButtonLoadingAtom.reportRead();
    return super.isAddSuggestButtonLoading;
  }

  @override
  set isAddSuggestButtonLoading(bool value) {
    _$isAddSuggestButtonLoadingAtom
        .reportWrite(value, super.isAddSuggestButtonLoading, () {
      super.isAddSuggestButtonLoading = value;
    });
  }

  @override
  String toString() {
    return '''
selectedCategory: ${selectedCategory},
isAddSuggestButtonLoading: ${isAddSuggestButtonLoading}
    ''';
  }
}
