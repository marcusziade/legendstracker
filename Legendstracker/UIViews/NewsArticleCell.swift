import Combine
import Foundation
import Kingfisher
import UIKit

final class NewsArticleCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        let LabelVStackView = UIStackView(arrangedSubviews: [titleLabel, captionLabel])
            .configure {
                $0.axis = .vertical
                $0.alignment = .leading
                $0.spacing = 4
                $0.layoutMargins = .init(top: .zero, left: 8, bottom: .zero, right: 8)
                $0.isLayoutMarginsRelativeArrangement = true
            }
        let stackView = UIStackView(arrangedSubviews: [articleImageView, LabelVStackView])
            .configure {
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.axis = .vertical
                $0.alignment = .leading
                $0.spacing = UIStackView.spacingUseSystem
                $0.layoutMargins = .init(top: 12, left: .zero, bottom: 12, right: .zero)
                $0.isLayoutMarginsRelativeArrangement = true
            }

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            articleImageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }

    func configure(with article: NewsArticle) {
        titleLabel.text = article.title
        captionLabel.text = article.shortDesc
        articleImageView.kf.setImage(with: article.img)
    }

    // MARK: Private

    private let articleImageView = UIImageView()
        .configure {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }

    private let titleLabel = UILabel()
        .configure {
            $0.numberOfLines = 0
            $0.font = UIFont.preferredFont(forTextStyle: .title2, compatibleWith: .init(legibilityWeight: .bold))
        }

    private let captionLabel = UILabel()
        .configure {
            $0.numberOfLines = 0
            $0.font = UIFont.preferredFont(forTextStyle: .body)
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

