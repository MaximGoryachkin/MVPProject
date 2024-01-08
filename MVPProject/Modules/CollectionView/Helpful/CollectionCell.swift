//
//  CollectionCell.swift
//  MVPProject
//
//  Created by Максим Горячкин on 24.12.2023.
//

import UIKit.UICollectionViewCell

class CollectionCell: UICollectionViewCell {
    static let identifier = String(describing: CollectionCell.self)
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        contentView.addSubview(dateLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: contentView.frame.height),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: label.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(_ picture: PictureModel) {
        label.text = picture.name
        dateLabel.text = picture.date
        
        if let url = NSURL(string: picture.url) {
            Task.detached(priority: .high) {
                do {
                    let image = try await NetworkManager.shared.loadImage(nsurl: url)
                    await MainActor.run {
                        self.imageView.image = image
                    }
                } catch {
                    await MainActor.run {
                        self.imageView.image = .strokedCheckmark
                    }
                }
            }
        }
    }
    
}
