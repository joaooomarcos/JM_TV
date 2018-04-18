//
//  MoviesViewController.swift
//  JM_TV
//
//  Created by Joao Marcos Ribeiro Araujo on 17/04/2018.
//  Copyright © 2018 JoaoMarcos. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    // MARK: - Variables
    
    private var movies: [MovieViewModel] = []
    private let itemSize = CGSize(width: 110, height: 165)
        
    private lazy var spacing: CGFloat = {
        self.view.layoutIfNeeded()
        let numberOfColuns = (self.view.frame.width / itemSize.width).rounded(.towardZero)
        let space = self.view.frame.width.truncatingRemainder(dividingBy: itemSize.width)
        return space / (numberOfColuns + 1)
    }()
    
    enum ViewState {
        case loading
        case normal
        case error
    }
    
    private var viewState: ViewState = .normal {
        didSet {
            self.reloadLayout()
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet private weak var filterSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var listCollectionView: UICollectionView!
    
    // MARK: - Actions
    
    @IBAction func filterSegmentedControlChanged(_ sender: UISegmentedControl) {
        self.loadData(with: FilterType(rawValue: sender.selectedSegmentIndex) ?? .nowPlaying)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listCollectionView.register(LoadingPosterCollectionViewCell.self, forCellWithReuseIdentifier: LoadingPosterCollectionViewCell.identifier)
        
        self.loadData(with: FilterType(rawValue: filterSegmentedControl.selectedSegmentIndex) ?? .topRated)
    }
    
    private func reloadLayout() {
        switch viewState {
        case .loading:
            self.listCollectionView.reloadData()
        case .normal:
            self.listCollectionView.reloadData()
        case .error:
            break
        }
    }
    
    private func loadData(with filter: FilterType) {
        self.viewState = .loading
        MovieViewModel.getMovies(with: filter, completion: { [weak self] movies in
            self?.movies = movies
            self?.viewState = .normal
        })
    }
    
}

// MARK: - Collection View Data Source
extension MoviesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch viewState {
        case .loading:
            return 9
        default:
            return movies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewState {
        case .loading:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingPosterCollectionViewCell.identifier, for: indexPath) as? LoadingPosterCollectionViewCell else {
                fatalError("LoadingPosterCollectionViewCell not found")
            }
            
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.posterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
                fatalError("PosterCollectionViewCell not found")
            }
            
            cell.setup(with: movies[indexPath.row])
            return cell
        }
    }
}

// MARK: - Collection View Delegate Flow Layout
extension MoviesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
    }
}
