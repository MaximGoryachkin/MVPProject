//
//  DetailView.swift
//  MVPProject
//
//  Created by Максим Горячкин on 08.01.2024.
//

import UIKit

final class DetailView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .systemBackground
        view.frame = self.bounds
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.frame = scrollView.bounds
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .regular)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(descriptionLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        let rect = contentView.subviews.reduce(CGRect.zero) {
            $0.union($1.frame)
        }
        
        scrollView.contentSize = rect.size
    }
    
    private func setupConstraints() {
        let inset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: frame.height / 3),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: inset),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset)
        ])
        scrollView.contentSize = CGSize(width: frame.width, height: frame.height + 200)
    }
    
    public func renderViews(with model: DetailViewModel) {
        titleLabel.text = model.title
        dateLabel.text = model.date
        descriptionLabel.text = model.descripption
        
        if let url = NSURL(string: model.image) {
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
