# BookReader ViewModels

The ViewModels module of the BookReader application contains the view models for the app's user interface. The view models handle the presentation logic for the views, and are responsible for processing user input and providing data to the views for display.

## Architecture

The view models are implemented using the MVVM (Model-View-ViewModel) design pattern. This pattern separates the user interface into three components:

- Model: Represents the data and business logic of the application.
- View: Renders the user interface and responds to user events.
- ViewModel: Sits between the view and the model, and provides a bridge between them. The view model exposes data from the model to the view in a way that is tailored to the view's needs, and it translates user input from the view into actions that the model can perform.

In the BookReader application, the view models are implemented in the `ViewModels.swift` file. The view models make use of the Combine framework to handle data flow and react to changes in the model.

## Usage

The view models are instantiated by the view controllers and passed to the views for use. The view controllers observe changes to the view models and update the views accordingly.

For example, the `ManyBookshelvesViewModel` is responsible for managing the user's collection of bookshelves. It provides an array of `BookshelfViewModel` instances to the view for display. When the user adds, removes, or renames a bookshelf, the view model updates the array and publishes the changes. The view controller observes these changes and updates the table view that displays the bookshelves.

## Testing

The view models are unit tested in the `ViewModelsTests.swift` file. The tests ensure that the view models correctly handle user input and update the model and view as expected.

## Contributing

Contributions to the BookReader application are welcome! If you find a bug or have a feature request, please open an issue on GitHub. If you would like to contribute code, please fork the repository and submit a pull request.

