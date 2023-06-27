import Foundation

public struct WotService {
    
    // MARK: - public properties
    
    /// Base URL for all APIs (This URL should end with "/")
    public private(set) var baseUrl: String
    /// Instance of Bundle
    public private(set) var bundle: Bundle
    
    public static var shared: WotService = WotService()
    
    // MARK: - init
    
    private init() {
        self.baseUrl = ""
        self.bundle = Bundle.main
    }
    
    // MARK: - public methods
    
    /// Add some base configuration for WotService package
    /// - Parameters:
    ///   - baseUrl: Base URL for all APIs
    ///   - bundle: Instance of Bundle
    public func configure(
        baseUrl: String = WotService.shared.baseUrl,
        bundle: Bundle = WotService.shared.bundle) {
            
        WotService.shared.baseUrl = baseUrl
        WotService.shared.bundle = bundle
    }
}
