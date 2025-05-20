//
//  StringExt.swift
//  BBQuotes
//
//  Created by Vinod Rathod on 21/05/25.
//

extension String {
    func replaceSpaces () -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpace () -> String {
        self.replaceSpaces().lowercased()
    }
}
