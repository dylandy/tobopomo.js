#tobopomo.js

將輸入的字串轉成對應的注音回傳；亦可將注音轉換成漢字

Mapping the input string to bopomo script and then turn bopomo script into chinese characters.

##使用方式

###Include methods

Node
```
require("[path_to_script]/tobopomo.js")

```

###Usage

This plugin provide two functions for you to trasform romaji to bopomo script or translate bopomo script to Chinese characters.
There are two methods to using this plugin.

1.Normal function call.
```
tobopomo("su3cl3a8 "); //  "ㄋ一ˇㄏㄠˇㄇㄚ"

tokanji("ㄋ一ˇㄏㄠˇㄇㄚ "); // ["你好嗎"]

```
2.You can call the methods by using strings itself.

```
"su3cl3a8 ".tobopomo(); // "ㄋ一ˇㄏㄠˇㄇㄚ"

"ㄋ一ˇㄏㄠˇㄇㄚ".tokanji(); // ["你好嗎"]

```


###TODO

- [x] 使用 crystal 加速資料分類
- [x] String method 實作
- [x] 切字功能
- [ ] 切詞功能
- [ ] 字重排比
- [ ] 不同語言實作
- [ ] 建立成 node module 


##Credit

Thanks for chewing team and libchewing's help. Without them this project wouldn't be successed.

##LICENSE
This project is licensed under LGPL License. For furthor detail please checkout LICENSE.md or connect with me dylandy.chang at gmail.com.
