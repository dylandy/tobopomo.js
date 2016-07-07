tsi = require("./data/tsi.json")

root = global ? this
layout =
	"31": "\n",   "33": "!",    "34": "\"",   "35": "#",    "36": "$",
	"37": "%",    "38": "&",    "39": "'",    "40": "(",    "41": ")",
	"42": "*",    "43": "+",    "44": "ㄝ",   "45": "ㄦ",   "46": "ㄡ",
	"47": "ㄥ",   "48": "ㄢ",   "49": "ㄅ",   "50": "ㄉ",   "51": "ˇ",
	"52": "ˋ",    "53": "ㄓ",   "54": "ˊ",    "55": "˙",    "56": "ㄚ",
	"57": "ㄞ",   "58": ":",    "59": "ㄤ",   "60": "<",    "61": "=",
	"62": ">",    "63": "?",    "64": "@",    "91": "[",    "92": "\\",
	"93": "]",    "94": "^",    "95": "_",    "96": "`",    "97": "ㄇ",
	"98": "ㄖ",   "99": "ㄏ",   "100": "ㄎ",  "101": "ㄍ",  "102": "ㄑ",
	"103": "ㄕ",  "104": "ㄘ",  "105": "ㄛ",  "106": "ㄨ",  "107": "ㄜ",
	"108": "ㄠ",  "109": "ㄩ",  "110": "ㄙ",  "111": "ㄟ",  "112": "ㄣ",
	"113": "ㄆ",  "114": "ㄐ",  "115": "ㄋ",  "116": "ㄔ",  "117": "ㄧ",
	"118": "ㄒ",  "119": "ㄊ",  "120": "ㄌ",  "121": "ㄗ",  "122": "ㄈ",
	"123": "{",   "124": "|",   "125": "}",   "126": "~"
	
#normailise: to remove all the whitespace in input string
normalise = (string) ->
  string.replace(/ /g,'')

#the string reverse function
#reverse = (s) -> if s.length < 2 then s else reverse(s[1..-1]) + s[0]

root.word_seperater = (string) ->
  string = normalise(string)
  #console.log string
  output = []
  total = 0
  traversed = 0
  temp = ""
  splitted_string = string.split(/["ˊ"|"ˇ"|"ˋ"|"˙"]/)
  #console.log splitted_string

  for i , index in splitted_string
    total = total + i.length
    if index == 0
      #test string "tobopomo('cl cl j06')"
      if tsi[i+string[i.length]] == undefined || tsi[i+string[i.length]][0].length > 1    #first element is first tone.
        if i.length == string.length      # no tone included and all the characters belong in first tone. 
          for j in [0...i.length]
            temp = i[traversed..j]
            if tsi[temp] && tsi[temp][0].length == 1 && j < (i.length - 1)
              continue
            else if tsi[temp] && tsi[temp][0].length == 1 && j == (i.length - 1)
              output.push i[traversed..j]
            #test string "tobopomo('co i ')"
            else if tsi[temp] == undefined && j == (i.length - 1)
              output.push i[traversed...j]
              output.push i[j]
            else
              output.push i[traversed...j]
              traversed = j
        else
          for j in [0...i.length]
            temp = i[traversed..j]
            if tsi[temp] && tsi[temp][0].length == 1 && j < (i.length - 1)
              continue
            else if tsi[temp] && j == (i.length - 1)
              output.push i[traversed .. j] + string[index+i.length]
            else if tsi[temp] == undefined && j == (i.length - 1)
            #test string "tobopomo('dk y3ru0 ')"
              output.push i[traversed...j]
              output.push i[j]+ string[index+i.length]
            else
              output.push i[traversed...j]
              traversed = j

      else if tsi[i+string[index+i.length]][0].length == 1
        output.push i+string[index+i.length]
    #test string "tobopomo('ej94gj gj ')"
    else if string[index+total] == undefined  #last one is first tone 
      temp = 0
      for j in [0...i.length]
        temp = i[traversed..j]
        if tsi[temp] && tsi[temp][0].length == 1 && j < (i.length - 1)
          continue
        else if tsi[temp] && tsi[temp][0].length == 1 && j == (i.length - 1)
          output.push i[traversed..j]
        else if tsi[temp] == undefined && j == (i.length - 1)
          output.push i[traversed...j]
          output.push i[j]
        else
          output.push i[traversed...j]
          traversed = j
    else
      #test string "tobopomo('vul3cjo vu86')"
      if tsi[i+string[index+total]] == undefined    #last element of the splitted string but has tone symbol at the original string.
        temp = 0
        for j in [0...i.length]
          temp = i[traversed..j]
          if tsi[temp] && tsi[temp][0].length == 1 && j < (i.length - 1)
            continue
          else if  j == (i.length - 1)
            output.push i[traversed..j] + string[index+total]
          else
            output.push i[traversed...j]
            traversed = j
      #test string "tobopomo('ji3g4dk vm,6ej94bp6')"
      else if tsi[i+string[index+total]][0].length > 1
        temp = 0
        for j in [0...i.length]
          temp = i[traversed..j]
          if tsi[temp] && tsi[temp][0].length == 1 && j < (i.length - 1)
            continue
          else if  j == (i.length - 1)
            output.push i[traversed..j]+ string[index+total]
          else
            output.push i[traversed...j]
            traversed = j
        #console.log i
      else if tsi[i+string[index + total]][0].length == 1
        output.push i+string[index+total]
  return output

root.tobopomo = (string) ->
  string = normalise(string)
  output = []
  for i in [0...string.length]
    if layout[(string[i].charCodeAt(0)).toString()]
      output.push layout[(string[i].charCodeAt(0)).toString()]
    else
      output.push string[i]
  output.join("")

root.tokanji = (string) ->
  string = normalise(string)
  tsi[string]
  
# add method to string for easy calling 
String::tobopomo = -> tobopomo(@)
String::tokanji = -> tokanji(@)
