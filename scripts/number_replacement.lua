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
  ["88017"] = "8807117",
  ["88013"] = "8807113",
  ["88019"] = "8809119",
  ["88014"] = "8809114",
  ["88018"] = "8808118",
  ["88016"] = "8808116",
  ["88015"] = "8805115",
  ["88096"] = "096",
  ["8809696"] = "09696",
  ["881"] = "1",
  ["1"] = "1",
  ["883"] = "3",
  ["3"] = "3",
  ["9"] = "9",
  ["889"] = "9"
}
  
  -- Get the current destination number
  local destination_number = session:getVariable("destination_number")
  
  -- Extract the prefix
  local prefix = destination_number:match("^(880%d%d)")
  
  -- Replace with the appropriate prefix
  if prefix_map[prefix] then
    local new_prefix = prefix_map[prefix]
    local new_number = destination_number:gsub(prefix, new_prefix, 1)
    session:setVariable("destination_number", new_number)
  end
  