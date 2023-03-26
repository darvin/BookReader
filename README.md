# BookReader



https://user-images.githubusercontent.com/309302/227768838-9c5f7142-8089-4fe2-84b3-784f360ba7e4.mp4



https://user-images.githubusercontent.com/309302/227768882-ee4138d5-a74f-49c4-bb8b-27be9fd6aa73.mp4




BookReader is a SwiftUI based iOS/Mac application for reading PDF books. It is designed using MVVM pattern and uses Combine and UIKit to wrap PDFKit and some other GUI elements. The application supports seamless zoom preserving scrolling, invert colors accessibility support, and programming languages syntax highlighting in the [PDF books](Plugins/PDFReader/README.md).

## Features

### Seamless Zoom Preserving Scrolling

BookReader provides a seamless reading experience with zoom preserving scrolling. You can zoom in and out of the PDF book, and the application preserves the position of the page, so you can continue reading where you left off without having to scroll back to the page you were reading.

### Invert Colors Accessibility Support

BookReader provides accessibility support by allowing users to invert colors. Invert Colors is an accessibility feature that makes it easier for users with visual impairments to read the content on the screen. BookReader makes use of the accessibility API in iOS/MacOS to implement this feature.

### Programming Languages Syntax Highlighting

BookReader supports syntax highlighting for programming languages in PDF books. If you are reading a programming book, BookReader will automatically highlight the syntax to make it easier to read and understand.

## Plugins

BookReader supports plugins, which allow you to extend the functionality of the application. The following plugins are available:

### [Gutenberg Library Catalogue](Plugins/GutenReader/README.md)

The Gutenberg Library Catalogue plugin allows you to search and download books from the Gutenberg library. The Gutenberg library contains over 60,000 free eBooks, which can be downloaded in various formats, including PDF. With the Gutenberg Library Catalogue plugin, you can easily find and download books from the Gutenberg library and read them in BookReader.

### [Fetching Books from Telegram Books](Plugins/TelegramReader/README.md)

The Fetching Books from Telegram Books plugin allows you to download books from Telegram channels that share books. You can configure the plugin to search for books in specific channels and download them automatically. Once downloaded, the books can be read in BookReader.

### [Quran Reading Synchronized with Recitation](Plugins/QuranReader/README.md)

The Quran Reading Synchronized with Recitation plugin allows you to read and listen to the Quran at the same time. The plugin synchronizes the recitation with the text, highlighting the current verse being recited. This plugin is especially useful for those who want to learn the Quran and memorize it.



## Getting Started

To get started with BookReader, follow the steps below:

1. Clone the repository using `git clone https://github.com/darvin/BookReader.git`
2. Open the project in Xcode
3. Build and run the project

## Usage

Once you have launched BookReader, you can open a PDF book by tapping on the "Open Book" button on the home screen. Once you have selected a book, it will be opened in the PDF reader.

You can use the seamless zoom preserving scrolling feature by pinching the screen to zoom in or out of the book. You can also use the invert colors accessibility support feature by going to Settings > Accessibility > Display & Text Size > Invert Colors.

If you are reading a programming book, BookReader will automatically highlight the syntax to make it easier to read and understand.

To use the plugins, you need to first install them from the Plugin Store. Once installed, you can configure them in the Settings screen.

## Contributing

Contributions to BookReader are welcome! If you find a bug or have a feature request, please open an issue. If you want to contribute code, please open a pull request.

## License

BookReader is released under the MIT License. See LICENSE for details.
