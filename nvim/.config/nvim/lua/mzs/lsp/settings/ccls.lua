-- lsp document see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ccls
-- options see https://github.com/MaskRay/ccls/wiki/Customization#initialization-options
-- .ccls examples https://github.com/MaskRay/ccls/wiki/Project-Setup#ccls-examples
return {
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"} ;
            extraArgs = { "-Wall", "-g" };
        };
        single_file_support = true;
    };
}
