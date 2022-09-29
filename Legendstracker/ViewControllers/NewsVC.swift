//
//  NewsVC.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Combine
import Foundation
import UIKit

final class NewsVC: ViewController {

    init(model: NewsVM) {
        self.model = model
        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("News", comment: "news title string")
        navigationController?.navigationBar.prefersLargeTitles = true

        view.addSubview(tableView)
        view.addSubview(loadingView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

        model.$state
            .sink { [unowned self] state in
                switch state {

                case .loading:
                    loadingView.startAnimating()

                case .error(message: let errorMessage):
                    loadingView.stopAnimating()
                    let ac = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                    ac.addAction(.init(title: "OK", style: .default))
                    present(ac, animated: true)

                case .result(news: _):
                    loadingView.stopAnimating()
                    DispatchQueue.main.async { [self] in
                        tableView.reloadData()
                    }
                }
            }
            .store(in: &cancellables)
    }

    // MARK: Private

    private var cancellables = Set<AnyCancellable>()

    private let model: NewsVM

    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        view.dataSource = self
        view.registerCell(UITableViewCell.self)
        view.registerCell(NewsArticleCell.self)
        return view
    }()

    private let loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

extension NewsVC: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch model.state {
        case .loading:
            return 1
        case .error(message: _):
            return 1
        case .result(news: let articles):
            return articles.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basicCell = tableView.dequeueCell(UITableViewCell.self, forIndexPath: indexPath)
        let articleCell = tableView.dequeueCell(NewsArticleCell.self, forIndexPath: indexPath)
        var basicConfig = basicCell.defaultContentConfiguration()

        switch model.state {

        case .loading:
            basicConfig.text = "Loading..."
            basicCell.contentConfiguration = basicConfig
            return basicCell
        case .error(message: let errorMessage):
            basicConfig.text = "Error"
            basicConfig.secondaryText = errorMessage
            basicCell.contentConfiguration = basicConfig
            return basicCell

        case .result(news: let articles):
            articleCell.configure(with: articles[indexPath.row])
            return articleCell
        }
    }
}
