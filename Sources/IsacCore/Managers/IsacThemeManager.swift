//
//  File.swift
//  IsacCore
//
//  Created by shinisac on 8/21/25.
//

import SwiftUI

/// 앱 전역 테마를 관리하는 매니저
@available(iOS 13.0, *)
public final class IsacThemeManager: ObservableObject {
    @MainActor public static let shared = IsacThemeManager()
    
    @Published public private(set) var primaryColor: Color = .secondary
    @Published public private(set) var accentColor: Color = .white
    @Published public private(set) var font: Font = .body
    
    private init() {}
    
    public func updateTheme(primary: Color? = nil, accent: Color? = nil, font: Font? = nil) {
        if let primary = primary { self.primaryColor = primary }
        if let accent = accent { self.accentColor = accent }
        if let font = font { self.font = font }
    }
}
