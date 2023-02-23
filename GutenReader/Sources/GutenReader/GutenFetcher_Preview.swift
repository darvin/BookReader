//
//  GutenFetcher_Preview.swift
//  BookReader
//
//  Created by standard on 2/8/23.
//

import Foundation
import SwiftUI
import Protocols

class GutenPreviewViewModel: Bookshelfable {
    var canLoadNextPage: Bool = false
    
    func fetchNextPageIfPossible() {
        
    }
    
    @State
    var books = GutenFetcher.dummyBooks
}

extension GutenFetcher {
    static let dummyBooks: [GutenBook] = [

        GutenBook(
            id: 19573,
            title: "Alice\'s Adventures in Wonderland",
            authors: [
                GutenAuthor(
                    name: "Carroll, Lewis",
                    birth_year: Optional(1832),
                    death_year: Optional(1898)
                )
            ],
            translators: [],
            subjects: [
                "Alice (Fictitious character from Carroll) -- Juvenile fiction",
                "Children\'s stories",
                "Fantasy fiction", "Imaginary places -- Juvenile fiction",
            ],
            bookshelves: ["Children\'s Literature"],
            formats: [
                "application/rdf+xml": "http://www.gutenberg.org/ebooks/19573.rdf",
                "text/html": "http://www.gutenberg.org/files/19573/19573-index.html",
                "audio/mpeg": "http://www.gutenberg.org/files/19573/mp3/19573-05.mp3",
                "application/zip": "http://www.gutenberg.org/files/19573/19573-ogg.zip",
                "audio/mp4": "http://www.gutenberg.org/files/19573/m4b/19573-10.m4b",
                "text/plain; charset=us-ascii": "http://www.gutenberg.org/files/19573/19573.txt",
                "audio/ogg": "http://www.gutenberg.org/files/19573/ogg/19573-08.ogg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.sound,
            download_count: 138
        ),  // 📓 Book #4929
        GutenBook(
            id: 19846,
            title:
                "Encyclopaedia Britannica, 11th Edition, \"Bulgaria\" to \"Calgary\": Volume 4, Part 4",
            authors: [GutenAuthor(name: "Various", birth_year: nil, death_year: nil)],
            translators: [],
            subjects: ["Encyclopedias and dictionaries"],
            bookshelves: ["Reference"],
            formats: [
                "text/html": "https://www.gutenberg.org/ebooks/19846.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/19846.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/19846.kf8.images",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/19846/19846-h/19846-h.htm",
                "text/plain": "https://www.gutenberg.org/ebooks/19846.txt.utf-8",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/19846/19846.txt",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/19846/19846-8.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/19846.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/19846/pg19846.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 138
        ),  // 📔 Book #4930
        GutenBook(
            id: 20001,
            title:
                "The English Spy: An Original Work Characteristic, Satirical, And Humorous.: Comprising Scenes And Sketches In Every Rank Of Society, Being Portraits Drawn From The Life",
            authors: [
                GutenAuthor(
                    name: "Westmacott, C. M. (Charles Molloy)",
                    birth_year: Optional(1787),
                    death_year: Optional(1868)
                )
            ],
            translators: [],
            subjects: [
                "England -- Social life and customs", "Satire, English",
                "University of Oxford -- Anecdotes",
            ],
            bookshelves: [],
            formats: [
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/20001/20001.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/20001.epub3.images",
                "text/html": "https://www.gutenberg.org/ebooks/20001.html.images",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/20001/20001-h/20001-h.htm",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/20001.rdf",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/20001/20001-8.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/20001/pg20001.cover.medium.jpg",
                "text/plain": "https://www.gutenberg.org/ebooks/20001.txt.utf-8",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/20001.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 138
        ),  // 📗 Book #4931

        GutenBook(
            id: 1513,
            title: "Romeo and Juliet",
            authors: [
                GutenAuthor(
                    name: "Shakespeare, William",
                    birth_year: Optional(1564),
                    death_year: Optional(1616)
                )
            ],
            translators: [],
            subjects: [
                "Conflict of generations -- Drama", "Juliet (Fictitious character) -- Drama",
                "Romeo (Fictitious character) -- Drama", "Tragedies", "Vendetta -- Drama",
                "Verona (Italy) -- Drama", "Youth -- Drama",
            ],
            bookshelves: [],
            formats: [
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1513.kf8.images",
                "text/plain": "https://www.gutenberg.org/ebooks/1513.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1513/pg1513.cover.medium.jpg",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1513.epub3.images",
                "application/octet-stream": "https://www.gutenberg.org/files/1513/1513-0.zip",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/1513/1513-0.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1513.rdf",
                "text/html": "https://www.gutenberg.org/ebooks/1513.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 198216
        ),  // 📓 Book #1
        GutenBook(
            id: 2641,
            title: "A Room with a View",
            authors: [
                GutenAuthor(
                    name: "Forster, E. M. (Edward Morgan)",
                    birth_year: Optional(1879),
                    death_year: Optional(1970)
                )
            ],
            translators: [],
            subjects: [
                "British -- Italy -- Fiction", "England -- Fiction", "Florence (Italy) -- Fiction",
                "Humorous stories", "Young women -- Fiction",
            ],
            bookshelves: ["Italy"],
            formats: [
                "application/epub+zip": "https://www.gutenberg.org/ebooks/2641.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/2641.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/2641/2641-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/2641.html.images",
                "text/plain": "https://www.gutenberg.org/ebooks/2641.txt.utf-8",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/2641.rdf",
                "application/octet-stream": "https://www.gutenberg.org/files/2641/2641-0.zip",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/2641/pg2641.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 165315
        ),  // 📔 Book #2
        GutenBook(
            id: 145,
            title: "Middlemarch",
            authors: [
                GutenAuthor(
                    name: "Eliot, George",
                    birth_year: Optional(1819),
                    death_year: Optional(1880)
                )
            ],
            translators: [],
            subjects: [
                "Bildungsromans", "City and town life -- Fiction", "Didactic fiction",
                "Domestic fiction",
                "England -- Fiction", "Love stories", "Married people -- Fiction",
                "Young women -- Fiction",
            ],
            bookshelves: ["Best Books Ever Listings", "Historical Fiction"],
            formats: [
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/145/145-0.txt",
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/145.kf8.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/145.epub3.images",
                "application/octet-stream": "https://www.gutenberg.org/files/145/145-0.zip",
                "text/html": "https://www.gutenberg.org/ebooks/145.html.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/145.rdf",
                "text/plain": "https://www.gutenberg.org/ebooks/145.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/145/pg145.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 156630
        ),  // 📗 Book #3
        GutenBook(
            id: 2701,
            title: "Moby Dick; Or, The Whale",
            authors: [
                GutenAuthor(
                    name: "Melville, Herman",
                    birth_year: Optional(1819),
                    death_year: Optional(1891)
                )
            ],
            translators: [],
            subjects: [
                "Adventure stories", "Ahab, Captain (Fictitious character) -- Fiction",
                "Mentally ill -- Fiction", "Psychological fiction", "Sea stories",
                "Ship captains -- Fiction", "Whales -- Fiction", "Whaling -- Fiction",
                "Whaling ships -- Fiction",
            ],
            bookshelves: ["Best Books Ever Listings"],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/2701.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/2701/pg2701.cover.medium.jpg",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/2701/2701-h/2701-h.htm",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/2701.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/2701.html.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/2701/2701-0.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/2701.epub3.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 139320
        ),  // 📘 Book #4

        GutenBook(
            id: 78,
            title: "Tarzan of the Apes",
            authors: [
                GutenAuthor(
                    name: "Burroughs, Edgar Rice",
                    birth_year: Optional(1875),
                    death_year: Optional(1950)
                )
            ],
            translators: [],
            subjects: [
                "Adventure stories", "Africa -- Fiction", "British -- Africa -- Fiction",
                "Fantasy fiction",
                "Tarzan (Fictitious character) -- Fiction", "Wild men -- Fiction",
            ],
            bookshelves: ["Adventure", "Movie Books"],
            formats: [
                "application/epub+zip": "https://www.gutenberg.org/ebooks/78.epub3.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/78/78-0.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/78.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/78/pg78.cover.medium.jpg",
                "text/html": "https://www.gutenberg.org/ebooks/78.html.images",
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/78.kf8.images",
                "text/html; charset=iso-8859-1": "https://www.gutenberg.org/files/78/78-h/78-h.htm",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1080
        ),  // 📗 Book #591
        GutenBook(
            id: 35688,
            title:
                "Alice in Wonderland: A Dramatization of Lewis Carroll\'s \"Alice\'s Adventures in Wonderland\" and \"Through the Looking Glass\"",
            authors: [
                GutenAuthor(
                    name: "Carroll, Lewis",
                    birth_year: Optional(1832),
                    death_year: Optional(1898)
                ),
                GutenAuthor(
                    name: "Gerstenberg, Alice",
                    birth_year: Optional(1885),
                    death_year: Optional(1972)
                ),
            ],
            translators: [],
            subjects: ["Children\'s plays", "Fantasy drama"],
            bookshelves: [],
            formats: [
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/35688/35688.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/35688.epub3.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/35688/pg35688.cover.medium.jpg",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/35688/35688-h/35688-h.htm",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/35688.rdf",
                "text/html": "https://www.gutenberg.org/ebooks/35688.html.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/35688.kf8.images",
                "text/plain": "https://www.gutenberg.org/ebooks/35688.txt.utf-8",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1080
        ),  // 📘 Book #592
        GutenBook(
            id: 2166,
            title: "King Solomon\'s Mines",
            authors: [
                GutenAuthor(
                    name: "Haggard, H. Rider (Henry Rider)",
                    birth_year: Optional(1856),
                    death_year: Optional(1925)
                )
            ],
            translators: [],
            subjects: [
                "Adventure stories", "Africa -- Fiction", "Diamond mines and mining -- Fiction",
                "Hunting guides -- Fiction", "Missing persons -- Fiction",
                "Quatermain, Allan (Fictitious character) -- Fiction", "Treasure troves -- Fiction",
            ],
            bookshelves: ["Adventure", "Best Books Ever Listings", "Movie Books"],
            formats: [
                "application/epub+zip": "https://www.gutenberg.org/ebooks/2166.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/2166.kf8.images",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/2166/2166-h/2166-h.htm",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/2166/pg2166.cover.medium.jpg",
                "text/html": "https://www.gutenberg.org/ebooks/2166.html.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/2166/2166-0.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/2166.rdf",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1079
        ),  // 📙 Book #593
        GutenBook(
            id: 28497,
            title: "Myths of the Norsemen: From the Eddas and Sagas",
            authors: [
                GutenAuthor(
                    name: "Guerber, H. A. (Hélène Adeline)",
                    birth_year: Optional(1859),
                    death_year: Optional(1929)
                )
            ],
            translators: [],
            subjects: ["Mythology, Norse"],
            bookshelves: ["Paganism"],
            formats: [
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/28497/28497.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/28497.kf8.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/28497/pg28497.cover.medium.jpg",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/28497/28497-h/28497-h.htm",
                "text/plain": "https://www.gutenberg.org/ebooks/28497.txt.utf-8",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/28497/28497-8.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/28497.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/28497.rdf",
                "text/html": "https://www.gutenberg.org/ebooks/28497.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1079
        ),  // 📕 Book #594
        GutenBook(
            id: 66048,
            title: "The Interpretation of Dreams",
            authors: [
                GutenAuthor(
                    name: "Freud, Sigmund",
                    birth_year: Optional(1856),
                    death_year: Optional(1939)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "Brill, A. A. (Abraham Arden)",
                    birth_year: Optional(1874),
                    death_year: Optional(1948)
                )
            ],
            subjects: ["Dream interpretation", "Psychoanalysis"],
            bookshelves: [],
            formats: [
                "application/epub+zip": "https://www.gutenberg.org/ebooks/66048.epub3.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/66048/66048-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/66048.html.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/66048.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/66048.kf8.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/66048/pg66048.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1077
        ),  // 📒 Book #595
        GutenBook(
            id: 601,
            title: "The Monk: A Romance",
            authors: [
                GutenAuthor(
                    name: "Lewis, M. G. (Matthew Gregory)",
                    birth_year: Optional(1775),
                    death_year: Optional(1818)
                )
            ],
            translators: [],
            subjects: [
                "Gothic fiction", "Horror tales", "Madrid (Spain) -- Fiction", "Monks -- Fiction",
            ],
            bookshelves: ["Best Books Ever Listings", "Gothic Fiction"],
            formats: [
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/601/601-0.txt",
                "text/plain": "https://www.gutenberg.org/ebooks/601.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/601/pg601.cover.medium.jpg",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/601.rdf",
                "application/octet-stream": "https://www.gutenberg.org/files/601/601-0.zip",
                "text/html": "https://www.gutenberg.org/ebooks/601.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/601.epub3.images",
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/601.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1076
        ),  // 📓 Book #596
        GutenBook(
            id: 69702,
            title: "A backwoods princess",
            authors: [
                GutenAuthor(
                    name: "Footner, Hulbert",
                    birth_year: Optional(1879),
                    death_year: Optional(1944)
                )
            ],
            translators: [],
            subjects: [
                "Inheritance and succession -- Fiction", "Northwest, Canadian -- Fiction",
                "Trading posts -- Fiction", "Young women -- Fiction",
            ],
            bookshelves: [],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/69702.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/69702.kf8.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/69702.epub3.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/69702/pg69702.cover.medium.jpg",
                "application/octet-stream": "https://www.gutenberg.org/files/69702/69702-0.zip",
                "text/html": "https://www.gutenberg.org/ebooks/69702.html.images",
                "text/plain": "https://www.gutenberg.org/ebooks/69702.txt.utf-8",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/69702/69702-0.txt",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1074
        ),  // 📔 Book #597
        GutenBook(
            id: 1929,
            title: "The School for Scandal",
            authors: [
                GutenAuthor(
                    name: "Sheridan, Richard Brinsley",
                    birth_year: Optional(1751),
                    death_year: Optional(1816)
                )
            ],
            translators: [],
            subjects: [
                "Comedies", "England -- Social life and customs -- 18th century -- Drama",
                "English drama -- 18th century",
                "Nobility -- England -- History -- 18th century -- Drama",
            ],
            bookshelves: ["Harvard Classics"],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1929.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1929/pg1929.cover.medium.jpg",
                "text/html": "https://www.gutenberg.org/ebooks/1929.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1929.epub3.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/1929/1929.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1929.kf8.images",
                "text/html; charset=us-ascii":
                    "https://www.gutenberg.org/files/1929/1929-h/1929-h.htm",
                "text/plain": "https://www.gutenberg.org/ebooks/1929.txt.utf-8",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1070
        ),  // 📗 Book #598
        GutenBook(
            id: 544,
            title: "Anne\'s House of Dreams",
            authors: [
                GutenAuthor(
                    name: "Montgomery, L. M. (Lucy Maud)",
                    birth_year: Optional(1874),
                    death_year: Optional(1942)
                )
            ],
            translators: [],
            subjects: [
                "Canada -- History -- 1867-1914 -- Fiction",
                "Country life -- Prince Edward Island -- Fiction", "Friendship -- Fiction",
                "Marriage -- Fiction", "Orphans -- Fiction",
                "Prince Edward Island -- History -- 20th century -- Fiction",
                "Shirley, Anne (Fictitious character) -- Fiction", "Young women -- Fiction",
            ],
            bookshelves: ["Canada", "Children\'s Literature"],
            formats: [
                "image/jpeg": "https://www.gutenberg.org/cache/epub/544/pg544.cover.medium.jpg",
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/544.kf8.images",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/544/544-h/544-h.htm",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/544.rdf",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/544.epub3.images",
                "text/html": "https://www.gutenberg.org/ebooks/544.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/544/544.txt",
                "text/plain": "https://www.gutenberg.org/ebooks/544.txt.utf-8",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1069
        ),  // 📘 Book #599
        GutenBook(
            id: 1280,
            title: "Spoon River Anthology",
            authors: [
                GutenAuthor(
                    name: "Masters, Edgar Lee",
                    birth_year: Optional(1868),
                    death_year: Optional(1950)
                )
            ],
            translators: [],
            subjects: ["American poetry"],
            bookshelves: [],
            formats: [
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1280/pg1280.cover.medium.jpg",
                "text/plain": "https://www.gutenberg.org/ebooks/1280.txt.utf-8",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1280.rdf",
                "application/octet-stream": "https://www.gutenberg.org/files/1280/1280-0.zip",
                "text/html": "https://www.gutenberg.org/ebooks/1280.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/1280/1280-0.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1280.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1280.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1069
        ),  // 📙 Book #600
        GutenBook(
            id: 3623,
            title: "The Golden Bough: A Study of Magic and Religion",
            authors: [
                GutenAuthor(
                    name: "Frazer, James George",
                    birth_year: Optional(1854),
                    death_year: Optional(1941)
                )
            ],
            translators: [],
            subjects: ["Magic", "Mythology", "Religion", "Superstition"],
            bookshelves: ["Anthropology", "Mythology", "Paganism"],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/3623.rdf",
                "text/plain; charset=iso-8859-1": "https://www.gutenberg.org/files/3623/3623-8.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/3623.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/3623.html.images",
                "text/plain": "https://www.gutenberg.org/ebooks/3623.txt.utf-8",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/3623.epub3.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/3623/pg3623.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1069
        ),  // 📕 Book #601
        GutenBook(
            id: 14417,
            title:
                "The Agamemnon of Aeschylus: Translated into English Rhyming Verse with Explanatory Notes",
            authors: [
                GutenAuthor(
                    name: "Aeschylus",
                    birth_year: Optional(-525),
                    death_year: Optional(-456)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "Murray, Gilbert",
                    birth_year: Optional(1866),
                    death_year: Optional(1957)
                )
            ],
            subjects: ["Agamemnon, King of Mycenae (Mythological character) -- Drama"],
            bookshelves: ["Classical Antiquity", "Harvard Classics"],
            formats: [
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/14417/14417-h/14417-h.htm",
                "text/html": "https://www.gutenberg.org/ebooks/14417.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/14417/14417.txt",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/14417/14417-8.txt",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/14417/14417-0.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/14417.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/14417/pg14417.cover.medium.jpg",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/14417.kf8.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/14417.epub3.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1068
        ),  // 📒 Book #602
        GutenBook(
            id: 171,
            title: "Charlotte Temple",
            authors: [
                GutenAuthor(
                    name: "Rowson, Mrs.",
                    birth_year: Optional(1762),
                    death_year: Optional(1824)
                )
            ],
            translators: [],
            subjects: [
                "Betrayal -- Fiction", "British -- New York (State) -- New York -- Fiction",
                "Didactic fiction", "Elopement -- Fiction", "Illegitimate children -- Fiction",
                "New York (N.Y.) -- Fiction", "Psychological fiction",
                "Runaway teenagers -- Fiction",
                "Seduction -- Fiction", "Soldiers -- Fiction", "Teenage girls -- Fiction",
                "Teenage pregnancy -- Fiction",
            ],
            bookshelves: [],
            formats: [
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/171.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/171.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/171/171.txt",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/171/171-0.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/171/pg171.cover.medium.jpg",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/171.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/171.rdf",
                "text/html; charset=utf-8": "https://www.gutenberg.org/files/171/171-h/171-h.htm",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1066
        ),  // 📓 Book #603
        GutenBook(
            id: 246,
            title: "The Rubaiyat of Omar Khayyam",
            authors: [
                GutenAuthor(
                    name: "Omar Khayyam",
                    birth_year: Optional(1048),
                    death_year: Optional(1122)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "FitzGerald, Edward",
                    birth_year: Optional(1809),
                    death_year: Optional(1883)
                )
            ],
            subjects: ["Persian poetry -- Translations into English"],
            bookshelves: [],
            formats: [
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/246.kf8.images",
                "text/plain": "https://www.gutenberg.org/ebooks/246.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/246/pg246.cover.medium.jpg",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/246/246.txt",
                "text/html; charset=us-ascii":
                    "https://www.gutenberg.org/files/246/246-h/246-h.htm",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/246.rdf",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/246.epub3.images",
                "text/html": "https://www.gutenberg.org/ebooks/246.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1066
        ),  // 📔 Book #604
        GutenBook(
            id: 7524,
            title: "The Germany and the Agricola of Tacitus",
            authors: [
                GutenAuthor(
                    name: "Tacitus, Cornelius",
                    birth_year: Optional(56),
                    death_year: Optional(117)
                )
            ],
            translators: [],
            subjects: [
                "Agricola, Gnaeus Julius, 40-93", "Germanic peoples -- Early works to 1800",
                "Statesmen -- Rome -- Biography -- Early works to 1800",
            ],
            bookshelves: ["Classical Antiquity", "Germany"],
            formats: [
                "text/plain; charset=iso-8859-1": "https://www.gutenberg.org/files/7524/7524-8.txt",
                "text/plain": "https://www.gutenberg.org/ebooks/7524.txt.utf-8",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/7524.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/7524.rdf",
                "text/html": "https://www.gutenberg.org/ebooks/7524.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/7524/7524.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/7524.kf8.images",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/7524/7524-h/7524-h.htm",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/7524/pg7524.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1066
        ),  // 📗 Book #605
        GutenBook(
            id: 1717,
            title: "What\'s Wrong with the World",
            authors: [
                GutenAuthor(
                    name: "Chesterton, G. K. (Gilbert Keith)",
                    birth_year: Optional(1874),
                    death_year: Optional(1936)
                )
            ],
            translators: [],
            subjects: ["Social problems"],
            bookshelves: [],
            formats: [
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/1717/1717-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/1717.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1717.epub3.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1717/pg1717.cover.medium.jpg",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/1717/1717.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1717.kf8.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1717.rdf",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/1717/1717-h/1717-h.htm",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1062
        ),  // 📘 Book #606
        GutenBook(
            id: 14640,
            title: "McGuffey\'s First Eclectic Reader, Revised Edition",
            authors: [
                GutenAuthor(
                    name: "McGuffey, William Holmes",
                    birth_year: Optional(1800),
                    death_year: Optional(1873)
                )
            ],
            translators: [],
            subjects: ["Readers"],
            bookshelves: ["Children\'s Instructional Books"],
            formats: [
                "application/epub+zip": "https://www.gutenberg.org/ebooks/14640.epub3.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/14640/pg14640.cover.medium.jpg",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/14640.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/14640.kf8.images",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/14640/14640-8.txt",
                "text/html": "https://www.gutenberg.org/ebooks/14640.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/14640/14640.txt",
                "application/msword": "https://www.gutenberg.org/files/14640/14640-doc.doc",
                "application/pdf": "https://www.gutenberg.org/files/14640/14640-pdf.pdf",
                "text/plain": "https://www.gutenberg.org/ebooks/14640.txt.utf-8",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1058
        ),  // 📙 Book #607
        GutenBook(
            id: 233,
            title: "Sister Carrie: A Novel",
            authors: [
                GutenAuthor(
                    name: "Dreiser, Theodore",
                    birth_year: Optional(1871),
                    death_year: Optional(1945)
                )
            ],
            translators: [],
            subjects: [
                "Chicago (Ill.) -- Fiction", "Didactic fiction", "Mistresses -- Fiction",
                "New York (N.Y.) -- Fiction", "Young women -- Fiction",
            ],
            bookshelves: [],
            formats: [
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/233.kf8.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/233.rdf",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/233/233-0.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/233.epub3.images",
                "text/plain": "https://www.gutenberg.org/ebooks/233.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/233/pg233.cover.medium.jpg",
                "application/octet-stream": "https://www.gutenberg.org/files/233/233-0.zip",
                "text/html": "https://www.gutenberg.org/ebooks/233.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1054
        ),  // 📕 Book #608
        //🌐 curl http://gutendex.com/books/?page=21
        GutenBook(
            id: 325,
            title: "Phantastes: A Faerie Romance for Men and Women",
            authors: [
                GutenAuthor(
                    name: "MacDonald, George",
                    birth_year: Optional(1824),
                    death_year: Optional(1905)
                )
            ],
            translators: [],
            subjects: ["Fantasy fiction"],
            bookshelves: [],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/325.rdf",
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/325.kf8.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/325.epub3.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/325/325-0.txt",
                "text/html; charset=utf-8": "https://www.gutenberg.org/files/325/325-h/325-h.htm",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/325/pg325.cover.medium.jpg",
                "text/html": "https://www.gutenberg.org/ebooks/325.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1054
        ),  // 📒 Book #609
        GutenBook(
            id: 1450,
            title: "Pollyanna",
            authors: [
                GutenAuthor(
                    name: "Porter, Eleanor H. (Eleanor Hodgman)",
                    birth_year: Optional(1868),
                    death_year: Optional(1920)
                )
            ],
            translators: [],
            subjects: [
                "Aunts -- Juvenile fiction", "Cheerfulness -- Juvenile fiction",
                "Conduct of life -- Juvenile fiction",
                "Interpersonal relations -- Juvenile fiction",
                "Orphans -- Juvenile fiction",
                "Vermont -- History -- 20th century -- Juvenile fiction",
            ],
            bookshelves: ["Bestsellers, American, 1895-1923"],
            formats: [
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1450/pg1450.cover.medium.jpg",
                "text/html": "https://www.gutenberg.org/ebooks/1450.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/1450/1450.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1450.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1450.rdf",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/1450/1450-h/1450-h.htm",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1450.kf8.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/1450/1450-0.txt",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1054
        ),  // 📓 Book #610
        GutenBook(
            id: 1064,
            title: "The Masque of the Red Death",
            authors: [
                GutenAuthor(
                    name: "Poe, Edgar Allan",
                    birth_year: Optional(1809),
                    death_year: Optional(1849)
                )
            ],
            translators: [],
            subjects: ["Horror tales, American"],
            bookshelves: [],
            formats: [
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/1064/1064-h/1064-h.htm",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1064.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1064.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/1064.html.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1064/pg1064.cover.medium.jpg",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/1064/1064-0.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1064.epub3.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1053
        ),  // 📔 Book #611
        GutenBook(
            id: 66619,
            title: "The Oxford Book of English Verse, 1250-1900",
            authors: [],
            translators: [],
            subjects: ["English poetry"],
            bookshelves: [],
            formats: [
                "application/octet-stream": "https://www.gutenberg.org/files/66619/66619-0.zip",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/66619.epub3.images",
                "text/html": "https://www.gutenberg.org/ebooks/66619.html.images",
                "text/plain": "https://www.gutenberg.org/ebooks/66619.txt.utf-8",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/66619.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/66619/66619-0.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/66619.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/66619/pg66619.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1053
        ),  // 📗 Book #612
        GutenBook(
            id: 24878,
            title: "Lucy Maud Montgomery Short Stories, 1909 to 1922",
            authors: [
                GutenAuthor(
                    name: "Montgomery, L. M. (Lucy Maud)",
                    birth_year: Optional(1874),
                    death_year: Optional(1942)
                )
            ],
            translators: [],
            subjects: ["Short stories, Canadian"],
            bookshelves: ["Canada"],
            formats: [
                "text/html": "https://www.gutenberg.org/ebooks/24878.html.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/24878.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/24878/pg24878.cover.medium.jpg",
                "text/plain": "https://www.gutenberg.org/ebooks/24878.txt.utf-8",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/24878.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/24878.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/24878/24878.txt",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/24878/24878-h/24878-h.htm",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/24878/24878-8.txt",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1052
        ),  // 📘 Book #613
        GutenBook(
            id: 69775,
            title: "Pen-portraits of literary women, Volume 1 (of 2): By themselves and others",
            authors: [],
            translators: [],
            subjects: ["Authors, English -- Biography", "Women authors, English -- Biography"],
            bookshelves: [],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/69775.rdf",
                "text/html": "https://www.gutenberg.org/ebooks/69775.html.images",
                "text/plain": "https://www.gutenberg.org/ebooks/69775.txt.utf-8",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/69775.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/69775/69775-0.txt",
                "application/octet-stream": "https://www.gutenberg.org/files/69775/69775-0.zip",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/69775/pg69775.cover.medium.jpg",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/69775.epub3.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1052
        ),  // 📙 Book #614
        GutenBook(
            id: 52190,
            title: "Ecce Homo: Complete Works, Volume Seventeen",
            authors: [
                GutenAuthor(
                    name: "Nietzsche, Friedrich Wilhelm",
                    birth_year: Optional(1844),
                    death_year: Optional(1900)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "Ludovici, Anthony M. (Anthony Mario)",
                    birth_year: Optional(1882),
                    death_year: Optional(1971)
                ),
                GutenAuthor(
                    name: "Cohn, Paul V. (Paul Victor)",
                    birth_year: nil,
                    death_year: nil
                ),
            ],
            subjects: [
                "Nietzsche, Friedrich Wilhelm, 1844-1900", "Philosophers -- Germany -- Biography",
            ],
            bookshelves: [],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/52190.rdf",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/52190/52190-0.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/52190.kf8.images",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/52190/52190-h/52190-h.htm",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/52190/pg52190.cover.medium.jpg",
                "text/html": "https://www.gutenberg.org/ebooks/52190.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/52190.epub3.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1051
        ),  // 📕 Book #615
        GutenBook(
            id: 69709,
            title: "Date line",
            authors: [
                GutenAuthor(
                    name: "Loomis, Noel M.",
                    birth_year: Optional(1905),
                    death_year: Optional(1969)
                )
            ],
            translators: [],
            subjects: [
                "Journalists -- Fiction", "Robots -- Fiction", "Science fiction", "Short stories",
                "Time travel -- Fiction",
            ],
            bookshelves: [],
            formats: [
                "text/html": "https://www.gutenberg.org/ebooks/69709.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/69709/69709-0.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/69709.kf8.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/69709.epub3.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/69709/pg69709.cover.medium.jpg",
                "application/octet-stream": "https://www.gutenberg.org/files/69709/69709-0.zip",
                "text/plain": "https://www.gutenberg.org/ebooks/69709.txt.utf-8",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/69709.rdf",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1043
        ),  // 📒 Book #616
        GutenBook(
            id: 876,
            title: "Life in the Iron-Mills; Or, The Korl Woman",
            authors: [
                GutenAuthor(
                    name: "Davis, Rebecca Harding",
                    birth_year: Optional(1831),
                    death_year: Optional(1910)
                )
            ],
            translators: [],
            subjects: ["Feminism -- Fiction", "Women iron and steel workers -- Fiction"],
            bookshelves: [],
            formats: [
                "text/html": "https://www.gutenberg.org/ebooks/876.html.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/876/pg876.cover.medium.jpg",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/876/876-0.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/876.rdf",
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/876.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/876/876.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/876.epub3.images",
                "text/html; charset=utf-8": "https://www.gutenberg.org/files/876/876-h/876-h.htm",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1042
        ),  // 📓 Book #617
        GutenBook(
            id: 38326,
            title: "Bede\'s Ecclesiastical History of England",
            authors: [
                GutenAuthor(
                    name: "Bede, the Venerable, Saint",
                    birth_year: Optional(673),
                    death_year: Optional(735)
                )
            ],
            translators: [
                GutenAuthor(name: "Sellar, A. M.", birth_year: nil, death_year: nil)
            ],
            subjects: ["England -- Church history -- 449-1066"],
            bookshelves: [],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/38326.rdf",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/38326/38326-h/38326-h.html",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/38326.epub3.images",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/38326/38326-8.txt",
                "text/html": "https://www.gutenberg.org/ebooks/38326.html.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/38326/pg38326.cover.medium.jpg",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/38326.kf8.images",
                "application/octet-stream": "https://www.gutenberg.org/files/38326/38326-pdf.zip",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/38326/38326-0.txt",
                "application/prs.tei":
                    "https://www.gutenberg.org/files/38326/38326-tei/38326-tei.tei",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/38326/38326.txt",
                "application/pdf": "https://www.gutenberg.org/files/38326/38326-pdf.pdf",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 1042
        ),  // 📔 Book #618

        GutenBook(
            id: 25609,
            title: "A Child\'s Garden of Verses",
            authors: [
                GutenAuthor(
                    name: "Stevenson, Robert Louis",
                    birth_year: Optional(1850),
                    death_year: Optional(1894)
                )
            ],
            translators: [],
            subjects: ["Children\'s poetry, English"],
            bookshelves: ["Children\'s Literature"],
            formats: [
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/25609.kf8.images",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/25609/25609-h/25609-h.htm",
                "text/plain": "https://www.gutenberg.org/ebooks/25609.txt.utf-8",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/25609.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/25609.rdf",
                "text/html": "https://www.gutenberg.org/ebooks/25609.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/25609/25609.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/25609/pg25609.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 887
        ),  // 📓 Book #757
        GutenBook(
            id: 63256,
            title: "The American Diary of a Japanese Girl",
            authors: [
                GutenAuthor(
                    name: "Noguchi, Yoné",
                    birth_year: Optional(1875),
                    death_year: Optional(1947)
                )
            ],
            translators: [],
            subjects: ["Japan -- Fiction", "Japanese -- United States -- Fiction"],
            bookshelves: [],
            formats: [
                "application/epub+zip": "https://www.gutenberg.org/ebooks/63256.epub3.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/63256/63256-0.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/63256/pg63256.cover.medium.jpg",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/63256/63256-h/63256-h.htm",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/63256.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/63256.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/63256.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 887
        ),  // 📔 Book #758
        GutenBook(
            id: 657,
            title: "The Anglo-Saxon Chronicle",
            authors: [],
            translators: [
                GutenAuthor(
                    name: "Giles, J. A. (John Allen)",
                    birth_year: Optional(1808),
                    death_year: Optional(1884)
                ),
                GutenAuthor(
                    name: "Ingram, J. (James)",
                    birth_year: Optional(1774),
                    death_year: Optional(1850)
                ),
            ],
            subjects: [
                "Anglo-Saxons -- Early works to 1800",
                "Great Britain -- History -- Anglo-Saxon period, 449-1066 -- Sources",
            ],
            bookshelves: [],
            formats: [
                "application/epub+zip": "https://www.gutenberg.org/ebooks/657.epub3.images",
                "text/html": "https://www.gutenberg.org/ebooks/657.html.images",
                "text/plain": "https://www.gutenberg.org/ebooks/657.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/657/pg657.cover.medium.jpg",
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/657.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/657/657.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/657.rdf",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 886
        ),  // 📗 Book #759
        GutenBook(
            id: 20748,
            title: "Favorite Fairy Tales",
            authors: [],
            translators: [],
            subjects: ["Fairy tales"],
            bookshelves: ["Children\'s Myths, Fairy Tales, etc.", "Children\'s Picture Books"],
            formats: [
                "text/plain": "https://www.gutenberg.org/ebooks/20748.txt.utf-8",
                "application/octet-stream": "https://www.gutenberg.org/files/20748/20748-0.zip",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/20748/pg20748.cover.medium.jpg",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/20748/20748-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/20748.html.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/20748.rdf",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/20748.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/20748.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 885
        ),  // 📘 Book #760
        GutenBook(
            id: 26659,
            title: "The Will to Believe, and Other Essays in Popular Philosophy",
            authors: [
                GutenAuthor(
                    name: "James, William",
                    birth_year: Optional(1842),
                    death_year: Optional(1910)
                )
            ],
            translators: [],
            subjects: ["Belief and doubt", "Essays", "Philosophy"],
            bookshelves: [],
            formats: [
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/26659.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/26659.html.images",
                "text/plain": "https://www.gutenberg.org/ebooks/26659.txt.utf-8",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/26659.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/26659.rdf",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/26659/26659-8.txt",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/26659/26659.txt",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/26659/26659-h/26659-h.htm",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/26659/pg26659.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 885
        ),  // 📙 Book #761
        GutenBook(
            id: 1237,
            title: "Father Goriot",
            authors: [
                GutenAuthor(
                    name: "Balzac, Honoré de",
                    birth_year: Optional(1799),
                    death_year: Optional(1850)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "Marriage, Ellen",
                    birth_year: Optional(1865),
                    death_year: Optional(1946)
                )
            ],
            subjects: [
                "Fathers and daughters -- Fiction",
                "France -- History -- Louis XVIII, 1814-1824 -- Fiction",
                "French fiction -- Translations into English", "Older men -- Fiction",
                "Paris (France) -- Fiction",
            ],
            bookshelves: ["Best Books Ever Listings", "Harvard Classics"],
            formats: [
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/1237/1237-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/1237.html.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1237.kf8.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1237.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1237/pg1237.cover.medium.jpg",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1237.epub3.images",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/1237/1237-h/1237-h.htm",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/1237/1237.txt",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 884
        ),  // 📕 Book #762
        GutenBook(
            id: 5427,
            title: "Emile",
            authors: [
                GutenAuthor(
                    name: "Rousseau, Jean-Jacques",
                    birth_year: Optional(1712),
                    death_year: Optional(1778)
                )
            ],
            translators: [],
            subjects: ["Education -- Early works to 1800"],
            bookshelves: ["Banned Books from Anne Haight\'s list"],
            formats: [
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/5427/5427.txt",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/5427/5427-h/5427-h.htm",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/5427.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/5427.rdf",
                "text/plain": "https://www.gutenberg.org/ebooks/5427.txt.utf-8",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/5427.kf8.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/5427/pg5427.cover.medium.jpg",
                "text/html": "https://www.gutenberg.org/ebooks/5427.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 882
        ),  // 📒 Book #763
        GutenBook(
            id: 57342,
            title: "The Lives and Opinions of Eminent Philosophers",
            authors: [
                GutenAuthor(name: "Diogenes Laertius", birth_year: nil, death_year: nil)
            ],
            translators: [
                GutenAuthor(
                    name: "Yonge, Charles Duke",
                    birth_year: Optional(1812),
                    death_year: Optional(1891)
                )
            ],
            subjects: ["Philosophers, Ancient -- Biography", "Philosophy, Ancient"],
            bookshelves: [],
            formats: [
                "text/html": "https://www.gutenberg.org/ebooks/57342.html.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/57342/57342-0.txt",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/57342/57342-h/57342-h.htm",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/57342.epub3.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/57342/pg57342.cover.medium.jpg",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/57342.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/57342.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 882
        ),  // 📓 Book #764
        GutenBook(
            id: 9830,
            title: "The Beautiful and Damned",
            authors: [
                GutenAuthor(
                    name: "Fitzgerald, F. Scott (Francis Scott)",
                    birth_year: Optional(1896),
                    death_year: Optional(1940)
                )
            ],
            translators: [],
            subjects: [
                "Alcoholics -- Fiction", "Domestic fiction",
                "Inheritance and succession -- Fiction",
                "Married people -- Fiction", "New York (N.Y.) -- Fiction", "Psychological fiction",
                "Socialites -- Fiction", "Young men -- Fiction",
            ],
            bookshelves: [],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/9830.rdf",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/9830.epub3.images",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/9830/9830-h/9830-h.htm",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/9830.kf8.images",
                "text/plain; charset=iso-8859-1": "https://www.gutenberg.org/files/9830/9830-8.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/9830/pg9830.cover.medium.jpg",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/9830/9830.txt",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/9830/9830-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/9830.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 881
        ),  // 📔 Book #765
        GutenBook(
            id: 56463,
            title: "Bacon\'s Essays, and Wisdom of the Ancients",
            authors: [
                GutenAuthor(
                    name: "Bacon, Francis",
                    birth_year: Optional(1561),
                    death_year: Optional(1626)
                )
            ],
            translators: [],
            subjects: [
                "Bacon, Francis, 1561-1626", "English essays -- Early modern, 1500-1700",
                "Mythology, Classical",
            ],
            bookshelves: [],
            formats: [
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/56463/56463-0.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/56463/pg56463.cover.medium.jpg",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/56463/56463-h/56463-h.htm",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/56463.kf8.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/56463.rdf",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/56463.epub3.images",
                "text/html": "https://www.gutenberg.org/ebooks/56463.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 881
        ),  // 📗 Book #766
        GutenBook(
            id: 15114,
            title:
                "An Investigation of the Laws of Thought: On which are founded the mathematical theories of logic and probabilities",
            authors: [
                GutenAuthor(
                    name: "Boole, George",
                    birth_year: Optional(1815),
                    death_year: Optional(1864)
                )
            ],
            translators: [],
            subjects: [
                "Logic, Symbolic and mathematical", "Probabilities", "Thought and thinking",
            ],
            bookshelves: ["Mathematics"],
            formats: [
                "image/jpeg": "https://www.gutenberg.org/cache/epub/15114/pg15114.cover.medium.jpg",
                "application/pdf": "https://www.gutenberg.org/files/15114/15114-pdf.pdf",
                "application/octet-stream": "https://www.gutenberg.org/files/15114/15114-pdf.zip",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/15114.rdf",
                "application/prs.tex": "https://www.gutenberg.org/files/15114/15114-t/15114-t.tex",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 880
        ),  // 📘 Book #767
        GutenBook(
            id: 69761,
            title: "The sinking of the Titanic, and other poems",
            authors: [
                GutenAuthor(
                    name: "Stahl, Clarence Victor",
                    birth_year: Optional(1885),
                    death_year: Optional(1973)
                )
            ],
            translators: [],
            subjects: ["American poetry -- 20th century", "Titanic (Steamship) -- Poetry"],
            bookshelves: [],
            formats: [
                "application/octet-stream": "https://www.gutenberg.org/files/69761/69761-0.zip",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/69761.epub3.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/69761/69761-0.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/69761/pg69761.cover.medium.jpg",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/69761.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/69761.kf8.images",
                "text/plain": "https://www.gutenberg.org/ebooks/69761.txt.utf-8",
                "text/html": "https://www.gutenberg.org/ebooks/69761.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 880
        ),  // 📙 Book #768
        GutenBook(
            id: 15489,
            title: "Dream Psychology: Psychoanalysis for Beginners",
            authors: [
                GutenAuthor(
                    name: "Freud, Sigmund",
                    birth_year: Optional(1856),
                    death_year: Optional(1939)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "Eder, M. D. (Montague David)",
                    birth_year: Optional(1866),
                    death_year: Optional(1936)
                )
            ],
            subjects: ["Dreams", "Psychoanalysis"],
            bookshelves: ["Psychology"],
            formats: [
                "image/jpeg": "https://www.gutenberg.org/cache/epub/15489/pg15489.cover.medium.jpg",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/15489/15489-8.txt",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/15489/15489.txt",
                "text/plain": "https://www.gutenberg.org/ebooks/15489.txt.utf-8",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/15489.rdf",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/15489/15489-h/15489-h.htm",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/15489.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/15489.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/15489.epub3.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 879
        ),  // 📕 Book #769
        //🌐 curl http://gutendex.com/books/?page=26
        GutenBook(
            id: 23218,
            title: "The Red Room",
            authors: [
                GutenAuthor(
                    name: "Wells, H. G. (Herbert George)",
                    birth_year: Optional(1866),
                    death_year: Optional(1946)
                )
            ],
            translators: [],
            subjects: ["Short stories"],
            bookshelves: [],
            formats: [
                "application/epub+zip": "https://www.gutenberg.org/ebooks/23218.epub3.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/23218/23218-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/23218.html.images",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/23218/23218-h/23218-h.htm",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/23218/23218.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/23218.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/23218/pg23218.cover.medium.jpg",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/23218.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 878
        ),  // 📒 Book #770
        GutenBook(
            id: 1887,
            title: "The Life of the Spider",
            authors: [
                GutenAuthor(
                    name: "Fabre, Jean-Henri",
                    birth_year: Optional(1823),
                    death_year: Optional(1915)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "Teixeira de Mattos, Alexander",
                    birth_year: Optional(1865),
                    death_year: Optional(1921)
                )
            ],
            subjects: ["Spiders"],
            bookshelves: ["Animals-Wild"],
            formats: [
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/1887/1887-0.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1887/pg1887.cover.medium.jpg",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1887.epub3.images",
                "text/html": "https://www.gutenberg.org/ebooks/1887.html.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1887.kf8.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1887.rdf",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 873
        ),  // 📓 Book #771
        GutenBook(
            id: 4352,
            title: "Laughter: An Essay on the Meaning of the Comic",
            authors: [
                GutenAuthor(
                    name: "Bergson, Henri",
                    birth_year: Optional(1859),
                    death_year: Optional(1941)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "Rothwell, Fred",
                    birth_year: Optional(1869),
                    death_year: Optional(1934)
                ),
                GutenAuthor(
                    name: "Brereton, Cloudesley",
                    birth_year: Optional(1863),
                    death_year: Optional(1937)
                ),
            ],
            subjects: ["Comedy", "Laughter", "Philosophy, French"],
            bookshelves: ["Philosophy"],
            formats: [
                "text/html": "https://www.gutenberg.org/ebooks/4352.html.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/4352.kf8.images",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/4352/4352-h/4352-h.htm",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/4352/pg4352.cover.medium.jpg",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/4352.rdf",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/4352.epub3.images",
                "text/plain": "https://www.gutenberg.org/ebooks/4352.txt.utf-8",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/4352/4352.txt",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 873
        ),  // 📔 Book #772
        GutenBook(
            id: 69836,
            title: "Down the Mackenzie and up the Yukon in 1906",
            authors: [
                GutenAuthor(
                    name: "Stewart, Elihu",
                    birth_year: Optional(1844),
                    death_year: Optional(1935)
                )
            ],
            translators: [],
            subjects: [
                "Mackenzie (N.W.T.) -- Description and travel",
                "Northwest, Canadian -- Description and travel",
                "Yukon River Valley (Yukon and Alaska) -- Description and travel",
            ],
            bookshelves: [],
            formats: [
                "application/octet-stream": "https://www.gutenberg.org/files/69836/69836-0.zip",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/69836/69836-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/69836.html.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/69836/pg69836.cover.medium.jpg",
                "text/plain": "https://www.gutenberg.org/ebooks/69836.txt.utf-8",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/69836.rdf",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/69836.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/69836.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 873
        ),  // 📗 Book #773
        GutenBook(
            id: 69664,
            title: "The law of the road; or, wrongs and rights of a traveller",
            authors: [
                GutenAuthor(
                    name: "Rogers, R. Vashon (Robert Vashon)",
                    birth_year: Optional(1843),
                    death_year: Optional(1911)
                )
            ],
            translators: [],
            subjects: [
                "Carriers -- Canada", "Carriers -- United States", "Highway law -- Canada",
                "Highway law -- United States", "Railroad law -- Canada",
                "Railroad law -- United States",
                "Travel",
            ],
            bookshelves: [],
            formats: [
                "application/octet-stream": "https://www.gutenberg.org/files/69664/69664-0.zip",
                "text/html": "https://www.gutenberg.org/ebooks/69664.html.images",
                "text/plain": "https://www.gutenberg.org/ebooks/69664.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/69664/pg69664.cover.medium.jpg",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/69664.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/69664/69664-0.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/69664.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/69664.rdf",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 872
        ),  // 📘 Book #774
        GutenBook(
            id: 2350,
            title: "His Last Bow: An Epilogue of Sherlock Holmes",
            authors: [
                GutenAuthor(
                    name: "Doyle, Arthur Conan",
                    birth_year: Optional(1859),
                    death_year: Optional(1930)
                )
            ],
            translators: [],
            subjects: [
                "Detective and mystery stories",
                "Holmes, Sherlock (Fictitious character) -- Fiction",
                "Private investigators -- England -- Fiction",
            ],
            bookshelves: ["Detective Fiction"],
            formats: [
                "text/plain": "https://www.gutenberg.org/ebooks/2350.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/2350/pg2350.cover.medium.jpg",
                "application/octet-stream": "https://www.gutenberg.org/files/2350/2350-0.zip",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/2350/2350-0.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/2350.kf8.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/2350.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/2350.rdf",
                "text/html": "https://www.gutenberg.org/ebooks/2350.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 871
        ),  // 📙 Book #775
        GutenBook(
            id: 69929,
            title: "The cowboy and the lady and her pa : $b A story of a fish out of water",
            authors: [
                GutenAuthor(
                    name: "Cobb, Irvin S. (Irvin Shrewsbury)",
                    birth_year: Optional(1876),
                    death_year: Optional(1944)
                )
            ],
            translators: [],
            subjects: [
                "Children of the rich -- Fiction", "Fathers and daughters -- Fiction",
                "Man-woman relationships -- Fiction", "Short stories", "Tourists -- Fiction",
                "Western stories",
            ],
            bookshelves: [],
            formats: [
                "application/octet-stream": "https://www.gutenberg.org/files/69929/69929-0.zip",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/69929.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/69929.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/69929.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/69929.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/69929/69929-0.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/69929/pg69929.cover.medium.jpg",
                "text/plain": "https://www.gutenberg.org/ebooks/69929.txt.utf-8",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 869
        ),  // 📕 Book #776
        GutenBook(
            id: 2449,
            title: "The Common Law",
            authors: [
                GutenAuthor(
                    name: "Holmes, Oliver Wendell",
                    birth_year: Optional(1841),
                    death_year: Optional(1935)
                )
            ],
            translators: [],
            subjects: ["Common law"],
            bookshelves: ["United States Law"],
            formats: [
                "text/html": "https://www.gutenberg.org/ebooks/2449.html.images",
                "text/html; charset=us-ascii":
                    "https://www.gutenberg.org/files/2449/2449-h/2449-h.htm",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/2449.kf8.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/2449.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/2449.rdf",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/2449/2449.txt",
                "text/plain": "https://www.gutenberg.org/ebooks/2449.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/2449/pg2449.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 868
        ),  // 📒 Book #777
        GutenBook(
            id: 1467,
            title: "Some Christmas Stories",
            authors: [
                GutenAuthor(
                    name: "Dickens, Charles",
                    birth_year: Optional(1812),
                    death_year: Optional(1870)
                )
            ],
            translators: [],
            subjects: ["Christmas stories, English", "Holidays -- Fiction", "Short stories"],
            bookshelves: ["Christmas"],
            formats: [
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/1467/1467-0.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1467.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/1467.html.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1467/pg1467.cover.medium.jpg",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1467.rdf",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1467.epub3.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 867
        ),  // 📓 Book #778
        GutenBook(
            id: 5186,
            title: "Kalevala : the Epic Poem of Finland — Complete",
            authors: [],
            translators: [
                GutenAuthor(
                    name: "Crawford, John Martin",
                    birth_year: Optional(1845),
                    death_year: Optional(1916)
                )
            ],
            subjects: ["Finnish poetry -- Translations into English"],
            bookshelves: [],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/5186.rdf",
                "application/octet-stream": "https://www.gutenberg.org/files/5186/5186-0.zip",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/5186.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/5186.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/5186/5186-0.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/5186/pg5186.cover.medium.jpg",
                "text/plain": "https://www.gutenberg.org/ebooks/5186.txt.utf-8",
                "text/html": "https://www.gutenberg.org/ebooks/5186.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 866
        ),  // 📔 Book #779
        GutenBook(
            id: 69801,
            title: "The dread Apache: That early-day scourge of the Southwest",
            authors: [
                GutenAuthor(
                    name: "Freeman, Merrill Pingree",
                    birth_year: Optional(1844),
                    death_year: Optional(1915)
                )
            ],
            translators: [],
            subjects: [
                "Apache Indians", "Apache Kid, approximately 1860-",
                "Indians of North America -- Southwest, New",
            ],
            bookshelves: [],
            formats: [
                "text/html": "https://www.gutenberg.org/ebooks/69801.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/69801.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/69801.rdf",
                "text/plain": "https://www.gutenberg.org/ebooks/69801.txt.utf-8",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/69801.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/69801/69801-0.txt",
                "application/octet-stream": "https://www.gutenberg.org/files/69801/69801-0.zip",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/69801/pg69801.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 865
        ),  // 📗 Book #780
        GutenBook(
            id: 20781,
            title: "Heidi: (Gift Edition)",
            authors: [
                GutenAuthor(
                    name: "Spyri, Johanna",
                    birth_year: Optional(1827),
                    death_year: Optional(1901)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "Stork, Elisabeth P. (Elisabeth Pausinger)",
                    birth_year: nil,
                    death_year: nil
                )
            ],
            subjects: [
                "Grandfathers -- Fiction", "Mountain life -- Switzerland -- Fiction",
                "Orphans -- Fiction",
                "Switzerland -- History -- 19th century -- Fiction",
            ],
            bookshelves: ["Children\'s Literature"],
            formats: [
                "text/plain": "https://www.gutenberg.org/ebooks/20781.txt.utf-8",
                "text/html": "https://www.gutenberg.org/ebooks/20781.html.images",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/20781/20781-h/20781-h.htm",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/20781/pg20781.cover.medium.jpg",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/20781.rdf",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/20781/20781.txt",
                "application/octet-stream":
                    "https://www.gutenberg.org/files/20781/20781-page-images.zip",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/20781/20781-8.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/20781.kf8.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/20781.epub3.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 862
        ),  // 📘 Book #781
        GutenBook(
            id: 24790,
            title: "Early English Meals and Manners",
            authors: [],
            translators: [],
            subjects: [
                "Education -- Early works to 1800",
                "England -- Social life and customs -- Early works to 1800", "Etiquette",
                "Home economics -- Early works to 1800", "Table",
            ],
            bookshelves: ["Early English Text Society", "United Kingdom"],
            formats: [
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/24790/24790-h/24790-h.htm",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/24790/24790-8.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/24790/pg24790.cover.medium.jpg",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/24790.rdf",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/24790.epub3.images",
                "text/html": "https://www.gutenberg.org/ebooks/24790.html.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/24790/24790-0.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/24790.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 861
        ),  // 📙 Book #782
        GutenBook(
            id: 35481,
            title: "Cannibals all! or, Slaves without masters",
            authors: [
                GutenAuthor(
                    name: "Fitzhugh, George",
                    birth_year: Optional(1806),
                    death_year: Optional(1881)
                )
            ],
            translators: [],
            subjects: [
                "Slave labor", "Slavery -- Justification", "Slavery -- United States",
                "Working class",
            ],
            bookshelves: [],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/35481.rdf",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/35481/35481-8.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/35481.epub3.images",
                "text/plain": "https://www.gutenberg.org/ebooks/35481.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/35481/pg35481.cover.medium.jpg",
                "text/html": "https://www.gutenberg.org/ebooks/35481.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/35481/35481.txt",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/35481/35481-h/35481-h.htm",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/35481.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 861
        ),  // 📕 Book #783
        GutenBook(
            id: 1057,
            title: "Poems, with The Ballad of Reading Gaol",
            authors: [
                GutenAuthor(
                    name: "Wilde, Oscar",
                    birth_year: Optional(1854),
                    death_year: Optional(1900)
                )
            ],
            translators: [],
            subjects: ["Poetry", "Prisons -- Poetry"],
            bookshelves: [],
            formats: [
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/1057/1057-0.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1057/pg1057.cover.medium.jpg",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1057.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1057.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1057.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/1057.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 859
        ),  // 📒 Book #784
        GutenBook(
            id: 69727,
            title: "The land of gold; or, Three years in California",
            authors: [
                GutenAuthor(
                    name: "Colton, Walter",
                    birth_year: Optional(1797),
                    death_year: Optional(1851)
                )
            ],
            translators: [],
            subjects: ["California -- Gold discoveries", "California -- History -- 1846-1850"],
            bookshelves: [],
            formats: [
                "text/html": "https://www.gutenberg.org/ebooks/69727.html.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/69727.rdf",
                "text/plain": "https://www.gutenberg.org/ebooks/69727.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/69727/pg69727.cover.medium.jpg",
                "application/octet-stream": "https://www.gutenberg.org/files/69727/69727-0.zip",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/69727.epub3.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/69727/69727-0.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/69727.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 859
        ),  // 📓 Book #785
        GutenBook(
            id: 447,
            title: "Maggie: A Girl of the Streets",
            authors: [
                GutenAuthor(
                    name: "Crane, Stephen",
                    birth_year: Optional(1871),
                    death_year: Optional(1900)
                )
            ],
            translators: [],
            subjects: [
                "New York (N.Y.) -- Fiction", "Poor families -- Fiction", "Poor women -- Fiction",
                "Prostitutes -- Fiction", "Psychological fiction", "Slums -- Fiction",
                "Suicide victims -- Fiction",
            ],
            bookshelves: [],
            formats: [
                "image/jpeg": "https://www.gutenberg.org/cache/epub/447/pg447.cover.medium.jpg",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/447/447.txt",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/447/447-h/447-h.htm",
                "text/plain": "https://www.gutenberg.org/ebooks/447.txt.utf-8",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/447.rdf",
                "text/html": "https://www.gutenberg.org/ebooks/447.html.images",
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/447.kf8.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/447.epub3.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 858
        ),  // 📔 Book #786
        GutenBook(
            id: 2810,
            title:
                "Plunkitt of Tammany Hall: a series of very plain talks on very practical politics, delivered by ex-Senator George Washington Plunkitt, the Tammany philosopher, from his rostrum—the New York County court house bootblack stand; Recorded by William L. Riordon",
            authors: [
                GutenAuthor(
                    name: "Plunkitt, George Washington",
                    birth_year: Optional(1842),
                    death_year: Optional(1924)
                )
            ],
            translators: [],
            subjects: ["Plunkitt, George Washington, 1842-1924", "Tammany Hall"],
            bookshelves: [],
            formats: [
                "text/html; charset=us-ascii":
                    "https://www.gutenberg.org/files/2810/2810-h/2810-h.htm",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/2810.epub3.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/2810/2810.txt",
                "text/plain": "https://www.gutenberg.org/ebooks/2810.txt.utf-8",
                "text/html": "https://www.gutenberg.org/ebooks/2810.html.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/2810/pg2810.cover.medium.jpg",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/2810.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/2810.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 858
        ),  // 📗 Book #787
        GutenBook(
            id: 5314,
            title: "Household Tales by Brothers Grimm",
            authors: [
                GutenAuthor(
                    name: "Grimm, Wilhelm",
                    birth_year: Optional(1786),
                    death_year: Optional(1859)
                ),
                GutenAuthor(
                    name: "Grimm, Jacob",
                    birth_year: Optional(1785),
                    death_year: Optional(1863)
                ),
            ],
            translators: [
                GutenAuthor(
                    name: "Hunt, Alfred William, Mrs.",
                    birth_year: Optional(1831),
                    death_year: Optional(1912)
                )
            ],
            subjects: ["Fairy tales -- Germany"],
            bookshelves: ["Harvard Classics"],
            formats: [
                "text/plain": "https://www.gutenberg.org/ebooks/5314.txt.utf-8",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/5314.rdf",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/5314/5314-0.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/5314.epub3.images",
                "application/octet-stream": "https://www.gutenberg.org/files/5314/5314-0.zip",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/5314.kf8.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/5314/pg5314.cover.medium.jpg",
                "text/html": "https://www.gutenberg.org/ebooks/5314.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 857
        ),  // 📘 Book #788
        GutenBook(
            id: 24614,
            title: "The Science of Fairy Tales: An Inquiry into Fairy  Mythology",
            authors: [
                GutenAuthor(
                    name: "Hartland, Edwin Sidney",
                    birth_year: Optional(1848),
                    death_year: Optional(1927)
                )
            ],
            translators: [],
            subjects: ["Fairy tales", "Folklore"],
            bookshelves: ["Folklore"],
            formats: [
                "application/epub+zip": "https://www.gutenberg.org/ebooks/24614.epub3.images",
                "text/html": "https://www.gutenberg.org/ebooks/24614.html.images",
                "text/plain": "https://www.gutenberg.org/ebooks/24614.txt.utf-8",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/24614/24614-h/24614-h.htm",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/24614/24614-8.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/24614.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/24614.kf8.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/24614/pg24614.cover.medium.jpg",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/24614/24614.txt",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 856
        ),  // 📙 Book #789

        GutenBook(
            id: 15665,
            title: "New Latin Grammar",
            authors: [
                GutenAuthor(
                    name: "Bennett, Charles E. (Charles Edwin)",
                    birth_year: Optional(1858),
                    death_year: Optional(1921)
                )
            ],
            translators: [],
            subjects: ["Latin language -- Grammar"],
            bookshelves: ["Language Education"],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/15665.rdf",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/15665/15665.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/15665.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/15665.kf8.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/15665/15665-0.txt",
                "text/html; charset=us-ascii":
                    "https://www.gutenberg.org/files/15665/15665-h/15665-h.htm",
                "text/html": "https://www.gutenberg.org/ebooks/15665.html.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/15665/pg15665.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 821
        ),  // 📒 Book #826
        GutenBook(
            id: 1872,
            title: "The Red House Mystery",
            authors: [
                GutenAuthor(
                    name: "Milne, A. A. (Alan Alexander)",
                    birth_year: Optional(1882),
                    death_year: Optional(1956)
                )
            ],
            translators: [],
            subjects: ["Detective and mystery stories", "England -- Fiction"],
            bookshelves: ["Detective Fiction"],
            formats: [
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1872.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/1872/1872.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1872.epub3.images",
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/1872/1872-h/1872-h.htm",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1872/pg1872.cover.medium.jpg",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1872.rdf",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/1872/1872-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/1872.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 819
        ),  // 📓 Book #827
        GutenBook(
            id: 14726,
            title:
                "The Elder Eddas of Saemund Sigfusson; and the Younger Eddas of Snorre Sturleson",
            authors: [
                GutenAuthor(
                    name: "Snorri Sturluson",
                    birth_year: nil,
                    death_year: Optional(1241)
                ),
                GutenAuthor(
                    name: "Sæmundur fróði",
                    birth_year: Optional(1056),
                    death_year: Optional(1133)
                ),
            ],
            translators: [
                GutenAuthor(
                    name: "Thorpe, Benjamin",
                    birth_year: Optional(1782),
                    death_year: Optional(1870)
                ),
                GutenAuthor(name: "Blackwell, I. A.", birth_year: nil, death_year: nil),
            ],
            subjects: ["Mythology, Norse", "Scalds and scaldic poetry"],
            bookshelves: [],
            formats: [
                "application/epub+zip": "https://www.gutenberg.org/ebooks/14726.epub3.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/14726/pg14726.cover.medium.jpg",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/14726/14726-8.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/14726.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/14726.kf8.images",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/14726/14726-h/14726-h.htm",
                "text/html": "https://www.gutenberg.org/ebooks/14726.html.images",
                "text/plain": "https://www.gutenberg.org/ebooks/14726.txt.utf-8",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 819
        ),  // 📔 Book #828
        GutenBook(
            id: 38269,
            title: "A History of the Philippines",
            authors: [
                GutenAuthor(
                    name: "Barrows, David P.",
                    birth_year: Optional(1873),
                    death_year: Optional(1954)
                )
            ],
            translators: [],
            subjects: ["Philippines -- History"],
            bookshelves: [],
            formats: [
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/38269/38269-8.txt",
                "text/html": "https://www.gutenberg.org/ebooks/38269.html.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/38269.kf8.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/38269/pg38269.cover.medium.jpg",
                "text/plain": "https://www.gutenberg.org/ebooks/38269.txt.utf-8",
                "text/html; charset=us-ascii":
                    "https://www.gutenberg.org/files/38269/38269-h/38269-h.htm",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/38269.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/38269.rdf",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/38269/38269.txt",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 819
        ),  // 📗 Book #829
        GutenBook(
            id: 1572,
            title: "Timaeus",
            authors: [
                GutenAuthor(
                    name: "Plato",
                    birth_year: Optional(-428),
                    death_year: Optional(-348)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "Jowett, Benjamin",
                    birth_year: Optional(1817),
                    death_year: Optional(1893)
                )
            ],
            subjects: ["Classical literature", "Cosmology -- Early works to 1800"],
            bookshelves: [],
            formats: [
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1572.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/1572.html.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1572.rdf",
                "text/html; charset=us-ascii":
                    "https://www.gutenberg.org/files/1572/1572-h/1572-h.htm",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/1572/1572-0.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1572.epub3.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1572/pg1572.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 817
        ),  // 📘 Book #830
        GutenBook(
            id: 38488,
            title: "Folk-Tales of Bengal",
            authors: [
                GutenAuthor(
                    name: "Day, Lal Behari",
                    birth_year: Optional(1826),
                    death_year: Optional(1894)
                )
            ],
            translators: [],
            subjects: ["Bengali (South Asian people) -- Folklore", "Tales -- India -- Bengal"],
            bookshelves: [],
            formats: [
                "text/plain": "https://www.gutenberg.org/ebooks/38488.txt.utf-8",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/38488/38488-8.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/38488.rdf",
                "text/html; charset=us-ascii":
                    "https://www.gutenberg.org/files/38488/38488-h/38488-h.htm",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/38488/38488.txt",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/38488/pg38488.cover.medium.jpg",
                "text/html": "https://www.gutenberg.org/ebooks/38488.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/38488.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/38488.kf8.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 817
        ),  // 📙 Book #831
        GutenBook(
            id: 70,
            title: "What Is Man? and Other Essays",
            authors: [
                GutenAuthor(
                    name: "Twain, Mark",
                    birth_year: Optional(1835),
                    death_year: Optional(1910)
                )
            ],
            translators: [],
            subjects: ["American essays"],
            bookshelves: [],
            formats: [
                "text/html": "https://www.gutenberg.org/ebooks/70.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/70.epub3.images",
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/70.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/70/70-0.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/70.rdf",
                "application/octet-stream": "https://www.gutenberg.org/files/70/70-0.zip",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/70/pg70.cover.medium.jpg",
                "text/plain": "https://www.gutenberg.org/ebooks/70.txt.utf-8",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 815
        ),  // 📕 Book #832
        //🌐 curl http://gutendex.com/books/?page=28
        GutenBook(
            id: 1635,
            title: "Ion",
            authors: [
                GutenAuthor(
                    name: "Plato",
                    birth_year: Optional(-428),
                    death_year: Optional(-348)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "Jowett, Benjamin",
                    birth_year: Optional(1817),
                    death_year: Optional(1893)
                )
            ],
            subjects: [
                "Aesthetics, Ancient", "Classical literature", "Homer. Iliad",
                "Poetics -- History -- To 1500",
            ],
            bookshelves: ["Philosophy"],
            formats: [
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1635/pg1635.cover.medium.jpg",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1635.kf8.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1635.epub3.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/1635/1635.txt",
                "text/plain": "https://www.gutenberg.org/ebooks/1635.txt.utf-8",
                "text/html; charset=us-ascii":
                    "https://www.gutenberg.org/files/1635/1635-h/1635-h.htm",
                "text/html": "https://www.gutenberg.org/ebooks/1635.html.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1635.rdf",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 815
        ),  // 📒 Book #833
        GutenBook(
            id: 22400,
            title:
                "Fox\'s Book of Martyrs: Or A History of the Lives, Sufferings, and Triumphant; Deaths of the Primitive Protestant Martyrs",
            authors: [
                GutenAuthor(
                    name: "Foxe, John",
                    birth_year: Optional(1516),
                    death_year: Optional(1587)
                )
            ],
            translators: [],
            subjects: ["Church history", "Martyrs", "Persecution"],
            bookshelves: [],
            formats: [
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/22400.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/22400.html.images",
                "text/plain; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/22400/22400-8.txt",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/22400.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/22400/pg22400.cover.medium.jpg",
                "text/html; charset=iso-8859-1":
                    "https://www.gutenberg.org/files/22400/22400-h/22400-h.htm",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/22400/22400.txt",
                "text/plain": "https://www.gutenberg.org/ebooks/22400.txt.utf-8",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/22400.epub3.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 813
        ),  // 📓 Book #834
        GutenBook(
            id: 1026,
            title: "The Diary of a Nobody",
            authors: [
                GutenAuthor(
                    name: "Grossmith, Weedon",
                    birth_year: Optional(1852),
                    death_year: Optional(1919)
                ),
                GutenAuthor(
                    name: "Grossmith, George",
                    birth_year: Optional(1847),
                    death_year: Optional(1912)
                ),
            ],
            translators: [],
            subjects: [
                "Diary fiction", "England -- Fiction", "Humorous stories",
                "Men -- England -- Fiction",
                "Middle class -- Fiction", "Suburban life -- Fiction",
            ],
            bookshelves: ["Best Books Ever Listings", "Humor"],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/1026.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/1026/pg1026.cover.medium.jpg",
                "application/octet-stream": "https://www.gutenberg.org/files/1026/1026-0.zip",
                "text/html": "https://www.gutenberg.org/ebooks/1026.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/1026.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/1026.kf8.images",
                "text/plain": "https://www.gutenberg.org/ebooks/1026.txt.utf-8",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/1026/1026-0.txt",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 812
        ),  // 📔 Book #835
        GutenBook(
            id: 2027,
            title: "Tartuffe; Or, The Hypocrite",
            authors: [
                GutenAuthor(
                    name: "Molière",
                    birth_year: Optional(1622),
                    death_year: Optional(1673)
                )
            ],
            translators: [
                GutenAuthor(
                    name: "Page, Curtis Hidden",
                    birth_year: Optional(1870),
                    death_year: Optional(1946)
                )
            ],
            subjects: ["Comedies", "French drama -- 17th century -- Translations into English"],
            bookshelves: ["Harvard Classics"],
            formats: [
                "image/jpeg": "https://www.gutenberg.org/cache/epub/2027/pg2027.cover.medium.jpg",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/2027.epub3.images",
                "text/plain": "https://www.gutenberg.org/ebooks/2027.txt.utf-8",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/2027/2027.txt",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/2027.kf8.images",
                "text/html": "https://www.gutenberg.org/ebooks/2027.html.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/2027.rdf",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 812
        ),  // 📗 Book #836
        GutenBook(
            id: 5160,
            title: "The Mabinogion",
            authors: [],
            translators: [
                GutenAuthor(
                    name: "Schreiber, Charlotte, Lady",
                    birth_year: Optional(1812),
                    death_year: Optional(1895)
                )
            ],
            subjects: [
                "Mythology, Celtic -- Wales", "Tales -- Wales",
                "Welsh literature -- 1100-1400 -- Translations into English",
            ],
            bookshelves: ["Fantasy"],
            formats: [
                "text/plain": "https://www.gutenberg.org/ebooks/5160.txt.utf-8",
                "application/octet-stream": "https://www.gutenberg.org/files/5160/5160-0.zip",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/5160/5160-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/5160.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/5160.epub3.images",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/5160.kf8.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/5160.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/5160/pg5160.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 811
        ),  // 📘 Book #837
        GutenBook(
            id: 69886,
            title: "Famous pets of famous people",
            authors: [
                GutenAuthor(name: "Lewis, Eleanor", birth_year: nil, death_year: nil)
            ],
            translators: [],
            subjects: [],
            bookshelves: [],
            formats: [
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/69886.rdf",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/69886.kf8.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/69886/pg69886.cover.medium.jpg",
                "text/plain": "https://www.gutenberg.org/ebooks/69886.txt.utf-8",
                "application/octet-stream": "https://www.gutenberg.org/files/69886/69886-0.zip",
                "text/html": "https://www.gutenberg.org/ebooks/69886.html.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/69886/69886-0.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/69886.epub3.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 810
        ),  // 📙 Book #838
        GutenBook(
            id: 610,
            title: "Idylls of the King",
            authors: [
                GutenAuthor(
                    name: "Tennyson, Alfred Tennyson, Baron",
                    birth_year: Optional(1809),
                    death_year: Optional(1892)
                )
            ],
            translators: [],
            subjects: [
                "Arthur, King -- Poetry", "Arthurian romances -- Adaptations",
                "Knights and knighthood -- Poetry",
            ],
            bookshelves: ["Arthurian Legends"],
            formats: [
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/610.kf8.images",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/610/610-0.txt",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/610.epub3.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/610.rdf",
                "application/octet-stream": "https://www.gutenberg.org/files/610/610-0.zip",
                "text/plain": "https://www.gutenberg.org/ebooks/610.txt.utf-8",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/610/pg610.cover.medium.jpg",
                "text/html": "https://www.gutenberg.org/ebooks/610.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 809
        ),  // 📕 Book #839
        GutenBook(
            id: 3188,
            title: "Mark Twain\'s Speeches",
            authors: [
                GutenAuthor(
                    name: "Twain, Mark",
                    birth_year: Optional(1835),
                    death_year: Optional(1910)
                )
            ],
            translators: [],
            subjects: ["Speeches, addresses, etc., American"],
            bookshelves: [],
            formats: [
                "text/html; charset=utf-8":
                    "https://www.gutenberg.org/files/3188/3188-h/3188-h.htm",
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/3188.kf8.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/3188.epub3.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/3188/3188-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/3188.html.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/3188.rdf",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/3188/pg3188.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 809
        ),  // 📒 Book #840
        GutenBook(
            id: 143,
            title: "The Mayor of Casterbridge",
            authors: [
                GutenAuthor(
                    name: "Hardy, Thomas",
                    birth_year: Optional(1840),
                    death_year: Optional(1928)
                )
            ],
            translators: [],
            subjects: [
                "Atonement -- Fiction", "Fathers and daughters -- Fiction", "Mayors -- Fiction",
                "Men -- England -- Fiction", "Psychological fiction", "Runaway husbands -- Fiction",
                "Wessex (England) -- Fiction",
            ],
            bookshelves: [],
            formats: [
                "application/x-mobipocket-ebook": "https://www.gutenberg.org/ebooks/143.kf8.images",
                "text/html; charset=utf-8": "https://www.gutenberg.org/files/143/143-h/143-h.htm",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/143/pg143.cover.medium.jpg",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/143.rdf",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/143.epub3.images",
                "text/plain; charset=utf-8": "https://www.gutenberg.org/files/143/143-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/143.html.images",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 807
        ),  // 📓 Book #841
        GutenBook(
            id: 69677,
            title: "The man in the street: Papers on American topics",
            authors: [
                GutenAuthor(
                    name: "Nicholson, Meredith",
                    birth_year: Optional(1866),
                    death_year: Optional(1947)
                )
            ],
            translators: [],
            subjects: ["American essays -- 20th century"],
            bookshelves: [],
            formats: [
                "application/x-mobipocket-ebook":
                    "https://www.gutenberg.org/ebooks/69677.kf8.images",
                "application/rdf+xml": "https://www.gutenberg.org/ebooks/69677.rdf",
                "text/plain": "https://www.gutenberg.org/ebooks/69677.txt.utf-8",
                "application/octet-stream": "https://www.gutenberg.org/files/69677/69677-0.zip",
                "text/plain; charset=us-ascii": "https://www.gutenberg.org/files/69677/69677-0.txt",
                "text/html": "https://www.gutenberg.org/ebooks/69677.html.images",
                "application/epub+zip": "https://www.gutenberg.org/ebooks/69677.epub3.images",
                "image/jpeg": "https://www.gutenberg.org/cache/epub/69677/pg69677.cover.medium.jpg",
            ],
            languages: ["en"],
            copyright: false,
            media_type: GutenMediaType.text,
            download_count: 807
        ),  // 📔 Book #842

    ]

}
