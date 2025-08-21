//
//  File.swift
//  IsacCore
//
//  Created by shinisac on 8/20/25.
//

import SwiftUI

@available(iOS 13.0, *)
@MainActor
final class IsacNavigationManager: ObservableObject {
    static let shared = IsacNavigationManager()
    
    @Published private(set) var viewStack: [ViewItem] = []
    
    private init() {}
    
    struct ViewItem: Identifiable, Equatable {
        let id: String
        let view: AnyView
        let presentationStyle: PresentationStyle
        
        enum PresentationStyle {
            case navigationLink
            case sheet
            case fullScreenCover
        }

        static func == (lhs: ViewItem, rhs: ViewItem) -> Bool {
            lhs.id == rhs.id
        }
    }

    var activeView: ViewItem? {
        viewStack.last
    }

    func push<V: View>(_ view: V, id: String, style: ViewItem.PresentationStyle = .navigationLink) {
        if !viewStack.contains(where: { $0.id == id }) {
            let item = ViewItem(id: id, view: AnyView(view), presentationStyle: style)
            viewStack.append(item)
            IsacNavigationLogger.shared.logPush(id: id) // 로그 기록
        }
    }

    func pop() {
        if let item = viewStack.popLast() {
            IsacNavigationLogger.shared.logPop(id: item.id) // 로그 기록
        }
    }

    func popToRoot() {
        viewStack.removeAll()
        IsacNavigationLogger.shared.logPopToRoot()
    }
}

