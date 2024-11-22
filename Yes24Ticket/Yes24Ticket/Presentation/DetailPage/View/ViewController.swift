import UIKit
import SnapKit

final class HeaderDetailViewController: UIViewController {
    
    private let headerDetailView = DetailHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // 배경색 설정 (필요에 따라 수정)
//        view.backgroundColor = .clear
        // HeaderDetailView 추가
        view.addSubview(headerDetailView)
        
        // 레이아웃 설정
        headerDetailView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(700) // 높이는 필요에 따라 조정 가능
        }
    }
}

#Preview {
    HeaderDetailViewController()
}
