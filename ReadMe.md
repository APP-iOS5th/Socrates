# Know YourSelf

<!--배지-->

![MIT License][license-shield] ![Repository Size][repository-size-shield] ![Issue Closed][issue-closed-shield]

<!--프로젝트 대문 이미지-->

<p align="center">
  <img src="https://storage.googleapis.com/socrates-image/Splash.png" alt="Img" width="200">
</p>

## 기능

- 다양한 심리 테스트 제공
- 테스트 결과를 앨범에 저장
- 테스트 결과를 공유

## 개발환경

- iOS 17.4
- Xcode 15.4

## 설치

1. 이 저장소를 클론합니다.
   ```sh
   git clone https://github.com/APP-iOS5th/Socrates.git
   ```
2. Xcode에서 `KnowYourSelf.xcodeproj` 파일을 엽니다.
3. Xcode에서 프로젝트를 빌드하고 실행합니다.

## 사용 예제

<!-- 형준님 -->

### - Overwatch Test

<br>

<p align="center">
  <img src="https://storage.googleapis.com/socrates-image/overwatch.png" alt="Img" width="200">
</p>

<br>

```
이 테스트는 오버워치의 많은 영웅 중에서 나와 성향이 비슷하거나 어울리는 영웅을 찾는 테스트입니다. 
```

**특징:**

- 일상적인 질문 : 게임과 무관한 질문으로 구성하여 오버워치를 몰라도 누구나 부담없이 참여할 수 있습니다.
- 다양한 질문과 결과 : 각 선택지마다 계속 다른 질문 나타나며, 총 38개의 다양한 결과를 볼 수 있으므로 사용자가 흥미롭게 여러번 플레이할 수 있습니다. 

**사용 방법:**

 1. 메인화면에서 오버워치2 사진을 선택하고 입장 버튼을 누릅니다.
 2. 질문에 맞게 답변을 선택합니다.
 3. 다양한 결과를 확인합니다. 

**Tech:**

- 

**문제:**

- 선택지 갯수가 달라지면서 빈 버튼이 생기거나 앱이 터지는 문제

**해결:**

- nil값 사용, 각 버튼별 언래핑하여 숨겼다.

<br>

<hr>
<!-- 김성국 -->

### - T Test

<br>

<p align="center">
  <img src="https://storage.googleapis.com/socrates-image/TTest.png" alt="Img" width="200">
</p>

<br>

```
T Test는 현대 사회에서 T에 대한 부정적인 인식을 유머러스하게 다루기 위해 만들어진 재미있는 심리 테스트입니다. 이 테스트는 사용자에게 다양한 질문을 통해 T에 대한 인식을 분석하고, 그 결과를 재미있고 가벼운 방식으로 제공하여 사용자에게 웃음을 줍니다.
```

**특징:**

- 유머러스한 접근 방식: T에 대한 부정적인 인식을 장난스럽게 다루어 사용자에게 웃음을 줍니다.
- 다양한 질문: 사용자에게 다양한 질문을 통해 T에 대한 인식을 평가합니다.
- 재미있는 결과 제공: 테스트 결과는 5가지의 결과가 존재하며, 재미있고 가벼운 방식으로 제공되어 사용자에게 긍정적인 경험을 제공합니다.

**사용 방법:**

1. 메인 화면에서 T Test를 선택합니다.
2. 질문에 답변합니다.
3. 재미있는 결과를 확인하고 친구들과 공유합니다.

**Tech:**

- MVVM(Model-View-ViewModel) 아키텍처를 채택하여 코드의 유지보수성과 확장성을 높였습니다.
- T Test 프로젝트에서는 이벤트 처리를 효율적으로 관리하기 위해 Combine 프레임워크를 사용하였습니다.

**문제:**

- 결과 창에서 테스트로 다시 돌아갔을 경우 스코어가 계속 쌓이는 문제

**해결:**

- 테스트 진행 시 이전 질문의 존재로 결과창에서 다시 돌아갈 일이 없다고 판단하여 초기화 진행

<br>

<hr>
<!-- 서경님 -->

### - 앱스쿨 유형 테스트

<br>

<p align="center">
  <img src="https://storage.googleapis.com/socrates-image/AppSchool.png" alt="Img" width="200">
</p>

<br>

```
앱스쿨 유형 테스트는 테킷 iOS 앱스쿨 5기 중에서 나와 가장 비슷한 사람을 알려줍니다!
모든 인원을 포함하고 싶었지만 채팅창에 자주 보이는 / 특징이 있는 소수의 인원을 추려서 만들었습니다.
결과는 매우 주관적일 수 있습니다.
```

**특징:**

- 강의를 수강하며 일상적으로 생기는 상황에 대한 질문이 제공됩니다.
- 총 11가지의 결과가 있으며 각 결과에는 귀여운 그림이 포함되어있습니다.

**사용 방법:**

1. 메인 화면에서 앱스쿨 유형 테스트를 선택합니다.
2. 질문에 답변합니다.
3. 테스트 결과를 친구에게 공유합니다.

**Tech:**

- MVVM(Model-View-ViewModel) 아키텍처를 채택하여 코드의 유지보수성과 확장성을 높였습니다.

**문제:**

- 이전 버튼을 눌러 돌아왔을 때 이전에 선택했던 답안이 유지되게끔 했더니 다음 버튼을 눌렀을 때 같은 질문에 대한 결과값이 중복 저장되는 문제가 있었음

**해결:**

- 직전에 추가된 값을 temp 변수에 저장해두고, 선택지 선택 후 다음 버튼을 눌렀다가 이전 버튼을 눌러 돌아오면 무조건 직전값이 제거되게 처리하였음

<br>

<hr>
<!-- 소희님 -->

### - 소희님

<br>

<p align="center">
  <img src="https://storage.googleapis.com/socrates-image/Splash.png" alt="Img" width="200">
</p>

<br>

```
Test
```

**특징:**

- 123

**사용 방법:**

1. 2

**Tech:**

- 1

**문제:**

- 키보드 클릭 시 네이게이션 타이틀로 올라가는게 다 보이는 문제

**해결:**

- goruf

<br>

<hr>
<!-- Entertainment -->

### - EnterTainment

<br>

<p align="center">
  <img src="https://storage.googleapis.com/socrates-image/Entertainment.png" alt="Img" width="200">
</p>

<br>

```
배우 맞추기 및 드라마, 영화 제목 맞추기 기능을 제공하는 퀴즈게임입니다.
```

**Tech:**

- [서버 GithubLink](https://github.com/SeongKookKIM/Socrates-API.git)
- [퀴즈 API](https://socrates-api.vercel.app/socrates)
- Express + TypeScript를 사용하여 서버 개발
- Vercel을 통한 배포
- MVVM(Model-View-ViewModel) 아키텍처를 채택하여 코드의 유지보수성과 확장성을 높였습니다.
- 데이터 패칭시 비동기 관리를 효율적으로 관리하기 위해 Combine 프레임워크를 사용하였습니다.

**문제:**

- NotificationCenter를 사용하여 키보드 이벤트를 감지하여 뷰를 이동시킬때 NavigationBar까지 침법하는 문제발생

**해결:**

- NavigationBar에 BackGround 색상을 주어서 보다 자연스러운 UI로 해결

<!--Url for Badges-->

[license-shield]: https://img.shields.io/github/license/dev-ujin/readme-template?labelColor=D8D8D8&color=04B4AE
[repository-size-shield]: https://img.shields.io/github/repo-size/dev-ujin/readme-template?labelColor=D8D8D8&color=BE81F7
[issue-closed-shield]: https://img.shields.io/github/issues-closed/dev-ujin/readme-template?labelColor=D8D8D8&color=FE9A2E
