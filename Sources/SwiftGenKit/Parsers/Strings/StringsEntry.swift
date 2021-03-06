//
// SwiftGenKit
// Copyright © 2019 SwiftGen
// MIT Licence
//

import Foundation
import PathKit

extension Strings {
  struct Entry {
    let key: String
    let translation: String
    let types: [PlaceholderType]
    let keyStructure: [String]

    init(key: String, translation: String, types: [PlaceholderType]) {
      self.key = key
      self.translation = translation
      self.types = types
      self.keyStructure = Entry.split(key: key)
    }

    init(key: String, translation: String, types: PlaceholderType...) {
      self.init(key: key, translation: translation, types: types)
    }

    init(key: String, translation: String) throws {
      let types = try PlaceholderType.placeholders(fromFormat: translation)
      self.init(key: key, translation: translation, types: types)
    }

    // MARK: - Structured keys

    private static let separatorSet = CharacterSet(charactersIn: ".")

    private static func split(key: String) -> [String] {
      return key
        .components(separatedBy: Entry.separatorSet)
        .filter { !$0.isEmpty }
    }
  }
}
