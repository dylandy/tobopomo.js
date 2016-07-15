require("../src/tobopomo") 
#init expect
expect = require("chai").expect 

arrayEqual = (a, b) ->
  JSON.stringify(a) is JSON.stringify(b)

describe "test bopomo script tranportation", ->
  case_one = 'cl cl j06'
  case_two = 'co i '
  case_three = 'dk y3ru0 ' 
  case_four = 'ej94gj gj ' 
  case_five = 'vul3cjo vu86' 
  case_six = 'ji3g4dk vm,6ej94bp6' 
  case_seven = 'u su06'
  case_eight = 'u -4n0 n4j3xu.4fu 18 '
  case_nine = '5;32k6ep 284gj4u6u;4el '

  it "first element first tone test", ->
    arrayEqual(tobopomo(case_one), ["ㄏㄠ","ㄏㄠ","ㄨㄢˊ"]).should.equal true

  it "first and last element are both in first tone test", ->
    arrayEqual(tobopomo(case_two) , [ 'ㄏㄟ', 'ㄛ' ]).should.equal true

  it "first and last element are both in first tone; however, there are some other tone characters in the middle", ->
    arrayEqual(tobopomo(case_three) , [ 'ㄎㄜ', 'ㄗˇ', 'ㄐㄧㄢ' ]).should.equal true

  it "last element has several first tone characters", ->
    arrayEqual(tobopomo(case_four) , [ 'ㄍㄨㄞˋ', 'ㄕㄨ', 'ㄕㄨ' ]).should.equal true

  it "middle character is first tone but not for first and last element", ->
    arrayEqual(tobopomo(case_five) , [ 'ㄒㄧㄠˇ', 'ㄏㄨㄟ', 'ㄒㄧㄚˊ' ]).should.equal true

  it "long sentence with a single first tone in the middle", ->
    arrayEqual(tobopomo(case_six) , [ 'ㄨㄛˇ', 'ㄕˋ', 'ㄎㄜ', 'ㄒㄩㄝˊ', 'ㄍㄨㄞˋ', 'ㄖㄣˊ' ]).should.equal true

  it "first character is first tone and the second character with other tone contenting three symbols and first two symbols cannot form a proper character.", ->
    arrayEqual(tobopomo(case_seven) , [ 'ㄧ', 'ㄋㄧㄢˊ' ]).should.equal true

  it "it should return one to eight", ->
    arrayEqual(tobopomo(case_eight) , [ 'ㄧ', 'ㄦˋ', 'ㄙㄢ', 'ㄙˋ', 'ㄨˇ', 'ㄌㄧㄡˋ','ㄑㄧ','ㄅㄚ' ]).should.equal true

  it "some null hide in long sentence", ->
    arrayEqual(tobopomo(case_nine) , [ 'ㄓㄤˇ', 'ㄉㄜˊ', 'ㄍㄣ', 'ㄉㄚˋ', 'ㄕㄨˋ', 'ㄧˊ', 'ㄧㄤˋ','ㄍㄠ' ]).should.equal true

describe "test tokanji tranportation", ->
  case_one = ['ㄧ', 'ㄋㄧㄢˊ']
  case_two = ['ㄧ']

  it "a founded key word", ->
    arrayEqual(tokanji(case_one) , [[ '一年']] ).should.equal true

  it "a single character should return five characters by default", ->
    arrayEqual(tokanji(case_two) , [[  '一', '醫', '依', '衣', '伊' ]] ).should.equal true

  it "limit number passes in should reduce and increase return output", ->
    expect(tokanji(case_two , 2)[0].length).to.equal(2)
    expect(tokanji(case_two , 7)[0].length).to.equal(7)


