local round_robin
do
  local _obj_0 = require('main')
  round_robin = _obj_0.round_robin
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
    local result = round_robin(files)
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
