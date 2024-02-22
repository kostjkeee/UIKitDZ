// WkWebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран для отображения WkWebView
class WkWebViewController: UIViewController {
    // MARK: - Public Properties

    var urlString: String?

    // MARK: - Private Properties

    private let webView = WKWebView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        loadRequest()
    }

    // MARK: - Private Methods

    private func setupWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func loadRequest() {
        guard let safeUrl = URL(string: urlString ?? "www.apple.com") else { return }
        let urlRequest = URLRequest(url: safeUrl)
        webView.load(urlRequest)
    }
}
