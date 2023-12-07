import SwiftUI

class AnimatedSlideViewModel: ObservableObject {
    @Published var offset: CGFloat = 0
    @Published var offsetRatio: CGFloat = 0
    @Published var currentPage: Int = 0
    @Published var dragStarted: Bool = false
    
    private let totalPageCount: Int
    private var firstOffset: CGFloat = 0
    
    init(totalPageCount: Int) {
        self.totalPageCount = totalPageCount
    }
    
    func setOffset(_ offset: CGFloat) {
        if dragStarted == false {
            firstOffset = offset
            dragStarted = true
        }
        self.offset = offset - firstOffset
        self.offsetRatio = self.offset / UIScreen.main.bounds.width
    }
    
    func resetOffset() {
        handleCurrentPage()
        
        self.dragStarted = false
        self.firstOffset = 0
        self.offset = 0
        self.offsetRatio = 0
    }
    
    private func handleCurrentPage() {
        guard offsetRatio.magnitude > 0.2  else { return }
        if offsetRatio < 0 {
            switch currentPage {
            case totalPageCount - 1:
                currentPage = 0
            default:
                currentPage += 1
            }
        } else {
            switch currentPage {
            case 0:
                currentPage = totalPageCount - 1
            default:
                currentPage -= 1
            }
        }
    }
}
