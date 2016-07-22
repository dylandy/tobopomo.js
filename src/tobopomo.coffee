tsi = require("../data/tsi.json")

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
class Tobopomo
  normalise = (string) ->
    string.replace(/ /g,'')

  root.tobopomo = (string) ->
    #string = normalise(string)
    total = 0
    temp = []
    for i in [0...string.length]
      if layout[(string[i].charCodeAt(0)).toString()]
        temp.push layout[(string[i].charCodeAt(0)).toString()]
      else
        temp.push string[i]
    #console.log output
    string = temp.join("")
    #console.log string
    splitted = temp.join("").split(/[ "ˇ""ˋ""ˊ""˙"]+/)
    splitted = splitted.map((x, index) ->
      total+=x.length
      x = x+string[total+index]
    )
    splitted.pop()
    splitted = splitted.map( (x) -> normalise(x) )
    return splitted

  root.tokanji = (input , limit = 5) ->
    traversed = 0
    output = []
    if Array.isArray(input)
      for index in [0...input.length]
        string = input[traversed..index].join("")
        if tsi[string] && index < (input.length - 1)
          continue
        else if tsi[string] && index == (input.length - 1)
          output.push tsi[string][0...limit]
        else if tsi[string] == undefined &&index == (input.length - 1)
          string = input[traversed...index].join("")
          output.push tsi[string][0...limit]
          output.push tsi[input[index]][0...limit]
        else
          string = input[traversed...index].join("")
          output.push tsi[string][0...limit]
          traversed = index
      return output
    else
      string = normalise(input)
      tsi[string][0...limit]
    
  # add method to string for easy calling 
  String::tobopomo = -> tobopomo(@)
  String::tokanji =(limit) -> tokanji(@ , limit)
  Array::tokanji =(limit) -> tokanji(@ , limit)

module.exports = Tobopomo
  
