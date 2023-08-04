//
//  AnimationManager.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 1.08.2023.
//

import UIKit

// MARK: - Animation For Detail VC Presentation
class AnimationManager: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let animationDuration: Double
    
    init(animationDuration: Double){
        self.animationDuration = animationDuration
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration) ?? 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        transitionContext.containerView.addSubview(toVC.view)
        presentAnimation(with: transitionContext, viewToAnimate: toVC.view)
    }
    
    func presentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(scaleX: 0.8, y: 0.6)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseIn) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        } completion: { _ in
            transitionContext.completeTransition(true)
        }
    }
}
