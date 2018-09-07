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
# キーテーブルの定義

KEY_SOURCE = ["grave_accent_and_tilde","1", "2", "3", "4", "5", "6", "7", "8", "9", "0", 
"q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "open_bracket", "close_bracket", "backslash", 
"a", "s", "d", "f", "g", "h", "j", "k", "l", "semicolon", "quote", 
"z", "x", "c", "v", "b", "n", "m", "comma", "period", "slash"].freeze

KEY_DIST = ["grave_accent_and_tilde","1", "2", "3", "4", "5", "6", "7", "8", "9", "0", 
"q", "w", "comma", "period", "semicolon", "m", "r", "d", "y", "p", "open_bracket", "close_bracket", "backslash", 
"a", "o", "e", "i", "u", "g", "t", "k", "s", "n", "quote", 
"z", "x", "c", "v", "f", "b", "h", "j", "l", "slash"].freeze

########################################

def main
  puts JSON.pretty_generate(
    'title' => 'Eucalyn配列',
    'rules' => [
      {
        'description' => 'Eucalyn配列',
        'manipulators' => [
          # シフトありから並べること

          # ------------------------------
          # シフトなし

          normal_key_loop
        ],
      },
    ]
  )
end

def normal_key_loop
  ret = {}
  KEY_SOURCE.zip(KEY_DIST).each do |src,dist|
    ret = ret.update(normal_key(src,dist))
  end
  ret
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
