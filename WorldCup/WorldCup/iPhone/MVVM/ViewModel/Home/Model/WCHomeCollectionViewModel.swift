//
//  WCHomeCollectionViewModel.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import UIKit

class WCHomeCollectionViewModel: NSObject {
    private enum Constante {
        static let nameCell = "WCHomeCollectionViewCell"
        static let defaultNumber = 1
    }

    private weak var controller: UIViewController?
    private weak var clvHome: UICollectionView?

    private var arrayHome: [WCHome]!

    init(toController: UIViewController,
         toCollectionView: UICollectionView,
         toArrayHome: [WCHome]
    ) {
        controller = toController
        clvHome = toCollectionView
        arrayHome = toArrayHome
        super.init()
//        self.layoutCollection()
    }

    func layoutCollection() {

//        if let layout = clvHome?.collectionViewLayout as? PinterestLayout {
//            layout.delegate = self
//        }
//        clvHome?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

extension WCHomeCollectionViewModel: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayHome.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constante.nameCell,
            for: [indexPath.row]
        ) as! WCHomeCollectionViewCell
        cell.objHome = arrayHome[indexPath.row]

        cell.backgroundColor = .white

        return cell
    }
}
