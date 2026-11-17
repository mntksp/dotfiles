return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "bashls",
        "docker_compose_language_service",
        "dockerls",
        "docker_language_server",
        "gitlab_ci_ls",
        "helm_ls",
        "terraformls",
        "vimls",
        "yamlls",
        "marksman",
      },
    })
    require("mason-tool-installer").setup({
      ensure_installed = {
        "ansible-lint",
        "bash-debug-adapter",
        "docker-compose-linter",
        "gitleaks",
        "gitlint",
        "hadolint",
        "jq",
        "kube-linter",
        "luacheck",
        "luafmt",
        "markdownlint",
        "mdformat",
        "shellcheck",
        "shellharden",
        "shfmt",
        "terraform",
        "yamlfmt",
        "yamllint",
      },
    })

    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      }),
      sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
    })
  end,
}
