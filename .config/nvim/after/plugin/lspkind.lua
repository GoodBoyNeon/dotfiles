local status_ok, lspkind = pcall(require, "lspkind")

if not status_ok then
	return
end

lspkind.init({
	mode = "symbol",
	symbol_map = {
		NONE = "",
		Array = "",
		Boolean = "⊨",
		Class = "",
		Constructor = "",
		Key = "",
		Namespace = "",
		Null = "NULL",
		Number = "#",
		Object = "⦿",
		Package = "",
		Property = "",
		Reference = "",
		Snippet = "",
		String = "𝓐",
		TypeParameter = "",
		Unit = "",
	},
})
