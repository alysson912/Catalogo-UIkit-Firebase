//
//  GenericService.swift
//  punchLoudness
//
//  Created by Alysson on 31/08/23.
//

import Foundation

enum Error: Swift.Error {
    case fileNoFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    
}

    enum TypeFetch {
        case mock
      //  case request
    }

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
