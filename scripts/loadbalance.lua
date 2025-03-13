-- local count_file = "/usr/local/freeswitch/scripts/call_count.txt"

-- -- Function to read the call count from the file
-- local function read_count()
--     local file = io.open(count_file, "r")
--     if file then
--         local count = file:read("*n")
--         file:close()
--         return count or 0
--     else
--         return 0
--     end
-- end

-- -- Function to write the call count to the file
-- local function write_count(count)
--     local file = io.open(count_file, "w")
--     if file then
--         file:write(count)
--         file:close()
--     end
-- end

-- -- Get the current call count
-- local count = read_count()

-- -- Determine the destination based on the count
-- local destination
-- if count % 10 < 6 then
--     destination = "sofia/scomm-domestic/sip:" .. session:getVariable("destination_number") .. "@10.243.23.6"
-- else
--     destination = "sofia/external/sip:" .. session:getVariable("destination_number") .. "@10.243.0.10"
-- end

-- -- Increment the call count and write it back to the file
-- count = count + 1
-- write_count(count)

-- -- Bridge the call to the determined destination
-- session:execute("bridge", destination)

local count_file = "/usr/local/freeswitch/scripts/call_count.txt"

-- Function to read the call count from the file
local function read_count()
    local file = io.open(count_file, "r")
    if file then
        local count = file:read("*n")
        file:close()
        return count or 0
    else
        return 0
    end
end

-- Function to write the call count to the file
local function write_count(count)
    local file = io.open(count_file, "w")
    if file then
        file:write(count)
        file:close()
    end
end

-- Get the current call count
local count = read_count()

-- Determine the destination based on the count
local destination
local mod = count % 10

if mod < 4 then
    -- 40% of the calls
    destination = "sofia/scomm-domestic/sip:" .. session:getVariable("destination_number") .. "@10.243.23.6"
elseif mod < 7 then
    -- 30% of the calls
    destination = "sofia/external/sip:" .. session:getVariable("destination_number") .. "@10.243.0.10"
else
    -- 30% of the calls
    destination = "sofia/dinstar/sip:" .. session:getVariable("destination_number") .. "@172.29.36.34"
end

-- Increment the call count and write it back to the file
count = count + 1
write_count(count)

-- Bridge the call to the determined destination
session:execute("bridge", destination)
