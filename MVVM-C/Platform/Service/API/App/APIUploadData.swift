//
//  APIUploadData.swift
//  MVVM-C
//
//  Created by Viet Anh on 01/09/2021.
//

import Foundation

class APIUploadData {

    var fileURL: URL?
    var data: Data?
    var name = ""
    var fileName = ""
    var mimeType = ""

    init(fileURL: URL, name: String, fileName: String, mimeType: String) {
        self.fileURL = fileURL
        initWith(name: name, fileName: fileName, mimeType: mimeType)
    }

    init(data: Data, name: String, fileName: String, mimeType: String) {
        self.data = data
        initWith(name: name, fileName: fileName, mimeType: mimeType)
    }

    fileprivate func initWith(name: String, fileName: String, mimeType: String) {
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
    }
}

extension APIUploadData {
    
    static func generateAvatarUploadData(_ data: Data) -> APIUploadData {
        return APIUploadData(data: data, name: "file", fileName: "file.jpg", mimeType: "image/jpg")
    }
    
    static func generateAvatarUploadData(_ fileURL: URL) -> APIUploadData {
        return APIUploadData(fileURL: fileURL, name: "file", fileName: "file.jpg", mimeType: "image/jpg")
    }
}
