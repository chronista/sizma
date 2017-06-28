# ドメインについて

## ドメインの各役割

### Specs

#### Space Domain
- 場の提供。
    + 場は（仮想的な）出力用ミキサーを一つ持つ

---

#### Present Domain
- UIの提供。

---

#### Engine Domain
- Sizma Systemの提供

- 1プロセスにつき、1つ存在
    - cli
    - mac app
    - ios app

- スペースの出力からAudioKitへの橋渡し
    - space.mixer ~> engine.mixer ~> AudioKit.output

---

#### User Domain
- 多々あるユーザーサービス諸々
    - 有料サービス有り
    - SNS連携

---

#### App Domain
- ここが無いと始まらない
- 起動時処理 + 保存復帰時処理
- エンジン動かす



## Dependencies

※ Foundationは除いてます。

#### Space domain
- AudioKit

#### Present domain
- space domain
- Cocoa
 
#### Engine domain
- space domain
- present domain
- AudioKit
- Infra
    - OS
    - DB
    - Raw Device
    - Message Queue
    - Env


#### User domain
- space domain
- engine domain

#### App domain
- engine domain
- choice yourself



