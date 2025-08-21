//
//  File.swift
//  IsacCore
//
//  Created by shinisac on 8/20/25.
//

import SwiftUI

@available(iOS 13.0, *)
@MainActor
public final class IsacNavigationManager: ObservableObject {
    public static let shared = IsacNavigationManager()
    
    @Published public private(set) var viewStack: [IsacViewItem] = []
    
    private init() {}
    
    public struct IsacViewItem: Identifiable, Equatable {
        public let id: String
        public let view: AnyView
        public let presentationStyle: PresentationStyle
        
        public enum PresentationStyle {
            case navigationLink
            case sheet
            case fullScreenCover
        }

        public static func == (lhs: IsacViewItem, rhs: IsacViewItem) -> Bool {
            lhs.id == rhs.id
        }
    }

    public var activeView: IsacViewItem? {
        viewStack.last
    }

    public func push<V: View>(_ view: V, id: String, style: IsacViewItem.PresentationStyle = .navigationLink) {
        if !viewStack.contains(where: { $0.id == id }) {
            let item = IsacViewItem(id: id, view: AnyView(view), presentationStyle: style)
            viewStack.append(item)
            IsacNavigationLogger.shared.logPush(id: id) // 로그 기록
        }
    }

    public func pop() {
        if let item = viewStack.popLast() {
            IsacNavigationLogger.shared.logPop(id: item.id) // 로그 기록
        }
    }

    public func popToRoot() {
        viewStack.removeAll()
        IsacNavigationLogger.shared.logPopToRoot()
    }
}

