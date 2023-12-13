import 'package:daily/features/categories/presentation/items/category_item.dart';
import 'package:daily/main.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'suggest_fact_logic_holder.g.dart';

@injectable
class SuggestFactLogicHolder = _SuggestFactLogicHolderBase
    with _$SuggestFactLogicHolder;

abstract class _SuggestFactLogicHolderBase with Store {
  @observable
  CategoryItem? selectedCategory;
  @observable
  bool isAddSuggestButtonLoading = false;

  Future<Either<String, bool>> addSuggest(String description) async {
    isAddSuggestButtonLoading = true;
    try {
      await firestore.collection("suggest").add(
        {
          "id": selectedCategory?.id,
          "title": selectedCategory?.title,
          "description": description,
        },
      );
      isAddSuggestButtonLoading = false;
      return const Right(true);
    } catch (e) {
      isAddSuggestButtonLoading = false;
      return Left(e.toString());
    }
  }
}
