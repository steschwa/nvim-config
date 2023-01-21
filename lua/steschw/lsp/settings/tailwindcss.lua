return {
    settings = {
        tailwindCSS = {
            experimental = {
                -- Support intellisense in cva blocks 
                -- https://github.com/joe-bell/cva
                classRegex = {
                    "cva\\(([^)]*)\\)",
                    "[\"'`]([^\"'`]*).*?[\"'`]",
                },
            },
        },
    }
}
