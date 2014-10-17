import rotate_and_retrieve from require 'main'
describe "Testing tables's round-robin", ->
  local uscore

  setup () ->
    uscore = require 'underscore'

  teardown () ->
    uscore = nil

  it "testing results", ->
    files = {
      {"1-one", "1-two", "1-three", "1-four" }
      {"2-one"}
      {"3-one", "3-two"}
      {"4-one", "4-two", "4-three"}
    }
    result = {}
    while not uscore.is_empty(files)
      file, files = rotate_and_retrieve files
      table.insert result, file

    expected = {
      "4-three", "3-two", "2-one", "1-four", 
      "4-two", "3-one", "1-three", "4-one", 
      "1-two", "1-one"
    }
    assert.are.same result, expected