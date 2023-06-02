local status_ok, alpha = pcall(require, "alpha")

if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local ascii = {
	-- "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
	-- "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
	-- "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
	-- "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
	-- "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
	-- "kkkkkkkkkkkkkkkkkkkkkkkkxdddddddddddddddddddkkkkkkkkkkkkkkkkkkkk",
	-- "kkkkkkkkkkkkkkkkkkxxxxxxc..................'oxxxxxkkkkkkkkkkkkkk",
	-- "kkkkkkkkkkkkkkkkkl'.....:xxxxxxxddoodxxl;;;,......;xkkkkkkkkkkkk",
	-- "kkkkkkkkkkkkx:''';ododdox0000000OOOOO00kxxxo;,,,,,,';dkkkkkkkkkk",
	-- "kkkkkkkkkkd:;clllxKXK0000OOOOOOOOOOOOOOOOOOOxdoccl:,',,,,ckkkkkk",
	-- "kkkkkkkko:::ckKKKKK0OOOOOOOOOOOOOOOOOOOOOOOOOOxdolclc,...,;cxkkk",
	-- "kkkkkkkk: 'OX0OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOxdodollll' .okkk",
	-- "kkkkkkdo:':OK0OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkocll' .okkk",
	-- "kkkkdo;.c0KOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkocll,..ldxk",
	-- "kkkd'.lO0XKOkkkOOOOOOOOOOOOkkkkOOOOOOOOOOOOOOOOOOOOOkollcc:,..lk",
	-- "kkko. lXXXk,...cOOOOOOOOOOd,...ckOOOOOOOOOOOOOOOOOOOOkkoccl;  ck",
	-- "kkko. lXx;;clcc;'ckOOOOOo,,clcc;''ckOOOOOOOOOOOOOOOOOOOdccl;  ck",
	-- "kkko. lXl .d0OO; 'x0OOOOc .x0OO;  'x0OOOOOOOOOOOOOOOOOOdlcl;  ck",
	-- "kkko. lKl .d0OO; 'x0OOOOc .d0OO;  'x0OOOOOOOOOOOOOOOOOOdlcl;  ck",
	-- "kkko. cOo':x0OOl':kOOOOOo':xOOOl,':kOOOOOOOOOOOOOOOOOOOdlcl;  ck",
	-- "kkko. cOOkkkkkkOOOOOOOOOOOOOkkkkkkkkOOOOOOOOOOOOOOOOOOOxoll;  ck",
	-- "kkkd'.:xxddddddkOOOOOOOOOOkxddddddddxkOOOOOOOOOOOOOOOOOkkdc,..lk",
	-- "kkkkdo,.;kOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOdl;..cdxk",
	-- "kkkkkx, ,kOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOdoll' .okkk",
	-- "kkkkkx, ,kOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO0koc,.':lxkkk",
	-- "kkkxc;::oO000OOOOOOOOOOOOOOOOOOOOOOOOOOOO00Oxddddddddlc;',,cxkkk",
	-- "kkko. 'cccccccccccccccccccccccccccccccccccc:,''''''''''',. .okkk",
	-- "kkko.                                                      .okkk",

	-- "████████████████████████████████████████████████████████████████",
	-- "████████████████████████████████████████████████████████████████",
	-- "████████████████████████████████████████████████████████████████",
	-- "████████████████████████████████████████████████████████████████",
	-- "████████████████████████████████████████████████████████████████",
	-- "████████████████████████████████████████████████████████████████",
	-- "████████████████████████████████████████████████████████████████",
	-- "█████████████████████████▒      ▒▒▒▒▒  ▓▓▓▓█████████████████████",
	-- "██████████████████▓      ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓██████████████",
	-- "██████████████▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓███████████",
	-- "███████████▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓███████",
	-- "███████████▓  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓███████",
	-- "██████████▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓███████",
	-- "█████████▒ ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓███████",
	-- "███████    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓█████",
	-- "███████    ▓████▒▒▒▒▒▒▒▒▒▒▒▓████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓█████",
	-- "███████  ██▓▒▒▒▒██▓▒▒▒▒▒▒██▓▒▒▒▒██▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓█████",
	-- "███████  ██▓▒▒▒▒██▓▒▒▒▒▒▒██▓▒▒▒▒██▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓█████",
	-- "███████▒▒██▓▒▒▒▒██▓▒▒▒▒▒▒██▓▒▒▒▒██▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓█████",
	-- "███████▒▒▓▓▒▒▒▒▒▓▓▒▒▒▒▒▒▒▓▓▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓█████",
	-- "███████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓█████",
	-- "███████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓█████",
	-- "█████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓███████",
	-- "█████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓███████",
	-- "█████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓█████████",
	-- "███████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▒▒▒▒▓▓▓▓▓███████",
	-- "████████████████████████████████████████████████████████████████",

	"                  ████████████████              ",
	"            ██████░░░░░░▒▒▒▒░░▓▓▓▓██████        ",
	"        ████░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓██      ",
	"      ██░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓████  ",
	"    ██░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓██",
	"    ██░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██",
	"  ██░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██",
	"██░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓",
	"██░░░░████▒▒▒▒▒▒▒▒▒▒████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓",
	"██░░██▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓",
	"██░░██▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓",
	"██▒▒██▒▒▒▒██▒▒▒▒▒▒██▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓",
	"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓",
	"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓",
	"  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓██",
	"  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██",
	"  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓██  ",
	"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓██",
	"████████████████████████████████████████████████",
}

dashboard.section.buttons.val = {
	dashboard.button("p", " 🌳  Projects", ":Telescope project<CR>"),
	dashboard.button("s", " 🔬  Settings", ":e $MYVIMRC | :cd %:p:h<CR>"),
	dashboard.button("q", " 🏓  Quit NVIM", ":qa<CR>"),
}
dashboard.section.footer.val = { "~ brain.exist() == null; ~" }
dashboard.section.header.val = ascii

alpha.setup(dashboard.opts)
