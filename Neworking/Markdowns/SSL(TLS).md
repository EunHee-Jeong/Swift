## SSL(TLS)

### 개념

- TLS (Transport Layer Security), SSL (Secure Socket Layers)

- **암호화 프로토콜** (Cryptographic Protocols), 보안 인증서를 말한다.


- **TLS, SSL** → **전송되는 데이터를 보호**하는 프로토콜


    - 예를 들자면 인터넷 쇼핑몰에서 신용 카드로 계산하는 상황에 → 네트워크를 통해 카드에 대한 정보를 담아서 보내게 될 텐데, 이 정보를 보호하는 것이다.
    - 사용자와 서버 사이의 길을 안전하게 만들어 네트워크를 통해 전송하는 데이터를 암호화 해준다. (밖에서 봤을 때 무엇인지 이해할 수 없도록)


- HTTPs , FTPS, SMTPS와 같은 **네트워크 프로토콜과 함께 사용**된다.


    - HTTPS (HTTP + TLS)
    - FTPS (FTP + TLS)
    - SMTPS (SMTP + TLS)

### TLS vs SSL

- 대부분 같은 의도로 사용된다.
    (= TLS, SSL ⇒ 네트워크로부터 전송되는 데이터를 보호하는 데 사용되는 프로토콜)
    
- **TLS는 SSL로부터 파생**되었다. (SSL의 보안 문제로 인해 복제됨)


    - 즉 TLS가 현재 버전이고, SSL은 이의 이전 버전을 말하는 것이다.
