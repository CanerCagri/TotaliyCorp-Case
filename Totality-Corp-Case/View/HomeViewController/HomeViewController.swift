//
//  HomeViewController.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 31.07.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Communicate With View Model
    private let homeViewModel = HomeViewModel()
    
    // MARK: - Creating UI Components.
    private let containerView = TCContainerView(cornerRadius: 22)
    private let imageView = TCImageView(cornerRadius: 20)
    private let greenButton = TCButton(cornerRadius: 30, baseBackgroundColor: .green)
    private let emptyContainer = TCContainerView(cornerRadius: 22)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewDidLoad()
    }
    
    private func configureViewDidLoad() {
        view.backgroundColor = .systemBackground
        title = K.homeVcTitle
        
        let containerViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        containerView.addGestureRecognizer(containerViewTapGesture)
        
        setupLayout()
    }
    
    // MARK: - Presenting Detail View Controller
    @objc private func handleTap() {
        let detailVC = DetailViewController()
        detailVC.modalPresentationStyle = .fullScreen
        detailVC.transitioningDelegate = self
        present(detailVC, animated: true)
    }
    
    // MARK: - Creating layout programmatically.
    private func setupLayout() {
        view.addSubviews(containerView, imageView, greenButton, emptyContainer)
        
        containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25).isActive = true
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 85).isActive = true
        
        greenButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        greenButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        greenButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        greenButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        emptyContainer.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10).isActive = true
        emptyContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        emptyContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        emptyContainer.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
}

// MARK: Animation Delegate
extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return homeViewModel.startAnimation()
    }
}
