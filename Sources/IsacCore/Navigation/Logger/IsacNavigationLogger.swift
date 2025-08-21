//
//  File.swift
//  IsacCore
//
//  Created by shinisac on 8/20/25.
//

import Foundation

@available(iOS 13.0, *)
@MainActor
final class IsacNavigationLogger {
    static let shared = IsacNavigationLogger()
    private init() {}
    
    func logPush(id: String) {
        print("[NavigationLogger] Pushed view with id: \(id)")
    }
    
    func logPop(id: String) {
        print("[NavigationLogger] Popped view with id: \(id)")
    }
    
    func logPopToRoot() {
        print("[NavigationLogger] Popped to root")
    }
}
