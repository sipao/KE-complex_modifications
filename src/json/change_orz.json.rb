#!/usr/bin/env ruby

# You can generate json by executing the following command on Terminal.
#
# $ ruby ./example_japanese_nicola.json.rb
#

require 'json'
require_relative '../lib/karabiner.rb'

########################################
# 有効になる条件

#CONDITIONS = [
#].freeze

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
    'title' => 'US orz',
    'rules' => [
      {
        'description' => 'US orz',
        'manipulators' => [
          # シフトありから並べること

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
          normal_key('equal_sign', '-'),

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
    'to' => [{
      'key_code' => char,
    }],
#    'conditions' => CONDITIONS,
  }
end

main
