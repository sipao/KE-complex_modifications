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

RIGHT_SHIFT_KEY_CODE = 'lang1'.freeze

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


  'ぁ' => [key('x'), key('a')],
  'ぃ' => [key('x'), key('i')],
  'ぅ' => [key('x'), key('u')],
  'ぇ' => [key('x'), key('e')],
  'ぉ' => [key('x'), key('o')],

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
  '?' => [key_with_shift('slash')],
  '=' => [key('equal_sign')],
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
          left_shift_key('2', ''),
          left_shift_key('3', ''),
          left_shift_key('4', ''),
          left_shift_key('5', ''),

          # 左上段
          left_shift_key('q', ''),
          left_shift_key('w', ''),
          left_shift_key('e', ''),
          left_shift_key('r', ''),
          left_shift_key('t', ''),

          # 左中段
          left_shift_key('a', ''),
          left_shift_key('s', ''),
          left_shift_key('d', ''),
          left_shift_key('f', ''),
          left_shift_key('g', ''),

          # 左下段
          left_shift_key('z', ''),
          left_shift_key('x', ''),
          left_shift_key('c', ''),
          left_shift_key('v', ''),
          left_shift_key('b', ''),

          # 右最上段
          left_shift_key('6', ''),
          left_shift_key('7', ''),
          left_shift_key('8', ''),
          left_shift_key('9', ''),
          left_shift_key('0', ''),
          left_shift_key('hyphen', ''),
          left_shift_key('equal_sign', ''),

          # 右上段
          left_shift_key('y', ''),
          left_shift_key('u', ''),
          left_shift_key('i', ''),
          left_shift_key('o', ''),
          left_shift_key('p', ''),
          left_shift_key('open_bracket', ''),
          left_shift_key('close_bracket', ''),
          left_shift_key('backslash', ''),

          # 右中段
          left_shift_key('h', ''),
          left_shift_key('j', ''),
          left_shift_key('k', ''),
          left_shift_key('l', ''),
          left_shift_key('semicolon', ''),
          left_shift_key('quote', ''),

          # 右下段
          left_shift_key('n', ''),
          left_shift_key('m', ''),
          left_shift_key('comma', ''),
          left_shift_key('period', ''),
          left_shift_key('slash', ''),

          # ------------------------------
          # 右シフト

          # 左最上段
          right_shift_key('1', '?'),
          right_shift_key('2', ''),
          right_shift_key('3', ''),
          right_shift_key('4', ''),
          right_shift_key('5', ''),

          # 左上段
          right_shift_key('q', ''),
          right_shift_key('w', ''),
          right_shift_key('e', ''),
          right_shift_key('r', ''),
          right_shift_key('t', ''),

          # 左中段
          right_shift_key('a', ''),
          right_shift_key('s', ''),
          right_shift_key('d', ''),
          right_shift_key('f', ''),
          right_shift_key('g', ''),

          # 左下段
          right_shift_key('z', ''),
          right_shift_key('x', ''),
          right_shift_key('c', ''),
          right_shift_key('v', ''),
          right_shift_key('b', ''),

          # 右最上段
          right_shift_key('6', ''),
          right_shift_key('7', ''),
          right_shift_key('8', ''),
          right_shift_key('9', ''),
          right_shift_key('0', ''),
          right_shift_key('hyphen', ''),
          right_shift_key('equal_sign', ''),

          # 右上段
          right_shift_key('y', ''),
          right_shift_key('u', ''),
          right_shift_key('i', ''),
          right_shift_key('o', ''),
          right_shift_key('p', ''),
          right_shift_key('open_bracket', ''),
          right_shift_key('close_bracket', ''),
          right_shift_key('backslash', ''),

          # 右中段
          right_shift_key('h', ''),
          right_shift_key('j', ''),
          right_shift_key('k', ''),
          right_shift_key('l', ''),
          right_shift_key('semicolon', ''),
          right_shift_key('quote', ''),

          # 右下段
          right_shift_key('n', ''),
          right_shift_key('m', ''),
          right_shift_key('comma', ''),
          right_shift_key('period', ''),
          right_shift_key('slash', ''),

          # ------------------------------
          # シフトなし

          # 左最上段
          normal_key('1', '1'),
          normal_key('2', '2'),
          normal_key('3', '3'),
          normal_key('4', '4'),
          normal_key('5', '5'),

          # 左上段
          normal_key('q', 'q'),
          normal_key('w', 'w'),
          normal_key('e', 'e'),
          normal_key('r', 'r'),
          normal_key('t', 't'),

          # 左中段
          normal_key('a', 'a'),
          normal_key('s', 's'),
          normal_key('d', 'd'),
          normal_key('f', 'f'),
          normal_key('g', 'g'),

          # 左下段
          normal_key('z', 'z'),
          normal_key('x', 'x'),
          normal_key('c', 'c'),
          normal_key('v', 'v'),
          normal_key('b', 'b'),

          # 右最上段
          normal_key('6', 'equal_sign'),
          normal_key('7', '6'),
          normal_key('8', '7'),
          normal_key('9', '8'),
          normal_key('0', '9'),
          normal_key('hyphen', '0'),
          normal_key('equal_sign', 'hyphen'),

          # 右上段
          normal_key('y', 'backslash'),
          normal_key('u', 'y'),
          normal_key('i', 'u'),
          normal_key('o', 'i'),
          normal_key('p', 'o'),
          normal_key('open_bracket', 'p'),
          normal_key('close_bracket', 'open_bracket'),
          normal_key('backslash', 'close_bracket'),

          # 右中段
          normal_key('h', 'quote'),
          normal_key('j', 'h'),
          normal_key('k', 'j'),
          normal_key('l', 'k'),
          normal_key('semicolon', 'l'),
          normal_key('quote', 'semicolon'),

          # 右下段
          normal_key('n', 'slash'),
          normal_key('m', 'n'),
          normal_key('comma', 'm'),
          normal_key('period', 'comma'),
          normal_key('slash', 'period'),
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
