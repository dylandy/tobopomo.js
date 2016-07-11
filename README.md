#tobopomo.js

將輸入的字串轉成對應的注音回傳；亦可將注音轉換成漢字

Mapping the input string to bopomo script and then turn bopomo script into chinese characters.

###Installation

####Install Globally

```
sudo npm install -g tobopomo.js
```

####Install Locally

In your package.json 

```
...
"dependencies" : {
  "tobopomo.js":"*",
},
...
```

In your code

```
require("tobopmo.js")
```

###Usage

This plugin provide two functions for you to trasform romaji to bopomo script or translate bopomo script to Chinese characters.
There are two methods to using this plugin.

1.Normal function call.
```
tobopomo("su3cl3a8 "); // [ 'ㄋㄧˇ', 'ㄏㄠˇ', 'ㄇㄚ' ] 

tokanji("ㄋ一ˇㄏㄠˇㄇㄚ "); // [ [ '你好嗎', '妳好嗎' ] ] 

tokanji("ㄍㄨˇ"); // [ [ '股', '古', '谷', '鼓', '骨' ] ]  #default output 5 of characters

tokanji("ㄍㄨˇ" , 3); // [ [ '股', '古', '谷' ] ] #if you want to change the output number just simply pass the number as second parameter. 
```
2.You can call the methods by using strings itself.

```
"su3cl3a8 ".tobopomo(); // [ 'ㄋㄧˇ', 'ㄏㄠˇ', 'ㄇㄚ' ] 

"ㄋ一ˇㄏㄠˇㄇㄚ".tokanji(); // [ [ '你好嗎', '妳好嗎' ] ]

"ㄍㄨˇ".tokanji(); // [ [ '股', '古', '谷', '鼓', '骨' ] ] 

"ㄍㄨˇ".tokanji(3); // [ [ '股', '古', '谷'] ]  #pass the limit number as parameter into tokanji method in string mode.
```

###Command Line Tool

You can also use the command line tool for simple text search.

```
options:
  -b : transfrom into Bopomo script
  -k : transfrom into Chinese characters
  -l : limit the output characters number
```
The example command

```
$tobopomo -b su3cl3a8  #[ 'ㄋㄧˇ', 'ㄏㄠˇ', 'ㄇㄚ' ]
$tobopomo -k ㄨㄛˇ #[ '我', '捰', '婐', '婑' ]
$tobopomo -b su3cl3a8 -k #[ [ '你好嗎', '妳好嗎' ] ]
$tobopomo -b ji3 -k -l 2 #[ [ '我', '捰' ] ]
```

###TODO

- [x] 使用 crystal 加速資料分類
- [x] String method 實作
- [x] 切字功能
- [x] 切詞功能
- [x] 字重排比
- [x] 限制輸出數量 
- [ ] 不同語言實作
- [x] 建立成 node module 


##Credit

Thanks for chewing team and libchewing's help. Without them this project wouldn't be successed.

##LICENSE
This project is licensed under LGPL License. For furthor detail please checkout LICENSE.md or connect with me dylandy.chang at gmail.com.
