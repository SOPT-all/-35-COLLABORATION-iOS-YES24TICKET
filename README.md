# 35-COLLABORATION-iOS-YES24TICKET
| 35기 AND SOPT 합동세미나 모바일 앱 7팀 - YES24TICKET 🎫

극강의 효율을 자랑하는 YES24TICKET iOS팀 입니다.🔋
![아요](https://hackmd.io/_uploads/H1rvqDwMkg.png)

## 🎫 Team Members

<div align=center>
  Team iOS는 미쳤습니다. - 조성민
  
<img width="200px" src="https://github.com/0gonge.png"/> | <img width="200px" src="https://github.com/SungMinCho-Kor.png"/> | <img width="200px" src="https://github.com/lalaurrel.png"/> |
|:-----:|:-----:|:-----:|
|[송여경](https://github.com/0gonge)|[조성민](https://github.com/SungMinCho-Kor)|[박어진](https://github.com/lalaurrel)|
| `상세정보, 표 선택` | `홈` | `추천 공연` |

</div>
<br>

## 🎫 Tech
| 라이브러리 |
| :-: | 
| ![Alamofire](https://img.shields.io/badge/Alamofirre-5.10.1-orange) ![Kingfisher](https://img.shields.io/badge/Kingfisher-7.12.0-blue) ![SnapKit](https://img.shields.io/badge/SnapKit-5.7.1-purple) ![Then](https://img.shields.io/badge/Then-3.0.0-lightgreen) |


## 🎫 CodingConvention
https://github.com/StyleShare/swift-style-guide
주석은 없습니다 → 클린코드 지향


## 🎫 Commit Convention
예시)
feat: XX기능 구현 #3

`feat:` 새로운 기능 추가
• 새로운 기능을 추가할 때 사용됩니다. 이전에 존재하지 않았던 새로운 기능이나 기능의 확장을 포함합니다.

`fix:` 버그 수정
• 기존 기능의 오류를 수정하는데 사용됩니다. 애플리케이션의 기능 또는 동작이 의도한 대로 작동하지 않을 때 사용됩니다.

`docs:` 문서 작성
• 문서를 추가하거나 변경할 때 사용됩니다. 주로 README 파일, 사용 설명서, 주석 등의 변경을 의미합니다.

`build:` 세팅 파일, 폴더 구조 등 빌드 세팅에 관련된 작업
• 빌드 스크립트나 외부 종속성의 변경사항을 의미합니다. 주로 빌드 프로세스나 빌드 설정의 변경사항을 의미합니다.

`refactor:`  전면 수정이 있을 때 사용합니다. 

`chore:` 그 이외의 잡일 / 버전 코드 수정, 패키지 구조 변경, 파일 이동, 파일이름 변경

## 🎫 WorkFlow

GitHub Project를 이용하여 Backlog 작성 (Assignees, Deadline, Status 필수 작성)

Backlog를 통해서 Issue 생성 (Project의 StartDate 작성, Issue Template 적용) 

Issue를 통해 Branch 생성 (Branch Naming Convention 적용)

작업후 Pull Request 작성 (Pull Request Template 적용)


## 🎫 Foldering

```swift
🌕 📦 iOS
┃
┣ 📂 Application
┃ ┣ 📜 Appdelegate.swift
┃ ┣ 📜 SceneDelegate.swift
┃
┣ 📂 Model
┃ ┣ 📜 Player.swift
┃
┣ 📂 Network
┃ ┣ 📂 DTO
┃ ┃ ┣ 📂 Request
┃ ┃ ┃ ┣ 📜 PlayerDTO.swift
┃ ┃ ┣ 📂 Response
┃ ┃ ┃ ┣ 📜 PlayerDTO.swift
┃ ┣ 📂 Error
┃ ┃ ┣ 📜 NetworkError.swift
┃ ┣ 📂 Router
┃ ┃ ┣ 📜 DefaultRouter.swift
┃ ┃ ┣ 📂 Protocol
┃ ┃ ┃ ┣ 📜 Router.swift
┃ ┣ 📂 Service
┃ ┃ ┣ 📜 APIService.swift
┃
┣ 📂 Presentation
┃ ┣ 📂 Home
┃ ┣ 📂 Onboarding
┃ ┃ ┣ 📂 Cell
┃ ┃ ┃ ┣ 📜 OnboardingTableViewCell.swift
┃ ┃ ┣ 📂 View
┃ ┃ ┃ ┣ 📜 OnboardingView.swift
┃ ┃ ┣ 📂 ViewController
┃ ┃ ┃ ┣ 📜 OnboardingViewController.swift
┃ ┣ 📂 TabBar
┃
┣ 📂 Resources
┃ ┣ 📜 Assets.xcassets
┃ ┣ 📜 Info.plist
┃ ┣ 📜 LaunchScreen.storyboard
┃
┣ 📂 Utility
┃ ┣ 📜 Singleton.swift

```

<img src="https://github.com/user-attachments/assets/5c2d303a-b024-412a-82d9-75fa97dd0100" width="360">
