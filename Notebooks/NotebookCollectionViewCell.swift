//
//  NotebookCollectionViewCell.swift
//  Notebooks
//
//  Created by Hernandez, Rodolfo on 8/27/18.
//  Copyright © 2018 Rodolfo Hernandez. All rights reserved.
//

import UIKit
import SnapKit
import SwiftIcons

class NotebookCollectionViewCell: UICollectionViewCell {

    lazy var textViewTitle: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        return textView
    }()

    lazy var imageViewCover: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(textViewTitle)
        textViewTitle.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(20)
            make.height.equalTo(32)
        }

        contentView.addSubview(imageViewCover)
        imageViewCover.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(5)
            make.left.equalToSuperview().inset(5)
            make.right.equalToSuperview().inset(5)
            make.bottom.equalTo(textViewTitle.snp.top).inset(5)
        }
        imageViewCover.image = UIImage.init(icon: .fontAwesomeSolid(.bookOpen), size: CGSize(width: 40, height: 40))


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
