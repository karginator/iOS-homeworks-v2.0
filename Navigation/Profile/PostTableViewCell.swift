//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Maksim Kargin on 10.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifire = "PostTableViewCell"
    
    var authorLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var likesLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    var viewsLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
       return label
    }()
    
    var imageImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func PostTableViewCellConstraintFunc() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            authorLabel.heightAnchor.constraint(equalToConstant: 20),
            
            imageImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            imageImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageImageView.bottomAnchor, constant: 16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -48),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.heightAnchor.constraint(equalToConstant: 16),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(authorLabel, descriptionLabel, likesLabel, viewsLabel, imageImageView)
        PostTableViewCellConstraintFunc()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    public func specifyFields(post: Post) {
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        imageImageView.image = UIImage(named: post.image)
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
