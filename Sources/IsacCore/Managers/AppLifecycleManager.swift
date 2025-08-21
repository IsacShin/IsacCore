//
//  File.swift
//  IsacCore
//
//  Created by shinisac on 8/21/25.
//

import SwiftUI

/// 앱 라이프사이클 상태를 관리하는 매니저
@available(iOS 14.0, *)
public final class AppLifecycleManager: ObservableObject {
    @MainActor public static let shared = AppLifecycleManager()
    
    @Published public private(set) var scenePhase: ScenePhase = .inactive
    
    private init() {}
    
    public func updateScenePhase(_ newPhase: ScenePhase) {
        scenePhase = newPhase
    }
}
