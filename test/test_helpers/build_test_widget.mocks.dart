// Mocks generated by Mockito 5.4.2 from annotations
// in droidcon_flutter/test/test_helpers/build_test_widget.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:droidcon_flutter/src/domain/entities/task_entity.dart' as _i2;
import 'package:droidcon_flutter/src/domain/interfaces/i_data_source_facade.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTaskEntity_0 extends _i1.SmartFake implements _i2.TaskEntity {
  _FakeTaskEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IDataSourceFacade].
///
/// See the documentation for Mockito's code generation for more information.
class TaskDatabaseMock extends _i1.Mock
    implements _i3.IDataSourceFacade<_i2.TaskEntity> {
  TaskDatabaseMock() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.TaskEntity> initDatabase() => (super.noSuchMethod(
        Invocation.method(
          #initDatabase,
          [],
        ),
        returnValue: _i4.Future<_i2.TaskEntity>.value(_FakeTaskEntity_0(
          this,
          Invocation.method(
            #initDatabase,
            [],
          ),
        )),
      ) as _i4.Future<_i2.TaskEntity>);
  @override
  _i4.Future<_i2.TaskEntity?> create({required dynamic data}) =>
      (super.noSuchMethod(
        Invocation.method(
          #create,
          [],
          {#data: data},
        ),
        returnValue: _i4.Future<_i2.TaskEntity?>.value(),
      ) as _i4.Future<_i2.TaskEntity?>);
  @override
  _i4.Future<List<_i2.TaskEntity>> findMany() => (super.noSuchMethod(
        Invocation.method(
          #findMany,
          [],
        ),
        returnValue: _i4.Future<List<_i2.TaskEntity>>.value(<_i2.TaskEntity>[]),
      ) as _i4.Future<List<_i2.TaskEntity>>);
  @override
  _i4.Future<_i2.TaskEntity?> findOne({required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #findOne,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<_i2.TaskEntity?>.value(),
      ) as _i4.Future<_i2.TaskEntity?>);
  @override
  _i4.Future<_i2.TaskEntity?> update({
    required String? id,
    dynamic data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #update,
          [],
          {
            #id: id,
            #data: data,
          },
        ),
        returnValue: _i4.Future<_i2.TaskEntity?>.value(),
      ) as _i4.Future<_i2.TaskEntity?>);
  @override
  _i4.Future<bool> delete({required String? id}) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [],
          {#id: id},
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}