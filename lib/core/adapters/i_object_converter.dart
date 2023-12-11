
abstract class IObjectConvertor<T,U> {

  T from(U u);

  U to(T t);

}