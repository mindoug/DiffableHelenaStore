//
//  DetailViewController.swift
//  DiffableHelenaStore
//
//  Created by Mindy Douglas on 1/21/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    let sections = Bundle.main.decode([Section].self, from: "data.json")
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout {
            [weak self] (sectionIndex, environment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case "header": return LayoutSectionFactory.header()
            case "color": return LayoutSectionFactory.color()
            case "size": return LayoutSectionFactory.size()
            case "button": return LayoutSectionFactory.button()
            case "description": return LayoutSectionFactory.description()
            case "headerImage": return LayoutSectionFactory.headerImage()
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

        let header: RegisterableView = .nib(SectionHeader.self)
        
        let cells: [RegisterableView] = [
            .nib(HeaderCell.self),
            .nib(ColorCell.self),
            .nib(SizeCell.self),
            .nib(ButtonCell.self),
            .nib(DescriptionCell.self),
            .nib(HeaderImageCell.self)
        ]
        
        detailCollectionView.register(header: header)
        detailCollectionView.register(cells: cells)
        detailCollectionView.collectionViewLayout = collectionViewLayout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: detailCollectionView) { [weak self]  (collectionView, indexPath, item) in
        guard let self = self else { return UICollectionViewCell() }
        let snapshot = self.dataSource.snapshot()
        let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
        
        switch sectionType {
        case "headerImage":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderImageCell", for: indexPath)
            return cell
        case "header":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath)
            return cell
        case "color":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath)
            return cell
        case "size":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SizeCell", for: indexPath)
            return cell
        case "description":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionCell", for: indexPath)
            return cell
        case "button":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCell", for: indexPath)
            return cell
        default: return nil
        }
    }
    var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    snapshot.appendSections(sections)
    sections.forEach { snapshot.appendItems($0.items, toSection: $0) }
    dataSource.apply(snapshot, animatingDifferences: false)

    }
}
    

    

