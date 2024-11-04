-- utils.lua
local M = {}

function M.list_snippets_for_current_filetype()
  local ft = vim.bo.filetype
  local snippets = require("luasnip").get_snippets(ft)

  -- Create a new scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Set buffer options using vim.bo[buf]
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].filetype = "text"

  -- Determine maximum trigger length for alignment
  local max_trigger_length = 0
  for _, snippet in pairs(snippets) do
    local trigger = snippet.trigger or ""
    if #trigger > max_trigger_length then
      max_trigger_length = #trigger
    end
  end

  -- Populate the buffer with aligned snippet details
  local lines = { "Available snippets for filetype: " .. ft, "" }
  for _, snippet in pairs(snippets) do
    local trigger = snippet.trigger or "No trigger"
    local description = snippet.description

    -- Handle description being a table or nil
    if type(description) == "table" then
      description = table.concat(description, ", ")
    elseif type(description) ~= "string" then
      description = "No description"
    end

    -- Format each line with aligned descriptions
    local padded_trigger = trigger .. string.rep(" ", max_trigger_length - #trigger)
    table.insert(lines, "ID: " .. padded_trigger .. " | Desc: " .. description)
  end

  -- Set lines in buffer and open it in a new split window
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_command "split"
  vim.api.nvim_win_set_buf(0, buf)
end

return M
