//
//  HomeViewModel.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 1.08.2023.
//

import UIKit

class HomeViewModel: NSObject {
    
    private let animationManager = AnimationManager(animationDuration: 1)

    func startAnimation() -> AnimationManager {
        return animationManager
    }
}
