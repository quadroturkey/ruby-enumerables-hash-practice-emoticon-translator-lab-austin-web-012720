require "yaml"
require "pry"

def load_library(path)
  emoji = YAML.load_file(path)
  hash = {}
  emoji.each do |meaning, (english, japanese)|
    if !hash[:get_meaning]
      hash[:get_meaning] = {}
    end
    if !hash[:get_emoticon]
      hash[:get_emoticon] = {}
    end
    if hash[:get_meaning][japanese] != meaning
      hash[:get_meaning][japanese] = meaning
    end
    if hash[:get_emoticon][english] != japanese
      hash[:get_emoticon][english] = japanese
    end
  end
  hash
end

def get_japanese_emoticon(path, emoticon)
  emoji = load_library(path)
  target = emoji[:get_emoticon]
  target.each do |key, value|
    if emoticon == key
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  emoji = load_library(path)
  target = emoji[:get_meaning]
  target.each do |key, value|
    if emoticon == key
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end