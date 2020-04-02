# Readme UI-01
2020.04.02 Hiroyuki Fujita

## 1. Summary  
このプログラムは、SSNG for iPhoneのリファクタリングのため、GUIをSwiftUIで作成してみた。ButtonとPickerを利用。

## 2. 環境
Xcode. 11.4, 
iOS13.3 (SwiftUIを利用するのでiOS 13が必須）

## 3. 機能
- Pickerで項目を選択すると、indexがPickerの下に表示される。

## 4. 利用方法
特に無し。

## 5. ソースコードの解説
IPアドレスのPickerのコードを以下に示す。  

```
var ips = ["192.168.150.112", "192.168.50.15", "192.168.50.20", "192.168.50.30"]
@State private var ipSelection = 2

VStack(spacing: 5) {
    Text("IP").font(.headline)
    Picker(selection: self.$ipSelection, label: Text("Label")) {
        ForEach(0 ..< self.ips.count) {
            Text(self.ips[$0]).font(.title)
        }
    }
    .labelsHidden().frame(width: geometry.size.width * (2/8), height: 100).clipped()
    .onReceive([self.ipSelection].publisher.first()) { (value) in
        print("ipSelection: \(value)")}
    Text("Selection: \(self.ipSelection)")
}
```

StateインスタンスipSelectionはPickerで選択した項目のindexを保持するためのものである。  
以下の行は見た目の修飾である。.clipped()はY方向のサイズを制限する。
```
.labelsHidden().frame(width: ..., height: 100).clipped()
```

以下はPickerを画面で操作したときのcall backである。コンソールに選択された項目のidを表示する。

```
.onReceive([self.ipSelection].publisher.first()) { (value) in
    print("ipSelection: \(value)")}
```
        