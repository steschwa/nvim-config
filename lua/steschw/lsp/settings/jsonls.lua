-- Find more schemas here: https://www.schemastore.org/json/
local schemas = {
    {
        description = "TypeScript compiler configuration file",
        fileMatch = {
            "tsconfig.json",
            "tsconfig.*.json",
        },
        url = "https://json.schemastore.org/tsconfig.json",
    },
    {
        description = "Lerna config",
        fileMatch = { "lerna.json" },
        url = "https://json.schemastore.org/lerna.json",
    },
    {
        description = "Babel configuration",
        fileMatch = {
            ".babelrc.json",
            ".babelrc",
            "babel.config.json",
        },
        url = "https://json.schemastore.org/babelrc.json",
    },
    {
        description = "ESLint config",
        fileMatch = {
            ".eslintrc.json",
            ".eslintrc",
        },
        url = "https://json.schemastore.org/eslintrc.json",
    },
    {
        description = "Prettier config",
        fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json",
        },
        url = "https://json.schemastore.org/prettierrc",
    },
    {
        description = "Vercel Now config",
        fileMatch = { "now.json" },
        url = "https://json.schemastore.org/now",
    },
    {
        description = "Json schema for properties json file for a GitHub Workflow template",
        fileMatch = {
            ".github/workflow-templates/**.properties.json",
        },
        url = "https://json.schemastore.org/github-workflow-template-properties.json",
    },
    {
        description = "golangci-lint configuration file",
        fileMatch = {
            ".golangci.toml",
            ".golangci.json",
        },
        url = "https://json.schemastore.org/golangci-lint.json",
    },
    {
        description = "JSON schema for the JSON Feed format",
        fileMatch = {
            "feed.json",
        },
        url = "https://json.schemastore.org/feed.json",
        versions = {
            ["1"] = "https://json.schemastore.org/feed-1.json",
            ["1.1"] = "https://json.schemastore.org/feed.json",
        },
    },
    {
        description = "NPM configuration file",
        fileMatch = {
            "package.json",
        },
        url = "https://json.schemastore.org/package.json",
    },
}

local opts = {
    settings = {
        json = {
            schemas = schemas,
        },
    },
    setup = {
        commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
                end,
            },
        },
    },
}

return opts
