# BookReader Main Module

BookReader is an iOS/Mac application that allows you to read different types of books seamlessly. The main module of the program is responsible for handling the overall application flow and user interactions.

## Architecture

The main module of the program is designed using the MVVM (Model-View-ViewModel) architecture pattern. The model layer consists of data models, which represent the data in the application. The view layer consists of SwiftUI views, which are responsible for displaying the user interface. The ViewModel layer acts as a bridge between the model and the view layers, providing data and business logic to the views.

The ViewModel layer uses Combine, a Swift framework for reactive programming, to communicate with the model layer and provide data to the view layer. The ViewModel layer also wraps PDFKit and some other GUI elements using UIKit to provide a seamless reading experience.

The program uses a plugin system, allowing users to download and use different plugins for different book sources. The plugin system is implemented using the Swift Package Manager.

## Summary

The main module of the BookReader program uses the MVVM architecture pattern to provide a seamless reading experience to users. The ViewModel layer acts as a bridge between the model and view layers, providing data and business logic to the views. The program also includes a plugin system, allowing users to download and use different plugins for different book sources. The plugin system is implemented using the Swift Package Manager.


