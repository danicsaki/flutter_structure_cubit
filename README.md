# app_structure_example

This app will be an example of what every folder and file i create will be used for, this structure will be based on the bloc architecture

## Structure

<pre>
├── assets
    ├── svg
    ├── images
    └── icons
├── lib
    ├── config
        ├── app_router.dart
        └── theme.dart
    ├── cubits
        ├── example
            ├── example_cubit.dart
            └── example_state.dart
        └── cubits.dart
    ├── models
        ├── example_model.dart
        └── models.dart
    ├── repositories
        ├── example
            ├── example_repository.dart
            └── base_example_repository.dart
        └── repositories.dart
    ├── screens
        ├── example
            ├── example_screen.dart   
        └── screens.dart
    ├── widgets
        ├── example_widget.dart
        └── widgets.dart
    └── main.dart
</pre>

## Folders description

- **assets** folder constains all the items we use to display on the screens
- **lib** folder contains all the code we have in this project
- **blocs** folder contains all the bloc login the app needs
- **config** folder contains files where are configurations needed in the app like routes and theme for example
- **models** folder contains all the models
- **repositories** folder contains al the files where the api calls are made and where the data is loading for the bloc to use
- **screens** folder contains all the screens the app will have
- **widgets** folder contains all the custom widgets needed in the app

## File type description

- **app_router.dart** this file holds all the names of the routes so the navigation should work

```dart
//example

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    debugPrint('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      //this way you add a new route, if you don't need arguments you leave the parantasys empty

      case ExampleScreen.routeName:
        return ExampleScreen.route(
            variable: settings.arguments as YourModel);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('error'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
```

- **theme.dart** this file contains the method of theme with the styles which will be called in the main file

```dart
//example

ThemeData theme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(0xFFFE3C5B, color),
      primaryColorDark: MaterialColor(0xFFFC0028, color),
      backgroundColor: const Color(0xFFF5F5F5),
    ),
    //here you add all the style data from your app
  );
}
```

- **cubits/models/repositories/screens/widgets.dart** this is a file of every file type just with the exports so when you import files to not import them separately but in just a file

```dart
//example

export 'example/example_screen.dart';
//or (depends on files)
export 'example_screen.dart';
```

- **example_cubit.dart** the cubit file contains methods which take the data from the repository and move them into the screens, in this example we have all the CRUD methods and how the states change in them. With **emit** you call the states and between them you call the data from the repository

```dart
part 'examples_state.dart';

class ExamplesCubit extends Cubit<ExamplesState> {
  final ExamplesRepository _repository;
  ExamplesCubit(this._repository) : super(ExamplesInitial());

  Future<void> getExamples() async {
    emit(ExamplesLoading());

    try {
      final response = await _repository.getExamples();
      emit(ExamplesLoaded(response));
    } on Exception {
      emit(ExamplesFailure());
    }
  }

  Future<void> addExample(Example example) async {
    try {
      await _repository.addExample(example);
      getExamples();
    } on Exception {
      emit(ExamplesFailure());
    }
  }

  Future<void> updateExample(String id, Example example) async {
    try {
      await _repository.updateExample(id, example);
      getExamples();
    } on Exception {
      emit(ExamplesFailure());
    }
  }

  Future<void> deleteExample(String id) async {
    try {
      await _repository.deleteExample(id);
      getExamples();
    } on Exception {
      emit(ExamplesFailure());
    }
  }
}
```

- **example_state.dart** in the states app we have the states a method can have, usually with starting with some initial data or loading them, after those we usually get the loaded data or an error, those ar few of the state we can have. in each state we can write code that is loaded specifically for that state

```dart
//example

part of 'examples_cubit.dart';

abstract class ExampleState {}

class ExampleInitial extends ExampleState {}

class ExampleLoading extends ExampleState {}

class ExampleLoaded extends ExampleState {}

class ExampleFailure extends ExampleState {}
```

- **example_model.dart** this file has the model based on Equatable which senses where a change is made for an entry of this model

```dart
//example

class Example extends Equatable {
  final String example;

  const CategoryFilter({
    required this.example,
  });

  //this method helps you to change the parameters
  CategoryFilter copyWith({
    String? example,
  }) {
    return CategoryFilter(
      example: example ?? this.example,
    );
  }

  @override
  List<Object?> get props => [example];
}
```

- **example_repository.dart** this file has the code that the data is called or updated from an api or a database

```dart
//example

class ExampleRepository extends BaseExampleRepository {
  String exampleUrl = 'your-url-goes-here';

  //the method can change on what you need, this is an example method
  @override
  Future<List<ExampleModel>> ExampleMethod() async {
    Response response = await get(Uri.parse(userUrl));

    //you can add different conditions based on the status you have
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => ExampleModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
```

- **base_example_repository.dart** this is an abstract file which has only the methods that the repository needs

```dart
//example

abstract class BaseExampleRepository {
  Future<List<ExampleModel>?> ExampleMethod() async {
    return null;
  }
}
```

- **example_screen.dart** this file is the screen template

```dart
//example

class ExampleScreen extends StatelessWidget {
  static const String routeName = '/your-route';

  const ExampleScreen({super.key});

  //this method is for building the route you use in the app_router.dart file
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const ExampleScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return //your screen goes here
  }
}
```

- **example_widget.dart** this file is the widget template

```dart
//example

class Example extends StatelessWidget {
  final String example;
  const Example({super.key, required this.example});

  @override
  Widget build(BuildContext context) {
    return //your widget goes here
  }
}
```
