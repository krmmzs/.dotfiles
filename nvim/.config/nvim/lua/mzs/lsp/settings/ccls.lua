-- lsp document see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ccls
-- options see https://github.com/MaskRay/ccls/wiki/Customization#initialization-options
-- .ccls examples https://github.com/MaskRay/ccls/wiki/Project-Setup#ccls-examples
return {
    init_options = {
        compilationDatabaseDirectory = "build";
        cache = {
            -- see examples: https://github.com/MaskRay/ccls/wiki/Customization#indexonchange
            directory = ""; -- to avoid writing cache files to disk, default: ".ccls-cache"
        };
        index = {
            threads = 3;
        };
        clang = {
            excludeArgs = { "-frounding-math"} ;
            extraArgs = { "-Wall", "-g" };
        };
        single_file_support = true;
        -- https://github.com/MaskRay/ccls/wiki/Customization#diagnosticsonopen--diagnosticsonchange--diagnosticsonsave
        diagnostics = {
            -- value: time(in milliseconds) to wait.
            -- Default: onOpen: 0 / onChange: 1000 / onSave: 0
            onOpen = 1;
            onChange = 1;
            onSave = 1;
        };
    };
}
