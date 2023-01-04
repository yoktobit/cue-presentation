// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'code_list.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveCodeListFormConsumer extends StatelessWidget {
  const ReactiveCodeListFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, CodeListForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCodeListForm.of(context);

    if (formModel is! CodeListForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class CodeListFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const CodeListFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final CodeListForm form;
}

class ReactiveCodeListForm extends StatelessWidget {
  const ReactiveCodeListForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final CodeListForm form;

  final WillPopCallback? onWillPop;

  static CodeListForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<CodeListFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        CodeListFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as CodeListFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return CodeListFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class CodeListFormBuilder extends StatefulWidget {
  const CodeListFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final CodeList? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, CodeListForm formModel, Widget? child) builder;

  final void Function(BuildContext context, CodeListForm formModel)? initState;

  @override
  _CodeListFormBuilderState createState() => _CodeListFormBuilderState();
}

class _CodeListFormBuilderState extends State<CodeListFormBuilder> {
  late FormGroup _form;

  late CodeListForm _formModel;

  @override
  void initState() {
    _form = FormGroup({});
    _formModel = CodeListForm(widget.model, _form, null);

    final elements = _formModel.formElements();
    _form.setValidators(elements.validators);
    _form.setAsyncValidators(elements.asyncValidators);

    if (elements.disabled) {
      _form.markAsDisabled();
    }

    _form.addAll(elements.controls);

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveCodeListForm(
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _form,
        onWillPop: widget.onWillPop,
        builder: (BuildContext context, FormGroup formGroup, Widget? child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class CodeListForm implements FormModel<CodeList> {
  CodeListForm(
    this.codeList,
    this.form,
    this.path,
  ) {
    definitionForm = CodeDefinitionForm(
        codeList?.definition, form, pathBuilder('definition'));
  }

  static String definitionControlName = "definition";

  late CodeDefinitionForm definitionForm;

  final CodeList? codeList;

  final FormGroup form;

  final String? path;

  String definitionControlPath() => pathBuilder(definitionControlName);
  CodeDefinition? get _definitionValue => definitionForm.model;
  bool get containsDefinition {
    try {
      form.control(definitionControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get definitionErrors => definitionControl?.errors;
  void get definitionFocus => form.focus(definitionControlPath());
  void definitionRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsDefinition) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          definitionControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            definitionControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void definitionValueUpdate(
    CodeDefinition? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    definitionControl?.updateValue(
        CodeDefinitionForm(value, FormGroup({}), null).formElements().rawValue,
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void definitionValuePatch(
    CodeDefinition? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    definitionControl?.updateValue(
        CodeDefinitionForm(value, form, null).formElements().rawValue,
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void definitionValueReset(
    CodeDefinition? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      definitionControl?.reset(
          value: CodeDefinitionForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  FormGroup? get definitionControl => containsDefinition
      ? form.control(definitionControlPath()) as FormGroup?
      : null;
  void definitionSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      definitionControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      definitionControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  CodeList get model {
    if (!form.valid) {
      debugPrint(
        'Prefer not to call `model` on non-valid form it could cause unexpected exceptions in case you created a non-nullable field in model and expect it to be guarded by some kind of `required` validator.',
      );
    }
    return CodeList(definition: _definitionValue, data: codeList?.data);
  }

  CodeListForm copyWithPath(String? path) {
    return CodeListForm(codeList, form, path);
  }

  void updateValue(
    CodeList value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(
          CodeListForm(value, FormGroup({}), null).formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void resetValue(
    CodeList value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value:
              CodeListForm(value, FormGroup({}), null).formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void reset({
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  FormGroup formElements() =>
      FormGroup({definitionControlName: definitionForm.formElements()},
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class CodeDefinitionForm implements FormModel<CodeDefinition> {
  CodeDefinitionForm(
    this.codeDefinition,
    this.form,
    this.path,
  ) {
    columnsCodeColumnForm = (codeDefinition?.columns ?? [])
        .asMap()
        .map((k, v) =>
            MapEntry(k, CodeColumnForm(v, form, pathBuilder("columns.$k"))))
        .values
        .toList();
  }

  static String nameControlName = "name";

  static String labelControlName = "label";

  static String columnsControlName = "columns";

  static String isSingleRecordControlName = "isSingleRecord";

  final CodeDefinition? codeDefinition;

  final FormGroup form;

  final String? path;

  late List<CodeColumnForm> columnsCodeColumnForm;

  String nameControlPath() => pathBuilder(nameControlName);
  String labelControlPath() => pathBuilder(labelControlName);
  String isSingleRecordControlPath() => pathBuilder(isSingleRecordControlName);
  String columnsControlPath() => pathBuilder(columnsControlName);
  String get _nameValue => nameControl.value as String;
  String get _labelValue => labelControl.value as String;
  bool get _isSingleRecordValue => isSingleRecordControl.value as bool;
  List<CodeColumn>? get _columnsValue => columnsCodeColumnForm
      .asMap()
      .map(
        (k, v) => MapEntry(
          k,
          v
              .copyWithPath(
                pathBuilder("columns.$k"),
              )
              .model,
        ),
      )
      .values
      .toList();
  bool get containsName {
    try {
      form.control(nameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLabel {
    try {
      form.control(labelControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsIsSingleRecord {
    try {
      form.control(isSingleRecordControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsColumns {
    try {
      form.control(columnsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get nameErrors => nameControl.errors;
  Object? get labelErrors => labelControl.errors;
  Object? get isSingleRecordErrors => isSingleRecordControl.errors;
  Object? get columnsErrors => columnsControl?.errors;
  void get nameFocus => form.focus(nameControlPath());
  void get labelFocus => form.focus(labelControlPath());
  void get isSingleRecordFocus => form.focus(isSingleRecordControlPath());
  void get columnsFocus => form.focus(columnsControlPath());
  void columnsRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsColumns) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          columnsControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            columnsControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void nameValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void labelValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    labelControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void isSingleRecordValueUpdate(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isSingleRecordControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void columnsValueUpdate(
    List<CodeColumn>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if ((value ?? []).isEmpty) {
      columnsClear(updateParent: updateParent, emitEvent: emitEvent);

      return;
    }

    final updateList = (value ?? [])
        .asMap()
        .map(
          (k, v) => MapEntry(
            k,
            CodeColumnForm(v, form, pathBuilder("columns.$k")),
          ),
        )
        .values
        .toList();

    columnsCodeColumnForm.clear();
    columnsCodeColumnForm.addAll(updateList);

    final toUpdate = <CodeColumnForm>[];
    final toAdd = <CodeColumnForm>[];

    updateList.asMap().forEach((k, v) {
      if (columnsCodeColumnForm.asMap().containsKey(k) &&
          (columnsControl?.value ?? []).asMap().containsKey(k)) {
        toUpdate.add(v);
      } else {
        toAdd.add(v);
      }
    });

    if (toUpdate.isNotEmpty) {
      columnsControl?.updateValue(
          toUpdate.map((e) => e.formElements().rawValue).toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
    }

    if (toAdd.isNotEmpty) {
      toAdd.forEach((e) {
        columnsControl?.add(e.formElements(),
            updateParent: updateParent, emitEvent: emitEvent);
      });
    }
  }

  void columnsInsert(
    int i,
    CodeColumn value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (columnsCodeColumnForm.length < i) {
      addColumnsItem(value);
      return;
    }

    final item = CodeColumnForm(
      value,
      form,
      pathBuilder('columns.$i'),
    );

    columnsCodeColumnForm.insert(i, item);

    columnsCodeColumnForm.asMap().forEach((k, v) {
      if (k > i) {
        columnsCodeColumnForm[k] = v.copyWithPath(
          pathBuilder("columns.$k"),
        );
      }
    });

    columnsControl?.insert(
      i,
      item.formElements(),
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void columnsClear({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    columnsCodeColumnForm.clear();
    columnsControl?.clear(updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void labelValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    labelControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void isSingleRecordValuePatch(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    isSingleRecordControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void columnsValuePatch(
    List<CodeColumn>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final keys = columnsCodeColumnForm.asMap().keys;

    final toPatch = <CodeColumnForm>[];
    (value ?? []).asMap().forEach(
      (k, v) {
        if (keys.contains(k)) {
          final patch = CodeColumnForm(v, form, pathBuilder("columns.$k"));
          columnsCodeColumnForm[k] = patch;
          toPatch.add(patch);
        }
      },
    );

    columnsControl?.patchValue(
        toPatch.map((e) => e.formElements().rawValue).toList(),
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void nameValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      nameControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void labelValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      labelControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void isSingleRecordValueReset(
    bool value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      isSingleRecordControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void columnsValueReset(
    List<CodeColumn>? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      columnsControl?.reset(
          value: value
              ?.map((e) => CodeColumnForm(e, FormGroup({}), null)
                  .formElements()
                  .rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
  FormControl<String> get nameControl =>
      form.control(nameControlPath()) as FormControl<String>;
  FormControl<String> get labelControl =>
      form.control(labelControlPath()) as FormControl<String>;
  FormControl<bool> get isSingleRecordControl =>
      form.control(isSingleRecordControlPath()) as FormControl<bool>;
  FormArray<Map<String, Object?>>? get columnsControl => containsColumns
      ? form.control(columnsControlPath()) as FormArray<Map<String, Object?>>?
      : null;
  void nameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      nameControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      nameControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void labelSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      labelControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      labelControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void isSingleRecordSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      isSingleRecordControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      isSingleRecordControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void columnsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      columnsControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      columnsControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  ExtendedControl<List<Map<String, Object?>?>, List<CodeColumnForm>>
      get columnsExtendedControl =>
          ExtendedControl<List<Map<String, Object?>?>, List<CodeColumnForm>>(
              form.control(columnsControlPath())
                  as FormArray<Map<String, Object?>>,
              () => columnsCodeColumnForm);
  void addColumnsItem(CodeColumn value) {
    final formClass = CodeColumnForm(
        value, form, pathBuilder('columns.${columnsCodeColumnForm.length}'));

    columnsCodeColumnForm.add(formClass);
    columnsControl?.add(formClass.formElements());
  }

  void removeColumnsItemAtIndex(int i) {
    if (columnsCodeColumnForm.asMap().containsKey(i) &&
        (columnsControl?.value ?? []).asMap().containsKey(i)) {
      columnsCodeColumnForm.removeAt(i);

      columnsCodeColumnForm.asMap().forEach((k, v) {
        columnsCodeColumnForm[k] = v.copyWithPath(pathBuilder("columns.$k"));
      });

      columnsControl?.removeAt(i);
    }
  }

  void addColumnsItemList(List<CodeColumn> value) {
    value.map((e) => addColumnsItem(e));
  }

  CodeDefinition get model {
    if (!form.valid) {
      debugPrint(
        'Prefer not to call `model` on non-valid form it could cause unexpected exceptions in case you created a non-nullable field in model and expect it to be guarded by some kind of `required` validator.',
      );
    }
    return CodeDefinition(
        name: _nameValue,
        label: _labelValue,
        columns: _columnsValue,
        id: codeDefinition?.id,
        isSingleRecord: _isSingleRecordValue);
  }

  CodeDefinitionForm copyWithPath(String? path) {
    return CodeDefinitionForm(codeDefinition, form, path);
  }

  void updateValue(
    CodeDefinition? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(
          CodeDefinitionForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void resetValue(
    CodeDefinition? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: CodeDefinitionForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void reset({
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  FormGroup formElements() => FormGroup({
        nameControlName: FormControl<String>(
            value: codeDefinition?.name,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        labelControlName: FormControl<String>(
            value: codeDefinition?.label,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        columnsControlName: FormArray(
            columnsCodeColumnForm.map((e) => e.formElements()).toList(),
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false),
        isSingleRecordControlName: FormControl<bool>(
            value: codeDefinition?.isSingleRecord,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class CodeColumnForm implements FormModel<CodeColumn> {
  CodeColumnForm(
    this.codeColumn,
    this.form,
    this.path,
  ) {}

  static String nameControlName = "name";

  static String labelControlName = "label";

  final CodeColumn? codeColumn;

  final FormGroup form;

  final String? path;

  String nameControlPath() => pathBuilder(nameControlName);
  String labelControlPath() => pathBuilder(labelControlName);
  String get _nameValue => nameControl.value as String;
  String get _labelValue => labelControl.value as String;
  bool get containsName {
    try {
      form.control(nameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLabel {
    try {
      form.control(labelControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get nameErrors => nameControl.errors;
  Object? get labelErrors => labelControl.errors;
  void get nameFocus => form.focus(nameControlPath());
  void get labelFocus => form.focus(labelControlPath());
  void nameValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void labelValueUpdate(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    labelControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    nameControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void labelValuePatch(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    labelControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      nameControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void labelValueReset(
    String value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      labelControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String> get nameControl =>
      form.control(nameControlPath()) as FormControl<String>;
  FormControl<String> get labelControl =>
      form.control(labelControlPath()) as FormControl<String>;
  void nameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      nameControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      nameControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void labelSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      labelControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      labelControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  CodeColumn get model {
    if (!form.valid) {
      debugPrint(
        'Prefer not to call `model` on non-valid form it could cause unexpected exceptions in case you created a non-nullable field in model and expect it to be guarded by some kind of `required` validator.',
      );
    }
    return CodeColumn(name: _nameValue, label: _labelValue);
  }

  CodeColumnForm copyWithPath(String? path) {
    return CodeColumnForm(codeColumn, form, path);
  }

  void updateValue(
    CodeColumn value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(
          CodeColumnForm(value, FormGroup({}), null).formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void resetValue(
    CodeColumn value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: CodeColumnForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void reset({
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  FormGroup formElements() => FormGroup({
        nameControlName: FormControl<String>(
            value: codeColumn?.name,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        labelControlName: FormControl<String>(
            value: codeColumn?.label,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveCodeListFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveCodeListFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(CodeListForm formModel)? control;

  final Widget Function(
          BuildContext context, List<Widget> itemList, CodeListForm formModel)?
      builder;

  final Widget Function(
      BuildContext context, int i, T? item, CodeListForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCodeListForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveCodeListFormFormGroupArrayBuilder<V> extends StatelessWidget {
  const ReactiveCodeListFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<V>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<V>> Function(
      CodeListForm formModel)? getExtended;

  final Widget Function(
          BuildContext context, List<Widget> itemList, CodeListForm formModel)?
      builder;

  final Widget Function(
      BuildContext context, int i, V? item, CodeListForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCodeListForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <V>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
