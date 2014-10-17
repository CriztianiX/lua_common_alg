local rotate_and_retrieve
do
  local _obj_0 = require('main')
  rotate_and_retrieve = _obj_0.rotate_and_retrieve
end
return describe("Testing tables's round-robin", function()
  local uscore
  setup(function()
    uscore = require('underscore')
  end)
  teardown(function()
    uscore = nil
  end)
  return it("testing results", function()
    local files = {
      {
        "1-one",
        "1-two",
        "1-three",
        "1-four"
      },
      {
        "2-one"
      },
      {
        "3-one",
        "3-two"
      },
      {
        "4-one",
        "4-two",
        "4-three"
      }
    }
    local result = { }
    while not uscore.is_empty(files) do
      local file
      file, files = rotate_and_retrieve(files)
      table.insert(result, file)
    end
    local expected = {
      "4-three",
      "3-two",
      "2-one",
      "1-four",
      "4-two",
      "3-one",
      "1-three",
      "4-one",
      "1-two",
      "1-one"
    }
    return assert.are.same(result, expected)
  end)
end)
