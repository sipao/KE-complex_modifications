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
#          right_shift_key('backslash', ''),

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

main
