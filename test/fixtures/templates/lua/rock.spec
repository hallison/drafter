author   = "Hallison Batista"
version  = "0.1.0"
build { file = "rockspecs/{app.name}-{app.version}.rockspec", source = "lua/rockspec" }
build { file = "bin/{app.name}", source = "lua/script" }
build { file = "lib/{app.name}.lua", source = "lua/module.lua" }

