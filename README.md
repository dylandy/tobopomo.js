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

```
tobopomo("su3cl3a8 "); //  "ㄋ一ˇㄏㄠˇㄇㄚ "

tokanji("ㄋ一ˇㄏㄠˇㄇㄚ "); // ["你好嗎"]

```

###TODO

- [] 切字功能
- [] 字重排比
- [] 不同語言實作
- [] 建立成 node module 

Sample code is in template folder.

##Credit

Thanks for chewing team and libchewing's help. Without them this project wouldn't be successed.

##LICENSE
This project is licensed under LGPL License. For furthor detail please checkout LICENSE.md or connect with me dylandy.chang at gmail.com.
