-- number_replacement.lua

-- local prefix_map = {
--     ["88017"] = "8807117",
--     ["88013"] = "8807113",
--     ["88019"] = "8809119",
--     ["88014"] = "8809114",
--     ["88018"] = "8808118",
--     ["88016"] = "8808116",
--     ["88015"] = "8805115",
--     ["88096"] = "096"
--   }
  
local prefix_map = {
  ["017"] = "8807117",
  ["013"] = "8807113",
  ["019"] = "8809119",
  ["014"] = "8809114",
  ["018"] = "8808118",
  ["016"] = "8808116",
  ["015"] = "8805115",
  ["88096"] = "096",
  ["096"] = "096",
  ["8802"] = "02",
  ["02"] = "02",
}

  
  -- Get the current destination number
  local destination_number = session:getVariable("destination_number")
  
  -- Extract the prefix
  local prefix = destination_number:match("^(0%d%d)")
  
  -- Replace with the appropriate prefix
  if prefix_map[prefix] then
    local new_prefix = prefix_map[prefix]
    local new_number = destination_number:gsub(prefix, new_prefix, 1)
    session:setVariable("destination_number", new_number)
  end
  