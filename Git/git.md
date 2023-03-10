# Git - 개발을 하면서 필요한 협업기술 중 git 던전 공략법
> 모든 내용을 하나하나 꼼꼼히 적기 보단 새로 알게된 것을 적자.

<br>

## 1. 깃-던전 공략법 - 어떻게 설명할 것인가?

<br>

## 2. 깃-던전 공략법 - 왜 꼭 git이어야 하는가?
- 버전관리
- 협업

### 버전관리
- 원하는 곳으로 돌아가기 위해
- 많은 시간을 아낄 수 있다!


### 협업 도구
- 같이 나눠서 작업

<br>

## 3. 기본명령어 commit, push, pull

<br>

## 4. 브랜치와 머지

### 브랜치
- 서로 나눠서
### 머지
- 각자의 파일을 하나로 합친다..?

<br>

## 5. 브랜치 전략(git-flow)
- 동시에 여러군데 작업을 했더니 합칠때 힘들었다.

### 깃 브랜치 전략
1. Main
   - 우리가 접하는 버전
   - 무조건 안정적
   - 커밋이 일어나지 않음
   - 즉 최종 수정본
   - 
2. Develop
   - 개발 브랜치
   - 실질적으로 우리가 pull을 받아야하는 브랜치
   - 피쳐 브랜치를 따야하는 곳
3. Release
   - 배포 브랜치
   - 개발 완료되었다고 생각하는 브랜치를 따서 테스트 한다.
   - 버그 수정만 하는 곳
   - 여기서 개발을 하면... 헬게이트...
   - 꼭 데브와 메인에 머지 해줘야한다. 
   - 데브 브랜치에 안넣어주면..?
     - 그 다음 기능이 다시 릴리즈 브랜치로 들어왔을 때 버그가 다시 생김
4. Feature
   - 실험실 같은 브랜치
   - 개발하다가 망하면 버려도 되는 곳
   - 브랜치 하나당 기능 하나
   - 데브에서 다 같이 개발하면 꼬일 수 있기에 사용되는 독립적인 공간
5. Hotfix
   - 급하게 수정되어야 하는 이슈
   - 버그/기능 
     - 오타 하나 났는데 데브에서 따서 개발해서 릴리즈 해서 테스트 하면 번거롭기에 
     - 메인에서 바로 따서 짧게 해결 후 메인으로 넣음
    - 릴리즈와 마찬가지로 메인 두 곳에 머지되어야 함

## 6. 임시저장을 위한 stash
- 아래와 같은 상황일 때
  - 지난번 개발했던 기능의 버그
  - 갑자기 들어온 핫 픽스
  - 미리 진행하고 싶은 기능 구현
  - 등 여러가지 한번에 해야할 때...

<br>

- 커밋을 하지 않고 저장하는 방법은 없을까?
- stash는 임시저장 같은 기능!
- 의미없는 커밋 메시지를 만들지 않기
- 여러가지 작업 임시저장 가능

<br>

- 깃허브 데스크탑에선 ```n changed files```를 우클릭하면 stash 버튼이 나온다.

- 짜잔