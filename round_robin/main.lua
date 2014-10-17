local p
do
  local _obj_0 = require("moon")
  p = _obj_0.p
end
local uscore = require('underscore')
local generate_dummy_data
generate_dummy_data = function()
  return {
    {
      "1-one",
      "1-two",
      "1-three"
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
end
local rotate_and_retrieve
rotate_and_retrieve = function(files)
  local f_popped
  if next(files) ~= nil then
    local t_popped = uscore.pop(files)
    if not uscore.is_empty(t_popped) then
      f_popped = uscore.pop(t_popped)
      if not uscore.is_empty(t_popped) then
        uscore.unshift(files, t_popped)
      end
    end
  end
  return f_popped, files
end
local round_robin
round_robin = function(files)
  local result = { }
  while not uscore.is_empty(files) do
    local file
    file, files = rotate_and_retrieve(files)
    table.insert(result, file)
  end
  return result
end
local _ = [[files = {}
while true
  if next(files) == nil then
    print "Generating dummy data"
    files = generate_dummy_data!
  else
    file, files = rotate_and_retrieve files
    p file
    p files
]]
return {
  round_robin = round_robin
}
