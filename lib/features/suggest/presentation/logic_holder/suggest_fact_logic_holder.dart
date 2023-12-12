import 'package:daily/features/categories/presentation/items/category_item.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
part 'suggest_fact_logic_holder.g.dart';

@injectable
class SuggestFactLogicHolder = _SuggestFactLogicHolderBase with _$SuggestFactLogicHolder;

abstract class _SuggestFactLogicHolderBase with Store {

  @observable
  CategoryItem? selectedCategory;
}