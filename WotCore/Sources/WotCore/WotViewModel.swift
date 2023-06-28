//
//  WotViewModel.swift
//  
//
//  Created by Bruno Duarte on 28/06/23.
//

import Foundation

/// Main view model protocol
public protocol WotViewModelProtocol {
    
    /// Screen title
    var title: String { get }
    /// ViewModel reaction delegate
    var reaction: WotViewModelReaction? { get set }
    
    /// Change ViewModel's View state
    /// - Parameter viewState: Current state
    func updateViewState(_ viewState: ViewState)
}

/// ViewModel reaction delegate
public protocol WotViewModelReaction: AnyObject {
    /// Change ViewModel's View state
    /// - Parameter viewState: Current state
    func updateViewState(_ viewState: ViewState)
}

/// Posible states for ViewModel
public enum ViewState {
    case startLoading
    case stopLoading
    case updateContent
    case showAlert(title: String, message: String)
}
