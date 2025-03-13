-- Function to modify the caller_id_number based on specific patterns
function modify_caller_id(caller_id_number)
    -- Check for the specific patterns and apply the required transformation
    if string.match(caller_id_number, "^8807117") then
        return "88017" .. string.sub(caller_id_number, 8)
    elseif string.match(caller_id_number, "^8809119") then
        return "88019" .. string.sub(caller_id_number, 8)
    elseif string.match(caller_id_number, "^8807113") then
        return "88017" .. string.sub(caller_id_number, 8)
    elseif string.match(caller_id_number, "^8809114") then
        return "88019" .. string.sub(caller_id_number, 8)
    elseif string.match(caller_id_number, "^8808116") then
        return "88016" .. string.sub(caller_id_number, 8)
    elseif string.match(caller_id_number, "^8808118") then
        return "88018" .. string.sub(caller_id_number, 8)
    elseif string.match(caller_id_number, "^8805115") then
        return "88015" .. string.sub(caller_id_number, 8)
    else
        -- If none of the conditions match, return the original caller_id_number
        return caller_id_number
    end
end

-- Get the caller_id_number from the channel variables
caller_id_number = session:getVariable("caller_id_number")

-- Modify the caller_id_number based on the conditions
modified_caller_id = modify_caller_id(caller_id_number)

-- Set the new effective caller ID
session:setVariable("effective_caller_id_number", modified_caller_id)
session:setVariable("effective_caller_id_name", modified_caller_id)

-- Bridge the call to the external destination
destination_number = session:getVariable("destination_number")
session:execute("bridge", "sofia/external/sip:" .. destination_number .. "@103.95.96.100")
