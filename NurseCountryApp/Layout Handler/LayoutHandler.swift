//
//  LayoutHandler.swift
//  NurseCountryApp
//
//  Created by Nurse Ntombi Masango on 2023/01/09.
//

import Foundation
import UIKit

func layout() -> UICollectionViewLayout {
    return UICollectionViewCompositionalLayout { section, enviroment in
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.375))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        //            group.interItemSpacing = NSCollectionLayoutSpacing.flexible(20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20.0
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
        
        return section
    }
}
