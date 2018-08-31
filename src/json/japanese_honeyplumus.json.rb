#!/usr/bin/env ruby

# You can generate json by executing the following command on Terminal.
#
# $ ruby ./example_japanese_nicola.json.rb
#

require 'json'
require_relative '../lib/karabiner.rb'

########################################
# 左シフトのキーコード

LEFT_SHIFT_KEY_CODE = 'spacebar'.freeze

########################################
# 右シフトのキーコード

RIGHT_SHIFT_KEY_CODE = 'right_command'.freeze

########################################
# 有効になる条件

CONDITIONS = [
  Karabiner.input_source_if([
                              {
                                'input_mode_id' => 'com.apple.inputmethod.Japanese',
                              },
                              {
                                'input_mode_id' => 'com.apple.inputmethod.Japanese.Hiragana',
                              },
                              {
                                'input_mode_id' => 'com.apple.inputmethod.Japanese.Katakana',
                              },
                              {
                                'input_mode_id' => 'com.apple.inputmethod.Japanese.HalfWidthKana',
                              },
                            ]),
].freeze

########################################
# ローマ字入力の定義

def key(key_code)
  {
    'key_code' => key_code,
    'repeat' => false,
  }
end

def key_with_shift(key_code)
  {
    'key_code' => key_code,
    'modifiers' => [
      'left_shift',
    ],
    'repeat' => false,
  }
end

def key_with_opto(key_code)
  {
    'key_code' => key_code,
    'modifiers' => [
      'left_option',
    ],
    'repeat' => false,
  }
end

ROMAN_MAP = {
  'あ' => [key('a')],
  'い' => [key('i')],
  'う' => [key('u')],
  'え' => [key('e')],
  'お' => [key('o')],

  'か' => [key('k'), key('a')],
  'き' => [key('k'), key('i')],
  'く' => [key('k'), key('u')],
  'け' => [key('k'), key('e')],
  'こ' => [key('k'), key('o')],

  'が' => [key('g'), key('a')],
  'ぎ' => [key('g'), key('i')],
  'ぐ' => [key('g'), key('u')],
  'げ' => [key('g'), key('e')],
  'ご' => [key('g'), key('o')],

  'さ' => [key('s'), key('a')],
  'し' => [key('s'), key('i')],
  'す' => [key('s'), key('u')],
  'せ' => [key('s'), key('e')],
  'そ' => [key('s'), key('o')],

  'ざ' => [key('z'), key('a')],
  'じ' => [key('z'), key('i')],
  'ず' => [key('z'), key('u')],
  'ぜ' => [key('z'), key('e')],
  'ぞ' => [key('z'), key('o')],

  'た' => [key('t'), key('a')],
  'ち' => [key('t'), key('i')],
  'つ' => [key('t'), key('u')],
  'て' => [key('t'), key('e')],
  'と' => [key('t'), key('o')],

  'だ' => [key('d'), key('a')],
  'ぢ' => [key('d'), key('i')],
  'づ' => [key('d'), key('u')],
  'で' => [key('d'), key('e')],
  'ど' => [key('d'), key('o')],

  'な' => [key('n'), key('a')],
  'に' => [key('n'), key('i')],
  'ぬ' => [key('n'), key('u')],
  'ね' => [key('n'), key('e')],
  'の' => [key('n'), key('o')],

  'は' => [key('h'), key('a')],
  'ひ' => [key('h'), key('i')],
  'ふ' => [key('h'), key('u')],
  'へ' => [key('h'), key('e')],
  'ほ' => [key('h'), key('o')],

  'ば' => [key('b'), key('a')],
  'び' => [key('b'), key('i')],
  'ぶ' => [key('b'), key('u')],
  'べ' => [key('b'), key('e')],
  'ぼ' => [key('b'), key('o')],

  'ぱ' => [key('p'), key('a')],
  'ぴ' => [key('p'), key('i')],
  'ぷ' => [key('p'), key('u')],
  'ぺ' => [key('p'), key('e')],
  'ぽ' => [key('p'), key('o')],

  'ま' => [key('m'), key('a')],
  'み' => [key('m'), key('i')],
  'む' => [key('m'), key('u')],
  'め' => [key('m'), key('e')],
  'も' => [key('m'), key('o')],

  'や' => [key('y'), key('a')],
  'ゆ' => [key('y'), key('u')],
  'よ' => [key('y'), key('o')],

  'ら' => [key('r'), key('a')],
  'り' => [key('r'), key('i')],
  'る' => [key('r'), key('u')],
  'れ' => [key('r'), key('e')],
  'ろ' => [key('r'), key('o')],

  'わ' => [key('w'), key('a')],
  'を' => [key('w'), key('o')],
  'ん' => [key('n'), key('n')],
  'ヴ' => [key('v'), key('u')],
  'ゐ' => [key('w'), key('y'), key('i')],
  'ゑ' => [key('w'), key('y'), key('e')],

  'ぁ' => [key('x'), key('a')],
  'ぃ' => [key('x'), key('i')],
  'ぅ' => [key('x'), key('u')],
  'ぇ' => [key('x'), key('e')],
  'ぉ' => [key('x'), key('o')],

  'っ' => [key('x'), key('t'), key('u')],
  'ゎ' => [key('x'), key('w'), key('a')],

  'ゃ' => [key('x'), key('y'), key('a')],
  'ゅ' => [key('x'), key('y'), key('u')],
  'ょ' => [key('x'), key('y'), key('o')],

=begin
  'ゃ' => [key(''), key('i'), key('x'), key('y'), key('a')],
  'ゅ' => [key(''), key('i'), key('x'), key('y'), key('u')],
  'ょ' => [key(''), key('i'), key('x'), key('y'), key('o')],
  'ぃ' => [key(''), key('i'), key('x'), key('i')],
  'ぇ' => [key(''), key('i'), key('x'), key('e')],
  'ゃ' => [key(''), key('i'), key('x'), key('y'), key('a')],
  'ゅ' => [key(''), key('i'), key('x'), key('y'), key('u')],
  'ょ' => [key(''), key('i'), key('x'), key('y'), key('o')],
  'ぃ' => [key(''), key('i'), key('x'), key('i')],
  'ぇ' => [key(''), key('i'), key('x'), key('e')],
  'ゃ' => [key(''), key('i'), key('x'), key('y'), key('a')],
  'ゅ' => [key(''), key('i'), key('x'), key('y'), key('u')],
  'ょ' => [key(''), key('i'), key('x'), key('y'), key('o')],
  'ぃ' => [key(''), key('i'), key('x'), key('i')],
  'ぇ' => [key(''), key('i'), key('x'), key('e')],
=end

  'だけ' => [key('d'), key('a'), key('k'), key('e')],
  'でも' => [key('d'), key('e'), key('m'), key('o')],
  'ませ' => [key('m'), key('a'), key('s'), key('e')],
  'まで' => [key('m'), key('a'), key('d'), key('e')],
  'いき' => [key('i'), key('k'), key('i')],
  'くれ' => [key('k'), key('u'), key('r'), key('e')],
  'あり' => [key('a'), key('r'), key('i')],
  'いち' => [key('i'), key('t'), key('i')],
  'ぬぉ' => [key('n'), key('u'), key('x'), key('o')],

  'ちゃ' => [key('t'), key('i'), key('x'), key('y'), key('a')],
  'ちゅ' => [key('t'), key('i'), key('x'), key('y'), key('u')],
  'ちょ' => [key('t'), key('i'), key('x'), key('y'), key('o')],
  'ちぃ' => [key('t'), key('i'), key('x'), key('i')],
  'ちぇ' => [key('t'), key('i'), key('x'), key('e')],
  'ぢゃ' => [key('d'), key('i'), key('x'), key('y'), key('a')],
  'ぢゅ' => [key('d'), key('i'), key('x'), key('y'), key('u')],
  'ぢょ' => [key('d'), key('i'), key('x'), key('y'), key('o')],
  'ぢぃ' => [key('d'), key('i'), key('x'), key('i')],
  'ぢぇ' => [key('d'), key('i'), key('x'), key('e')],

  'てゅ' => [key('t'), key('e'), key('x'), key('y'), key('u')],
  'てぃ' => [key('t'), key('e'), key('x'), key('i')],
  'でゅ' => [key('d'), key('e'), key('x'), key('y'), key('u')],
  'でぃ' => [key('d'), key('e'), key('x'), key('i')],

  'うぃ' => [key('u'), key('x'), key('a')],
  'うぇ' => [key('u'), key('x'), key('u')],
  'うぉ' => [key('u'), key('x'), key('o')],
  'ヴぁ' => [key('v'), key('u'), key('x'), key('a')],
  'ヴぅ' => [key('v'), key('u'), key('x'), key('u')],
  'ヴぉ' => [key('v'), key('u'), key('x'), key('o')],
  'ヴぃ' => [key('v'), key('u'), key('x'), key('i')],
  'ヴぇ' => [key('v'), key('u'), key('x'), key('e')],

  'とぅ' => [key('t'), key('o'), key('x'), key('u')],
  'どぅ' => [key('d'), key('o'), key('x'), key('u')],

  'しゃ' => [key('s'), key('i'), key('x'), key('y'), key('a')],
  'しゅ' => [key('s'), key('i'), key('x'), key('y'), key('u')],
  'しょ' => [key('s'), key('i'), key('x'), key('y'), key('o')],
  'しぃ' => [key('s'), key('i'), key('x'), key('i')],
  'しぇ' => [key('s'), key('i'), key('x'), key('e')],
  'りゃ' => [key('r'), key('i'), key('x'), key('y'), key('a')],
  'りゅ' => [key('r'), key('i'), key('x'), key('y'), key('u')],
  'りょ' => [key('r'), key('i'), key('x'), key('y'), key('o')],
  'りぃ' => [key('r'), key('i'), key('x'), key('i')],
  'りぇ' => [key('r'), key('i'), key('x'), key('e')],
  'じゃ' => [key('j'), key('i'), key('x'), key('y'), key('a')],
  'じゅ' => [key('j'), key('i'), key('x'), key('y'), key('u')],
  'じょ' => [key('j'), key('i'), key('x'), key('y'), key('o')],
  'じぃ' => [key('j'), key('i'), key('x'), key('i')],
  'じぇ' => [key('j'), key('i'), key('x'), key('e')],

  'いぇ' => [key('i'), key('x'), key('y'), key('e')],
  'くゃ' => [key('k'), key('u'), key('x'), key('y'), key('a')],
  'くゎ' => [key('k'), key('u'), key('x'), key('w'), key('a')],
  'くょ' => [key('k'), key('u'), key('x'), key('y'), key('o')],
  'くぃ' => [key('k'), key('u'), key('x'), key('i')],
  'くぇ' => [key('k'), key('u'), key('x'), key('e')],
  'ぐゃ' => [key('g'), key('u'), key('x'), key('y'), key('a')],
  'ぐゎ' => [key('g'), key('u'), key('x'), key('w'), key('a')],
  'ぐょ' => [key('g'), key('u'), key('x'), key('y'), key('o')],
  'ぐぃ' => [key('g'), key('u'), key('x'), key('i')],
  'ぐぇ' => [key('g'), key('u'), key('x'), key('e')],

  'ふゃ' => [key('f'), key('u'), key('x'), key('y'), key('a')],
  'ふゅ' => [key('f'), key('u'), key('x'), key('y'), key('u')],
  'ふょ' => [key('f'), key('u'), key('x'), key('y'), key('o')],
  'ふぃ' => [key('f'), key('u'), key('x'), key('i')],
  'ふぇ' => [key('f'), key('u'), key('x'), key('e')],
  'ぶゃ' => [key('b'), key('u'), key('x'), key('y'), key('a')],
  'ぶゅ' => [key('b'), key('u'), key('x'), key('y'), key('u')],
  'ぶょ' => [key('b'), key('u'), key('x'), key('y'), key('o')],
  'ぶぃ' => [key('b'), key('u'), key('x'), key('i')],
  'ぶぇ' => [key('b'), key('u'), key('x'), key('e')],

  'にゃ' => [key('n'), key('i'), key('x'), key('y'), key('a')],
  'にゅ' => [key('n'), key('i'), key('x'), key('y'), key('u')],
  'にょ' => [key('n'), key('i'), key('x'), key('y'), key('o')],
  'にぃ' => [key('n'), key('i'), key('x'), key('i')],
  'にぇ' => [key('n'), key('i'), key('x'), key('e')],
  'つゃ' => [key('t'), key('u'), key('x'), key('y'), key('a')],
  'つゅ' => [key('t'), key('u'), key('x'), key('y'), key('u')],
  'つょ' => [key('t'), key('u'), key('x'), key('y'), key('o')],
  'つぃ' => [key('t'), key('u'), key('x'), key('i')],
  'つぇ' => [key('t'), key('u'), key('x'), key('e')],
  'づゃ' => [key('d'), key('u'), key('x'), key('y'), key('a')],
  'づゅ' => [key('d'), key('u'), key('x'), key('y'), key('u')],
  'づょ' => [key('d'), key('u'), key('x'), key('y'), key('o')],
  'づぃ' => [key('d'), key('u'), key('x'), key('i')],
  'づぇ' => [key('d'), key('u'), key('x'), key('e')],

  'きゃ' => [key('k'), key('i'), key('x'), key('y'), key('a')],
  'きゅ' => [key('k'), key('i'), key('x'), key('y'), key('u')],
  'きょ' => [key('k'), key('i'), key('x'), key('y'), key('o')],
  'きぃ' => [key('k'), key('i'), key('x'), key('i')],
  'きぇ' => [key('k'), key('i'), key('x'), key('e')],
  'ぎゃ' => [key('g'), key('i'), key('x'), key('y'), key('a')],
  'ぎゅ' => [key('g'), key('i'), key('x'), key('y'), key('u')],
  'ぎょ' => [key('g'), key('i'), key('x'), key('y'), key('o')],
  'ぎぃ' => [key('g'), key('i'), key('x'), key('i')],
  'ぎぇ' => [key('g'), key('i'), key('x'), key('e')],

  'ぴゃ' => [key('p'), key('i'), key('x'), key('y'), key('a')],
  'ぴゅ' => [key('p'), key('i'), key('x'), key('y'), key('u')],
  'ぴょ' => [key('p'), key('i'), key('x'), key('y'), key('o')],
  'ぴぃ' => [key('p'), key('i'), key('x'), key('i')],
  'ぴぇ' => [key('p'), key('i'), key('x'), key('e')],
  'ひゃ' => [key('h'), key('i'), key('x'), key('y'), key('a')],
  'ひゅ' => [key('h'), key('i'), key('x'), key('y'), key('u')],
  'ひょ' => [key('h'), key('i'), key('x'), key('y'), key('o')],
  'ひぃ' => [key('h'), key('i'), key('x'), key('i')],
  'ひぇ' => [key('h'), key('i'), key('x'), key('e')],
  'びゃ' => [key('b'), key('i'), key('x'), key('y'), key('a')],
  'びゅ' => [key('b'), key('i'), key('x'), key('y'), key('u')],
  'びょ' => [key('b'), key('i'), key('x'), key('y'), key('o')],
  'びぃ' => [key('b'), key('i'), key('x'), key('i')],
  'びぇ' => [key('b'), key('i'), key('x'), key('e')],

  'みゃ' => [key('m'), key('i'), key('x'), key('y'), key('a')],
  'みゅ' => [key('m'), key('i'), key('x'), key('y'), key('u')],
  'みょ' => [key('m'), key('i'), key('x'), key('y'), key('o')],
  'みぃ' => [key('m'), key('i'), key('x'), key('i')],
  'みぇ' => [key('m'), key('i'), key('x'), key('e')],


  '1' => [key('1')],
  '2' => [key('2')],
  '3' => [key('3')],
  '4' => [key('4')],
  '5' => [key('5')],
  '6' => [key('6')],
  '7' => [key('7')],
  '8' => [key('8')],
  '9' => [key('9')],
  '0' => [key('0')],
  'A' => [key_with_shift('a')],
  'B' => [key_with_shift('b')],
  'C' => [key_with_shift('c')],
  'D' => [key_with_shift('d')],
  'E' => [key_with_shift('e')],
  'F' => [key_with_shift('f')],
  'G' => [key_with_shift('g')],
  'H' => [key_with_shift('h')],
  'I' => [key_with_shift('i')],
  'J' => [key_with_shift('j')],
  'K' => [key_with_shift('k')],
  'L' => [key_with_shift('l')],
  'M' => [key_with_shift('m')],
  'N' => [key_with_shift('n')],
  'O' => [key_with_shift('o')],
  'P' => [key_with_shift('p')],
  'Q' => [key_with_shift('q')],
  'R' => [key_with_shift('r')],
  'S' => [key_with_shift('s')],
  'T' => [key_with_shift('t')],
  'U' => [key_with_shift('u')],
  'V' => [key_with_shift('v')],
  'W' => [key_with_shift('w')],
  'X' => [key_with_shift('x')],
  'Y' => [key_with_shift('y')],
  'Z' => [key_with_shift('z')],
  '/' => [key('slash')],
  '?' => [key_with_shift('slash')],
  '=' => [key('equal_sign')],
  '\'' => [key('quote')],
  '＼' => [key('backslash')],
  '"' => [key_with_shift('quote')],
  '[' => [key_with_opto('open_bracket')],
  ']' => [key_with_opto('close_bracket')],
  '{' => [key_with_shift('open_bracket')],
  '}' => [key_with_shift('close_bracket')],
  '-' => [key('hyphen')],
  '|' => [key_with_shift('slash')],
  '…' => [key_with_opto('semicolon')],
  '(' => [key_with_shift('9')],
  ')' => [key_with_shift('0')],
  '「' => [key_with_shift('open_bracket')],
  '」' => [key_with_shift('close_bracket')],
  '・' => [key('slash')],
  '、' => [key('comma')],
  '。' => [key('period')],
  '〜' => [key_with_shift('grave_accent_and_tilde')],
  '括' => [key('open_bracket'), key('close_bracket'), key('left_arrow')],
  '鍵' => [key_with_shift('open_bracket'), key_with_shift('close_bracket'), key('left_arrow')],
}.freeze

########################################

def main
  puts JSON.pretty_generate(
    'title' => 'Japanese HoneyPlum US',
    'rules' => [
      {
        'description' => 'Japanese HoneyPlum US',
        'manipulators' => [
          # シフトありから並べること

          # ------------------------------
          # 蜂蜜マトリックス
          # 
#          simultaneous_key('', '', ''),
=begin 
          simultaneous_key('', 'f', ''),
          simultaneous_key('', 's', ''),
          simultaneous_key('', 'd', ''),
          simultaneous_key('', 'g', ''),
          simultaneous_key('', 'a', ''),

          simultaneous_key('', 'r', ''),
          simultaneous_key('', 'w', ''),
          simultaneous_key('', 'e', ''),
          simultaneous_key('', 't', ''),
          simultaneous_key('', 'q', ''),

          simultaneous_key('', 'v', ''),
          simultaneous_key('', 'x', ''),
          simultaneous_key('', 'c', ''),
          simultaneous_key('', 'b', ''),
          simultaneous_key('', 'z', ''),
=end

          simultaneous_key('u', 'f', 'ゃ'),
          simultaneous_key('u', 's', 'ゅ'),
          simultaneous_key('u', 'd', 'ょ'),

          simultaneous_key('semicolon', 'f', 'しゃ'),
          simultaneous_key('semicolon', 's', 'しゅ'),
          simultaneous_key('semicolon', 'd', 'しょ'),
          simultaneous_key('semicolon', 'g', 'しぃ'),
          simultaneous_key('semicolon', 'a', 'しぇ'),
          simultaneous_key('semicolon', 'r', 'りゃ'),
          simultaneous_key('semicolon', 'w', 'りゅ'),
          simultaneous_key('semicolon', 'e', 'りょ'),
          simultaneous_key('semicolon', 't', 'りぃ'),
          simultaneous_key('semicolon', 'q', 'りぇ'),
          simultaneous_key('semicolon', 'v', 'じゃ'),
          simultaneous_key('semicolon', 'x', 'じゅ'),
          simultaneous_key('semicolon', 'c', 'じょ'),
          simultaneous_key('semicolon', 'b', 'じぃ'),
          simultaneous_key('semicolon', 'z', 'じぇ'),

          simultaneous_key('p', 'r', 'にゃ'),
          simultaneous_key('p', 'w', 'にゅ'),
          simultaneous_key('p', 'e', 'にょ'),
          simultaneous_key('p', 't', 'にぃ'),
          simultaneous_key('p', 'q', 'にぇ'),
          simultaneous_key('p', 'f', 'つゃ'),
          simultaneous_key('p', 's', 'つゅ'),
          simultaneous_key('p', 'd', 'つょ'),
          simultaneous_key('p', 'g', 'つぃ'),
          simultaneous_key('p', 'a', 'つぇ'),
          simultaneous_key('p', 'v', 'づゃ'),
          simultaneous_key('p', 'x', 'づゅ'),
          simultaneous_key('p', 'c', 'づょ'),
          simultaneous_key('p', 'b', 'づぃ'),
          simultaneous_key('p', 'z', 'づぇ'),

          simultaneous_key('o', 'r', 'きゃ'),
          simultaneous_key('o', 'w', 'きゅ'),
          simultaneous_key('o', 'e', 'きょ'),
          simultaneous_key('o', 't', 'きぃ'),
          simultaneous_key('o', 'q', 'きぇ'),
          simultaneous_key('o', 'v', 'ぎゃ'),
          simultaneous_key('o', 'x', 'ぎゅ'),
          simultaneous_key('o', 'c', 'ぎょ'),
          simultaneous_key('o', 'b', 'ぎぃ'),
          simultaneous_key('o', 'z', 'ぎぇ'),

          simultaneous_key('i', 'f', 'ぴゃ'),
          simultaneous_key('i', 's', 'ぴゅ'),
          simultaneous_key('i', 'd', 'ぴょ'),
          simultaneous_key('i', 'g', 'ぴぃ'),
          simultaneous_key('i', 'a', 'ぴぇ'),
          simultaneous_key('i', 'r', 'ひゃ'),
          simultaneous_key('i', 'w', 'ひゅ'),
          simultaneous_key('i', 'e', 'ひょ'),
          simultaneous_key('i', 't', 'ひぃ'),
          simultaneous_key('i', 'q', 'ひぇ'),
          simultaneous_key('i', 'v', 'びゃ'),
          simultaneous_key('i', 'x', 'びゅ'),
          simultaneous_key('i', 'c', 'びょ'),
          simultaneous_key('i', 'b', 'びぃ'),
          simultaneous_key('i', 'z', 'びぇ'),

          simultaneous_key('u', 'f', 'ゃ'),
          simultaneous_key('u', 's', 'ゅ'),
          simultaneous_key('u', 'd', 'ょ'),

          simultaneous_key('m', 'r', 'みゃ'),
          simultaneous_key('m', 'w', 'みゅ'),
          simultaneous_key('m', 'e', 'みょ'),

          # を
          simultaneous_key('d', 'k', 'を'),

          # ------------------------------
          # 左シフト
          # 左最上段
          left_shift_key('1', '?'),
          left_shift_key('2', '・'),
          left_shift_key('3', '〜'),
          left_shift_key('4', '「'),
          left_shift_key('5', '」'),

          # 左上段
          left_shift_key('q', 'ぺ'),
          left_shift_key('w', 'け'),
          left_shift_key('e', 'よ'),
          left_shift_key('r', '-'),
          left_shift_key('t', '…'),

          # 左中段
          left_shift_key('a', 'め'),
          left_shift_key('s', 'や'),
          left_shift_key('d', 'も'),
          left_shift_key('f', 'さ'),
          left_shift_key('g', 'ぅ'),

          # 左下段
          left_shift_key('z', 'ゅ'),
          left_shift_key('x', 'ゃ'),
          left_shift_key('c', 'ふ'),
          left_shift_key('v', 'ょ'),
          left_shift_key('b', 'ぉ'),

          # 右最上段
#          left_shift_key('6', ''),
#          left_shift_key('7', ''),
#          left_shift_key('8', ''),
#          left_shift_key('9', ''),
#          left_shift_key('0', ''),
#          left_shift_key('hyphen', ''),
#          left_shift_key('equal_sign', ''),

          # 右上段
          left_shift_key('y', '['),
          left_shift_key('u', 'ゑ'),
          left_shift_key('i', 'び'),
          left_shift_key('o', 'ぎ'),
          left_shift_key('p', 'づ'),
          left_shift_key('open_bracket', 'べ'),
          left_shift_key('close_bracket', 'ぴ'),
#          left_shift_key('backslash', ''),

          # 右中段
          left_shift_key('h', ']'),
          left_shift_key('j', 'ぃ'),
          left_shift_key('k', 'ぁ'),
          left_shift_key('l', 'ぐ'),
          left_shift_key('semicolon', 'じ'),
          left_shift_key('quote', 'ど'),

          # 右下段
          left_shift_key('n', '|'),
          left_shift_key('m', 'ぇ'),
          left_shift_key('comma', 'ヴ'),
          left_shift_key('period', 'ず'),
          left_shift_key('slash', 'ぢ'),

          # ------------------------------
          # 右シフト

          # 左最上段
#          right_shift_key('1', ''),
#          right_shift_key('2', ''),
#          right_shift_key('3', ''),
#          right_shift_key('4', ''),
#          right_shift_key('5', ''),

          # 左上段
          right_shift_key('q', 'ぱ'),
          right_shift_key('w', 'げ'),
          right_shift_key('e', 'で'),
          right_shift_key('r', 'ぜ'),
          right_shift_key('t', 'ぞ'),

          # 左中段
          right_shift_key('a', 'ご'),
          right_shift_key('s', 'だ'),
          right_shift_key('d', 'が'),
          right_shift_key('f', 'ざ'),
          right_shift_key('g', 'ば'),

          # 左下段
          right_shift_key('z', 'ぽ'),
          right_shift_key('x', 'ぼ'),
          right_shift_key('c', 'ぶ'),
          right_shift_key('v', 'ぷ'),
          right_shift_key('b', 'ゎ'),

          # 右最上段
#          right_shift_key('6', ''),
#          right_shift_key('7', ''),
          right_shift_key('8', '['),
          right_shift_key('9', ']'),
          right_shift_key('0', '('),
          right_shift_key('hyphen', ')'),
#          right_shift_key('equal_sign', ''),

          # 右上段
          right_shift_key('y', '{'),
          right_shift_key('u', 'ゐ'),
          right_shift_key('i', 'ひ'),
          right_shift_key('o', 'き'),
          right_shift_key('p', 'つ'),
          right_shift_key('open_bracket', 'ぬ'),
          right_shift_key('close_bracket', 'ぴ'),
          right_shift_key('backslash', '＼'),

          # 右中段
          right_shift_key('h', '}'),
          right_shift_key('j', 'む'),
          right_shift_key('k', 'れ'),
          right_shift_key('l', 'く'),
          right_shift_key('semicolon', 'り'),
          right_shift_key('quote', 'わ'),

          # 右下段
          right_shift_key('n', '＼'),
          right_shift_key('m', 'み'),
          right_shift_key('comma', 'あ'),
          right_shift_key('period', 'え'),
          right_shift_key('slash', 'ち'),

          # ------------------------------
          # 小指シフト

          shift_key('u', 'Y'),

          # ------------------------------
          # シフトなし

          # 左最上段
          normal_key('1', '1'),
          normal_key('2', '2'),
          normal_key('3', '3'),
          normal_key('4', '4'),
          normal_key('5', '5'),

          # 左上段
          normal_key('q', '。'),
          normal_key('w', 'な'),
          normal_key('e', 'て'),
          normal_key('r', 'せ'),
          normal_key('t', 'そ'),

          # 左中段
          normal_key('a', 'こ'),
          normal_key('s', 'た'),
          normal_key('d', 'か'),
          normal_key('f', 'る'),
          normal_key('g', 'は'),

          # 左下段
          normal_key('z', 'ゆ'),
          normal_key('x', 'ほ'),
          normal_key('c', 'ま'),
          normal_key('v', 'ろ'),
          normal_key('b', '〜'),


          # 右最上段
          normal_key('6', '='),
          normal_key('7', '6'),
          normal_key('8', '7'),
          normal_key('9', '8'),
          normal_key('0', '9'),
          normal_key('hyphen', '0'),
          normal_key('equal_sign', '-'),

          # 右上段
          normal_key('y', '括'),
          normal_key('u', '・'),
          normal_key('i', 'お'),
          normal_key('o', 'の'),
          normal_key('p', 'に'),
          normal_key('open_bracket', 'へ'),
          normal_key('close_bracket', '、'),
#          normal_key('backslash', ''),

          # 右中段
          normal_key('h', '\''),
          normal_key('j', '-'),
          normal_key('k', 'ん'),
          normal_key('l', 'い'),
          normal_key('semicolon', 'し'),
          normal_key('quote', 'と'),

          # 右下段
          normal_key('n', '/'),
          normal_key('m', 'っ'),
          normal_key('comma', 'う'),
          normal_key('period', 'す'),
          normal_key('slash', 'ら'),
        ],
      },
    ]
  )
end

def normal_key(key, char)
  {
    'type' => 'basic',
    'from' => {
      'key_code' => key,
    },
    'to' => ROMAN_MAP[char],
    'conditions' => CONDITIONS,
  }
end

def shift_key(key, char)
  {
    'type' => 'basic',
    'from' => {
      'key_code' => key,
      'modifiers' => Karabiner.from_modifiers(['shift'], nil),
    },
    'to' => ROMAN_MAP[char],
    'conditions' => CONDITIONS,
  }
end

def left_shift_key(key, char)
  {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        {
          'key_code' => key,
        },
        {
          'key_code' => LEFT_SHIFT_KEY_CODE,
        },
      ],
    },
    'to' => ROMAN_MAP[char],
    'conditions' => CONDITIONS,
  }
end

def right_shift_key(key, char)
  {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        {
          'key_code' => key,
        },
        {
          'key_code' => RIGHT_SHIFT_KEY_CODE,
        },
      ],
    },
    'to' => ROMAN_MAP[char],
    'conditions' => CONDITIONS,
  }
end

def simultaneous_key(key1, key2, char)
  {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        {
          'key_code' => key1,
        },
        {
          'key_code' => key2,
        },
      ],
    },
    'to' => ROMAN_MAP[char],
    'conditions' => CONDITIONS,
  }
end

main
