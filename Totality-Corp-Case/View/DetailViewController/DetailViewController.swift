//
//  DetailViewController.swift
//  Totality-Corp-Case
//
//  Created by Caner Çağrı on 1.08.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private var downloadBtnRightConstraint: NSLayoutConstraint!
    private var playButtonBottomConstraint: NSLayoutConstraint!
    private let detailViewModel = DetailViewModel()
    
    
    // MARK: - UI Components
    private let imageView = TCImageView(cornerRadius: 20, baseBackgroundColor: Colors.imageBackgroundColor)
    private let nameLabel = TCLabel(text: K.detailName, font: UIFont.systemFont(ofSize: 20, weight: .medium), textAlligment: .left, numberOfLines: 0, lineBreakMode: .byWordWrapping)
    private let closeButton = TCButton(backgroundImage: Images.XImage!, alpha: 0)
    private let descriptionLabel = TCLabel(text: K.detailDescription, font: UIFont.systemFont(ofSize: 16, weight: .light), textAlligment: .left, numberOfLines: 0, lineBreakMode: .byCharWrapping)
    private let readMoreButton = TCButton(setTitle: "READ MORE", alpha: 0, setTitleColor: Colors.readMoreBackgroundColor!)
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 250, height: 500)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        collectionView.alpha = 0
        return collectionView
    }()
    
    private let greenButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitle("DOWNLOAD\n30 MB", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.sizeToFit()
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let stopDownloadButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        button.setImage(Images.XImage, for: .normal)
        button.backgroundColor = Colors.imageBackgroundColor
        return button
    }()
    
    private let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.alpha = 0
        progressBar.progressTintColor = .green
        progressBar.layer.cornerRadius = 30
        progressBar.clipsToBounds = true
        return progressBar
    }()
    
    private let progressBarLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10 MB / 30 MB"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let playButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.playButtonBackgroundColor
        button.setTitle("PLAY", for: .normal)
        button.alpha = 0
        button.layer.cornerRadius = 30
        return button
    }()
    
    // MARK: View Controller Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewDidLoad()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        startAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        stopDownloadButton.layer.cornerRadius = stopDownloadButton.frame.height / 2
        stopDownloadButton.layer.masksToBounds = true
    }
    
    private func configureViewDidLoad() {
        greenButton.addTarget(self, action: #selector(downloadTapped), for: .touchUpInside)
        view.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - CollectionView Entrance Animation
    func startAnimation() {
        self.collectionView.transform = CGAffineTransform(translationX: 200, y: -20)
        UIView.animate(withDuration: 1) {
            self.collectionView.transform = .identity
            self.readMoreButton.alpha = 1
            self.collectionView.alpha = 1
            self.closeButton.alpha = 1
        }
    }
    
    @objc private func downloadTapped() {
        downloadBtnRightConstraint.constant = -70
        UIView.animate(withDuration: 1) {
            
            self.stopDownloadButton.alpha = 1
            self.view.layoutIfNeeded()
            
        } completion: { _ in
            self.greenButton.alpha = 0.2
            self.animateDownloading()
        }
    }
    
    // MARK: - Download Animation
    func animateDownloading() {
        progressBar.alpha = 1
        progressBarLabel.alpha = 1
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseIn) {
            self.progressBar.setProgress(1, animated: true)
            self.view.layoutIfNeeded()
        } completion: { _ in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.stopDownloadButton.setImage(Images.checkMark, for: .normal)
                self.hideDownloadButton()
            }
        }
    }
    
    func hideDownloadButton() {
        UIView.animate(withDuration: 1, delay: 0.5, options:.curveLinear) {
            self.greenButton.alpha = 0
            self.progressBar.alpha = 0
            self.progressBarLabel.alpha = 0
            self.stopDownloadButton.alpha = 0
        } completion: { _ in
            self.showPlayButton()
        }
    }
    
    func showPlayButton() {
        playButtonBottomConstraint.constant = -100
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
            self.view.layoutIfNeeded()
            self.playButton.alpha = 1
            self.playButtonBottomConstraint.constant = -20
        } completion: { _ in
            let playButtonTapped = UITapGestureRecognizer(target: self, action: #selector(self.playButtonTapped))
            self.playButton.addGestureRecognizer(playButtonTapped)
        }
    }
    
    @objc private func playButtonTapped() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) { [weak self] in
            let popupVc = BottomPopupViewController()
            
            popupVc.modalTransitionStyle = .crossDissolve
            popupVc.modalPresentationStyle = .overFullScreen
            self?.present(popupVc, animated: true)
        }
    }
    
    // MARK: - Creating Layout
    private func setupLayout() {
        view.addSubviews(imageView, nameLabel, descriptionLabel, closeButton, readMoreButton, collectionView, greenButton, progressBar, progressBarLabel, stopDownloadButton, playButton)
        
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 85).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        readMoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        readMoreButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        readMoreButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        readMoreButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: readMoreButton.bottomAnchor, constant: 30).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        greenButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        greenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        downloadBtnRightConstraint = greenButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        downloadBtnRightConstraint.isActive = true
        greenButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        collectionView.bottomAnchor.constraint(equalTo: greenButton.topAnchor, constant: -20).isActive  = true
        
        progressBar.topAnchor.constraint(equalTo: greenButton.topAnchor).isActive = true
        progressBar.leadingAnchor.constraint(equalTo: greenButton.leadingAnchor).isActive = true
        progressBar.trailingAnchor.constraint(equalTo: greenButton.trailingAnchor).isActive = true
        progressBar.bottomAnchor.constraint(equalTo: greenButton.bottomAnchor).isActive = true
        
        progressBarLabel.centerXAnchor.constraint(equalTo: progressBar.centerXAnchor).isActive = true
        progressBarLabel.centerYAnchor.constraint(equalTo: progressBar.centerYAnchor).isActive = true
        
        stopDownloadButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stopDownloadButton.topAnchor.constraint(equalTo: greenButton.topAnchor, constant: 10).isActive = true
        stopDownloadButton.bottomAnchor.constraint(equalTo: greenButton.bottomAnchor, constant: -10).isActive = true
        stopDownloadButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        playButtonBottomConstraint = playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        playButtonBottomConstraint.isActive = true
        playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
    }
}

// MARK: - Collection View Delegate And Datasource
extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailViewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath) as? DetailCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}
