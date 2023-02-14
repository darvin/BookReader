//
//  PDFThumbnailGenerator.swift
//  BookReader
//
//  Created by standard on 2/12/23.
//

import Foundation
import PDFKit
import UIKit

class PDFThumbnailGenerator {

    init() {}

    func generateAndSaveThumbnail(for url: URL, forceRegenerate: Bool = false) throws -> URL {
        let thumbnailURL = LocalBook.thumbnailURL(for: url)

        guard forceRegenerate || !FileManager.default.fileExists(atPath: thumbnailURL.path) else {
            return thumbnailURL
        }
        let pdfDocument = PDFDocument(url: url)
        let firstPage = pdfDocument?.page(at: 0)
        let thumbnailSize = firstPage?.bounds(for: .mediaBox).size
        UIGraphicsBeginImageContextWithOptions(thumbnailSize!, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: thumbnailSize!.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        firstPage?.draw(with: .mediaBox, to: context!)
        let thumbnail = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let thumbnailImage = thumbnail else {
            throw NSError(domain: "Error generating thumbnail", code: 0, userInfo: nil)
        }
        let imageData = thumbnailImage.jpegData(compressionQuality: 1.0)
        do {
            try imageData?.write(to: thumbnailURL)
            return thumbnailURL
        }
        catch {
            throw NSError(domain: "Error saving thumbnail", code: 0, userInfo: nil)
        }
    }

}
