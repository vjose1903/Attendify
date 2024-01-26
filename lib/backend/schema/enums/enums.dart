import 'package:collection/collection.dart';

enum FormAction {
  create,
  edit,
}

enum TipoDocumentoIdentidad {
  cedula,
  pasaporte,
  rnc,
}

enum ToastType {
  error,
  success,
  info,
  warning,
  none,
}

enum ItemsDescriptionCollection {
  tipo_usuario,
  objeto_a_entregar,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (FormAction):
      return FormAction.values.deserialize(value) as T?;
    case (TipoDocumentoIdentidad):
      return TipoDocumentoIdentidad.values.deserialize(value) as T?;
    case (ToastType):
      return ToastType.values.deserialize(value) as T?;
    case (ItemsDescriptionCollection):
      return ItemsDescriptionCollection.values.deserialize(value) as T?;
    default:
      return null;
  }
}
