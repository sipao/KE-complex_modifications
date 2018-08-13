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
      'modifiers' => MODIFIERS,
    },
    'to' => [{
      'key_code' => char,
    }],
    'conditions' => CONDITIONS,
  }
end

main
