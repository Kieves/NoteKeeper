//
//  NoteshelfViewController.swift
//  Notebooks
//
//  Created by Hernandez, Rodolfo on 8/15/18.
//  Copyright © 2018 Rodolfo Hernandez. All rights reserved.
//

import UIKit
import SnapKit

class NoteshelfViewController: UIViewController {

    let cellId = "cellId"
    var collectionView: UICollectionView!
    var notes = [String]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
    }

    // MARK: - Private

    @objc private func addNotebook() {
        notes.append("Test \(count)")
        count += 1
        collectionView.reloadData()
    }

    private func setupView() {
        title = "Noteshelf"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addNotebook))
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 80, height: 80)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.snp.remakeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }

        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView?.register(NotebookCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension NoteshelfViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NotebookCollectionViewCell
        cell.textViewTitle.becomeFirstResponder()
        return cell
    }
}

