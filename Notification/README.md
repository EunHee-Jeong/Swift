# 🔔 푸시 알림

iOS 앱에서 사용자의 관심을 끄는 방법 중 하나이다.

<br>

## 종류

- Local Notification - 로컬 푸시, **앱 자체에서 보내는 것.** **정해진 시간에 동일한 문구로 전달**하고 싶은 경우
    - 예시
        - 특정 시간과 날짜에 맞춰 알림 전달
            
            → 로컬 기기 내에서 예측할 수 있는 경우
            
- Remote Notification - 서버 푸시, **서버에서 보내는 것**, **불시에 발생한 업데이트를 전달**하고 싶은 경우
    - 예시
        - 특정 사용자를 추려내어 해당 사용자에게만 알림 전달
        - 특정 사용자가 특정 행동을 한 시점에 알림 전달
        - 언제 어떤 컨텐츠가 담길지 모르는 상황에 알림 전달
            
            → **로컬 기기 자체만으로는 예측할 수 없는 경우**
            
    - 백앤드(서버) 영역에서 특정 시점에 발송해줘야 한다.

<br>

## 전송 방식

Provider (server) → APNs → iOS / watchOS / tvOS / macOS → ClientApp

- 로컬푸시에 Provider, APNs가 더해진 것이 서버푸시다.


<br>

### 1. 로컬 푸시 구현

- 알림 요청 (UNNotificationRequest) 객체 생성

    - identifier (각각의 요청 구분, 중복되지 않는 고유의 id)
    
    - content (알림에 나타날 내용들 → 소리나 배지, 문자열 등)
    
    - trigger (조건, 알림이 어떤 기준에서 발송될 지 정함 → 달력(날짜), 시간, 사용자의 위치)
    
- UNNotificationCenter에 알림 요청 추가 (Request)

    - 적절한 순간(= trigger에 해당)에 알림 보내줌

### 2. 서버 푸시 원리

- **APNs**

    - Apple Push Notification Service의 준말로, Remote Notification을 사용하기 위한 핵심이다.
    
        - 원격 알림을 보낼 때는 서버에서 바로 기기로 보내는 것이 아니라 APNs를 거쳐야 하기 때문
        
        - Provider (server) → APNs → device
        
    - 알림을 저장하고 전달하기 때문에 기기의 상황에 따라 알림을 처리해주는 관리센터 역할을 한다.
    
    - 자체 보안 아키텍처를 통해 원격 알림을 안전하게 제어해 보안 수준을 유지한다.
    
        - 신뢰 수준 두 가지 → connection trust, device token trust
        
            - connection trust
            
                - Provider와 APNs 사이 또는 APNs와 device 사이에서 작동
                
                    - token-based : 유효한 인증키
                    
                    - certificate-based : 유효한 인증서 (SSL)
                    
            - device token trust
            
                - 각 원격 알림에서 end-to-end로 작동한다.
                
                    - 말 그대로 끝(제공자)에서 끝(장치)으로 작동하는 것.
                    
                    - 두 시점에서만 라우팅되도록 해주는 것이다.
                    
    - 각 지점에서 원격 알림을 보내는 과정
    
        - APP → 원격 알림 사용을 위해 APNs에 등록하고 → 장치의 고유한 토큰을 발급 받아서 → 해당 Provider에게 전달한다.
        
        - Provider → 연결된 토큰에 해당하는 각각의 push 요청 + 장치 토큰을 포함해 → APNs로 전달
        
        - APNs → 토큰에 포함된 Provider의 요청 확인 → push가 고유한 device에만 전달되도록 조정
        

- **Firebase Cloud Messaging (FCM)**

    - Remote Notification을 손쉽게 관리하고 전송할 수 있는 Firebase platform을 말한다.
        
        한마디로 원격 알림을 보낼 수 있도록 도와주는 도구이다.
        
    - 사용 예
    
        - APNs의 보안 요건을 갖춘 서버를 직접 구축하기 힘들 때
        
        - 클라이언트 개발자로서 서비스와 앱 자체에만 집중하고 싶을 때
            
            → 즉 Provider (서버)의 역할을 대신 해주는 것이다.
            
    - 주요 기능
    
        - 원격 알림 메시지 전송
            
            ex) 실시간, 예약
            
        - 다양한 메시지 타겟팅
            
            ex) 단일 기기, 기기 그룹, 주제를 구독한 기기
            
        - 발송 메시지 저장과 관리
            
            ex) 알림 내용, 상태, 최종 전송 시간, 열람률 등
            
    - 웹 콘솔을 통해 전송하고 관리한다.

<br>
    
### 3. 서버 푸시 구현
    
4단계로 이뤄진다.
    
1. FCM 설정 (Firebase 초기화)
2. APNs 구성
3. Firebase 연결
4. Notification 구현
