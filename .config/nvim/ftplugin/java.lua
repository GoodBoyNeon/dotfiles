local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		vim.fn.expand("~/.jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"),

		"-configuration",

		vim.fn.expand("~/.jdtls/config_linux"),

		"-data",
		vim.fn.expand("~/.cache/jdtls-workspace/") .. project_name,
	},
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	capabilities = capabilities,
}
require("jdtls").start_or_attach(config)
