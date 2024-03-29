// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

class NativeLibrary {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  NativeLibrary(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  NativeLibrary.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  Person create_person(
    ffi.Pointer<ffi.Char> name,
  ) {
    return _create_person(
      name,
    );
  }

  late final _create_personPtr =
      _lookup<ffi.NativeFunction<Person Function(ffi.Pointer<ffi.Char>)>>(
          'create_person');
  late final _create_person =
      _create_personPtr.asFunction<Person Function(ffi.Pointer<ffi.Char>)>();

  void print_person(
    Person person,
  ) {
    return _print_person(
      person,
    );
  }

  late final _print_personPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(Person)>>('print_person');
  late final _print_person =
      _print_personPtr.asFunction<void Function(Person)>();
}

final class Person extends ffi.Struct {
  external ffi.Pointer<ffi.Char> name;
}
