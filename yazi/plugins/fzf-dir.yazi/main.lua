-- Как встроенный `plugin fzf`, но ищет только директории (через fd)
local M = {}

local state = ya.sync(function()
	return cx.active.current.cwd
end)

function M:entry()
	ya.emit("escape", { visual = true })
	local cwd = state()
	if cwd.spec.is_virtual then
		return ya.notify({ title = "Fzf", content = "Not supported under virtual filesystems", timeout = 5, level = "warn" })
	end

	local permit = ui.hide()
	local child, err = Command("sh")
		:arg({ "-c", "fd --type d --hidden --follow --exclude .git | fzf" })
		:cwd(tostring(cwd))
		:stdin(Command.INHERIT)
		:stdout(Command.PIPED)
		:spawn()
	if not child then
		permit:drop()
		return ya.notify({ title = "Fzf", content = "Failed to start `fzf`: " .. tostring(err), timeout = 5, level = "error" })
	end
	local output = child:wait_with_output()
	permit:drop()

	local line = output and output.stdout:match("[^\r\n]+")
	if line then
		ya.emit("cd", { cwd:resolve(Url(line)), raw = true })
	end
end

return M
