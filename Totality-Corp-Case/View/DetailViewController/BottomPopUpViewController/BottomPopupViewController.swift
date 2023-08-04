//
//  BottomViewController.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 1.08.2023.
//

import UIKit

class BottomPopupViewController: UIViewController {
    
    // MARK: - UI Components
    var containerView: UIView = {
        var container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemBackground
        return container
    }()
    
    private var nextButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.setTitle("NEXT", for: .normal)
        button.layer.cornerRadius = 30
        return button
    }()
    
    var firstContainerFirstView = FirstContainerFirstView()
    var firstContainerSecondView = FirstContainerSecondView()
    
    var secondContainerFirstView = SecondContainerFirstView()
    var secondContainerSecondView = SecondContainerSecondView()
    
    var thirdContainerFirstView = ThirdContainerFirstView()
    var thirdContainerSecondView = ThirdContainerSecondView()
    var clickCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleFirstView()
    }
    
    // MARK: - ViewDidLoad Actions
    private func configureViewDidLoad() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.frame = UIScreen.main.bounds
        
        let nextButtonTapGesture = UITapGestureRecognizer(target: self, action: #selector(nextButtonTapped))
        nextButton.addGestureRecognizer(nextButtonTapGesture)
        
        setupLayout()
    }
    
    // MARK: Button Controller
    @objc func nextButtonTapped() {
        clickCount += 1
        if clickCount == 1 {
            handleSecondView()
        } else if clickCount == 2 {
            handleThirdView()
        } else if clickCount == 3 {
            // TO DO
        }
    }
    
    // MARK: - Creating Layout
    private func setupLayout() {
        view.addSubviews(containerView)
        
        containerView.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        containerView.addSubview(nextButton)
        
        nextButton.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    // MARK: - First Page Controller
    private func handleFirstView() {
        containerView.addSubviews(firstContainerFirstView, firstContainerSecondView)
       
        firstContainerFirstView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        firstContainerFirstView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        firstContainerFirstView.widthAnchor.constraint(equalToConstant: containerView.frame.size.width).isActive = true
        firstContainerFirstView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -160).isActive = true
        
        firstContainerSecondView.topAnchor.constraint(equalTo: firstContainerFirstView.bottomAnchor).isActive = true
        firstContainerSecondView.widthAnchor.constraint(equalToConstant: containerView.frame.size.width).isActive = true
        firstContainerSecondView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20).isActive = true
        
      
        self.firstContainerFirstView.isHidden = false
        self.firstContainerSecondView.isHidden = false
        
        // MARK: - Animations
        firstContainerFirstView.mainView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        firstContainerSecondView.firstCircleView.transform = CGAffineTransform(translationX: 200, y: -20)
        firstContainerSecondView.secondCircleView.transform = CGAffineTransform(translationX: 220, y: -20)
        firstContainerSecondView.firstNameView.transform = CGAffineTransform(translationX: 240, y: -50)
        firstContainerSecondView.secondNameView.transform = CGAffineTransform(translationX: 260, y: -50)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut) {
            self.firstContainerFirstView.mainView.transform = .identity
            self.firstContainerSecondView.firstCircleView.transform = .identity
            self.firstContainerSecondView.secondCircleView.transform = .identity
            self.firstContainerSecondView.firstNameView.transform = .identity
            self.firstContainerSecondView.secondNameView.transform = .identity
            self.firstContainerFirstView.layoutIfNeeded()
            self.firstContainerSecondView.layoutIfNeeded()
        }
    }
    
    // MARK: - Second Page Controller
    private func handleSecondView() {
        firstContainerFirstView.removeFromSuperview()
        firstContainerSecondView.removeFromSuperview()
        containerView.addSubviews(secondContainerFirstView, secondContainerSecondView)
        
        secondContainerFirstView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        secondContainerFirstView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        secondContainerFirstView.widthAnchor.constraint(equalToConstant: containerView.frame.size.width).isActive = true
        secondContainerFirstView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -160).isActive = true
        
        secondContainerSecondView.topAnchor.constraint(equalTo: secondContainerFirstView.bottomAnchor).isActive = true
        secondContainerSecondView.widthAnchor.constraint(equalToConstant: containerView.frame.size.width).isActive = true
        secondContainerSecondView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20).isActive = true
        
        self.secondContainerFirstView.isHidden = false
        self.secondContainerSecondView.isHidden = false
        
        // MARK: - Animations
        secondContainerFirstView.mainView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        secondContainerSecondView.firstCircleView.transform = CGAffineTransform(translationX: 200, y: -20)
        secondContainerSecondView.secondCircleView.transform = CGAffineTransform(translationX: 220, y: -20)
        secondContainerSecondView.thirdCircleView.transform = CGAffineTransform(translationX: 220, y: -20)
        secondContainerSecondView.balanceLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        secondContainerSecondView.secondBalanceLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut) {
            self.secondContainerFirstView.mainView.transform = .identity
            self.secondContainerSecondView.firstCircleView.transform = .identity
            self.secondContainerSecondView.secondCircleView.transform = .identity
            self.secondContainerSecondView.thirdCircleView.transform = .identity
            self.secondContainerSecondView.balanceLabel.transform = .identity
            self.secondContainerSecondView.secondBalanceLabel.transform = .identity
            self.secondContainerSecondView.layoutIfNeeded()
            self.secondContainerFirstView.layoutIfNeeded()
        }
    }
    
    // MARK: - Third Page Controller
    private func handleThirdView() {
        secondContainerFirstView.removeFromSuperview()
        secondContainerSecondView.removeFromSuperview()
        containerView.addSubviews(thirdContainerFirstView, thirdContainerSecondView)
        
        thirdContainerFirstView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        thirdContainerFirstView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        thirdContainerFirstView.widthAnchor.constraint(equalToConstant: containerView.frame.size.width).isActive = true
        thirdContainerFirstView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -160).isActive = true
        
        thirdContainerSecondView.topAnchor.constraint(equalTo: thirdContainerFirstView.bottomAnchor).isActive = true
        thirdContainerSecondView.widthAnchor.constraint(equalToConstant: containerView.frame.size.width).isActive = true
        thirdContainerSecondView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20).isActive = true
        
        self.thirdContainerFirstView.isHidden = false
        self.thirdContainerSecondView.isHidden = false
        
        nextButton.setTitle("Confirm", for: .normal)
        nextButton.backgroundColor = .black
        nextButton.tintColor = .white
        
        // MARK: - Animations
        thirdContainerFirstView.mainLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        thirdContainerFirstView.secondaryLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        thirdContainerSecondView.firstCircleView.transform = CGAffineTransform(translationX: 200, y: -20)
        thirdContainerSecondView.secondCircleView.transform = CGAffineTransform(translationX: 220, y: -20)
        thirdContainerSecondView.thirdCircleView.transform = CGAffineTransform(translationX: 220, y: -20)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut) {
            self.thirdContainerFirstView.mainLabel.transform = .identity
            self.thirdContainerFirstView.secondaryLabel.transform = .identity
            self.thirdContainerSecondView.firstCircleView.transform = .identity
            self.thirdContainerSecondView.secondCircleView.transform = .identity
            self.thirdContainerSecondView.thirdCircleView.transform = .identity
            self.thirdContainerFirstView.layoutIfNeeded()
            self.thirdContainerSecondView.layoutIfNeeded()
        }
    }
}
