local function match_patterns(path, patterns)
    for _, pattern in ipairs(patterns) do
        if vim.fn.match(path, pattern) > -1 then
            return true
        end
    end
    return false
end

local function is_ansible_playbook(path)
    local dirname = vim.fn.fnamemodify(path, ":h:t")
    local patterns = {
        "-playbooks$",
        "-playbook$",
        "-pl$"
    }
    return match_patterns(dirname, patterns)
end

local ansible_filetype = {
    pattern = {
        ['.*'] = function(path, bufnr)
            if is_ansible_playbook(path) then
                return 'yaml.ansible'
            end
        end,
        [ '.*/roles/.*/tasks/.*%.yml' ] = "yaml.ansible",
        [ '.*/roles/.*/handlers/.*%.yml' ] = "yaml.ansible",
        [ '.*/roles/.*/tasks/.*%.yaml' ] = "yaml.ansible",
        [ '.*/roles/.*/handlers/.*%.yaml' ] = "yaml.ansible",
    }
}

vim.filetype.add(ansible_filetype)

