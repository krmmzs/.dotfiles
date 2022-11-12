return {
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"} ;
            extraArgs = { "-Wall", "-std=c++17", "-g" }; -- support C++17
        };
    }
}
