import p from require "moon"
uscore = require 'underscore'

generate_dummy_data = () ->
  {
    {"1-one", "1-two", "1-three"}
    {"2-one"}
    {"3-one", "3-two"}
    {"4-one", "4-two", "4-three"}
  }

rotate_and_retrieve = (files) ->
  local f_popped

  if next(files) ~= nil then
    t_popped = uscore.pop(files)

    if not uscore.is_empty(t_popped)
      f_popped = uscore.pop t_popped

      if not uscore.is_empty(t_popped)
        uscore.unshift files,t_popped 

  return f_popped, files


[[
files = {}
while true
  if next(files) == nil then
    print "Generating dummy data"
    files = generate_dummy_data!
  else
    file, files = rotate_and_retrieve files
    p file
    p files
]]
{ :generate_dummy_data, :rotate_and_retrieve }