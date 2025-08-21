//
//  File.swift
//  IsacCore
//
//  Created by shinisac on 8/21/25.
//

import Foundation

/// 앱 환경설정 및 Feature Flag를 관리하는 매니저
public final class EnvironmentManager {
    @MainActor public static let shared = EnvironmentManager()
    
    public enum Environment {
        case development
        case staging
        case production
    }
    
    public private(set) var current: Environment = .development
    
    private init() {}
    
    public func setEnvironment(_ environment: Environment) {
        current = environment
    }
}
