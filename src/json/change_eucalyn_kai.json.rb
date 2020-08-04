#!/usr/bin/env ruby

# You can generate json by executing the following command on Terminal.
#
# $ ruby ./example_japanese_nicola.json.rb
#

require 'json'
require_relative '../lib/karabiner.rb'

########################################
# 有効になる条件

MODIFIERS = 
    Karabiner.from_modifiers(nil,["any"]).freeze
    
CONDITIONS = [
  Karabiner.input_source_if([
                              {
                                'language' => 'en',
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

########################################

def main
  puts JSON.pretty_generate(
    'title' => 'Eucalyn配列',
    'rules' => [
      {
        'description' => 'Eucalyn配列改',
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
          normal_key('q', 'semicolon'),
          normal_key('w', 'comma'),
          normal_key('e', 'period'),
          normal_key('r', 'p'),
          normal_key('t', 'q'),

          # 左中段
          normal_key('a', 'a'),
          normal_key('s', 'o'),
          normal_key('d', 'e'),
          normal_key('f', 'i'),
          normal_key('g', 'u'),

          # 左下段
          normal_key('z', 'z'),
          normal_key('x', 'x'),
          normal_key('c', 'c'),
          normal_key('v', 'v'),
          normal_key('b', 'w'),

          # 右最上段
          normal_key('6', '6'),
          normal_key('7', '7'),
          normal_key('8', '8'),
          normal_key('9', '9'),
          normal_key('0', '0'),
          normal_key('hyphen', 'hyphen'),
          normal_key('equal_sign', 'equal_sign'),

          # 右上段
          normal_key('y', 'y'),
          normal_key('u', 'g'),
          normal_key('i', 'd'),
          normal_key('o', 'm'),
          normal_key('p', 'f'),
          normal_key('open_bracket', 'open_bracket'),
          normal_key('close_bracket', 'close_bracket'),
          normal_key('backslash', 'backslash'),
          
          # 右中段
          normal_key('h', 'b'),
          normal_key('j', 'n'),
          normal_key('k', 't'),
          normal_key('l', 'r'),
          normal_key('semicolon', 's'),
          normal_key('quote', 'quote'),

          # 右下段
          normal_key('n', 'h'),
          normal_key('m', 'j'),
          normal_key('comma', 'k'),
          normal_key('period', 'l'),
          normal_key('slash', 'slash'),
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
      'modifiers' => MODIFIERS,
    },
    'to' => [{
      'key_code' => char,
    }],
#    'conditions' => CONDITIONS,
  }
end

main
