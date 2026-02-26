local dev_utils = os.getenv('HOME') .. '/dev_utils/'
local dev_utils_debug = os.getenv('HOME') .. '/dev_utils/vscode-firefox-debug'

if not (vim.uv or vim.loop).fs_stat(dev_utils) then
    print("Criando diretório dev_utils em: " .. dev_utils)
    local out = os.execute("mkdir " .. dev_utils)

    if out ~= 0 then
        vim.api.nvim_echo({
            { "Erro ao criar o diretório dev_utils", "ErrorMsg" },
            { out,                                  "WarningMsg" },
            { "\nPressione qualquer tecla para sair..." },
        }, true, {})

        vim.fn.getchar()
        os.exit(1)
    end
end

if not (vim.uv or vim.loop).fs_stat(dev_utils_debug) then
    print("Clonando firefox-debug-adapter...")
    local firefox_debug = "https://github.com/firefox-devtools/vscode-firefox-debug"
    local out_git_clone = vim.fn.system({ "git", "clone", firefox_debug, dev_utils_debug })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Falha ao clonar firefox-debug", "ErrorMsg" },
            { out_git_clone,                   "WarningMsg" },
            { "\nPressione qualquer tecla para sair..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end

    print("Instalando pacotes npm para firefox-debug...")
    vim.fn.system({ "npm", "install", "--prefix", dev_utils_debug })
    local out_npm_run_build = vim.fn.system({ "npm", "run", "build", "--prefix", dev_utils_debug })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Erro ", "ErrorMsg" },
            { out_npm_run_build,                                  "WarningMsg" },
            { "\nPressione qualquer tecla para sair..." },
        }, true, {})

        vim.fn.getchar()
        os.exit(1)
    end

    print("Concluído!")
end

