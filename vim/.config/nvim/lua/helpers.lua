local M = {}

function M.keys(dict)
  local list = {}
  for key, _ in pairs(dict) do
    table.insert(list, key)
  end
  return list
end

function M.replace(string, from, to)
  return string:gsub(from, to)
end

function M.map(fn, list)
  local new_list = {}

  for i, v in ipairs(list) do
    new_list[i] = fn(v)
  end

  return new_list
end

return M
