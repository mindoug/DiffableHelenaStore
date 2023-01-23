//
//  ViewController.swift
//  DiffableHelenaStore
//
//  Created by Mindy Douglas on 1/21/23.
//

import UIKit

class ViewController: UIViewController {
   
    let sections = Bundle.main.decode([Section].self, from: "dashboard.json")
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout {
            [weak self] (sectionIndex, environment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case "ad": return LayoutSectionFactory.ad()
            case "category": return LayoutSectionFactory.category()
            case "product": return LayoutSectionFactory.product()
            default: return nil
            }
        }
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    func initialize() {
        setupCollectionView()
        configureDataSource()
    }
    
    func setupCollectionView() {
        
        let cells: [RegisterableView] = [
            .nib(AdCell.self),
            .nib(CategoryCell.self),
            .nib(ProductCell.self)
        ]
        collectionView.delegate = self
        collectionView.register(cells: cells)
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self]  (collectionView, indexPath, item) in
            guard let self = self else { return UICollectionViewCell() }
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case "ad": return self.configure(AdCell.self, with: item, for: indexPath)
            case "category": return self.configure(CategoryCell.self, with: item, for: indexPath)
            case "product": return self.configure(ProductCell.self, with: item, for: indexPath)
            default: return nil
            }
        }
    
    configureSupplementaryView()
    var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    snapshot.appendSections(sections)
    sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
    dataSource.apply(snapshot, animatingDifferences: false)

    }
    
    private func configureSupplementaryView() {
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            if kind == UICollectionView.elementKindSectionHeader {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeader
                
                if self.sections[indexPath.section].title.isEmpty == false {
                    header.lblTitle.text = self.sections[indexPath.section].title
                } else {
                    header.lblTitle.text = ""
                }
                return header
            }
        
            return UICollectionReusableView()
        }
    }
    
    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with item: Item, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue \(cellType)")
        }
        cell.configure(with: item)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
}
