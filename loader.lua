local CACHE_KEY = "1.6.65-ui-runtime-4"
local REQUIRED_API = { "RegisterIconPack", "GetIconSources", "ExpandOpenButton", "AdapterVersion=3" }

local MIRRORS = {
	"https://raw.githubusercontent.com/article-hub-studio/WindUI-Skibidi/main/dist/main.lua?v=" .. CACHE_KEY,
	"https://article-hub-studio.github.io/WindUI-Skibidi/dist/main.lua?v=" .. CACHE_KEY,
	"https://article-hub-studio.github.io/WindUI-Skibidi/main.lua?v=" .. CACHE_KEY,
	"https://cdn.jsdelivr.net/gh/article-hub-studio/WindUI-Skibidi@main/dist/main.lua",
	"https://github.com/article-hub-studio/WindUI-Skibidi/releases/latest/download/main.lua",
}

local lastError = "no mirrors tried"

for _, url in ipairs(MIRRORS) do
	local ok, body = pcall(function()
		return game:HttpGet(url)
	end)

	if ok and type(body) == "string" then
		local prefix = string.lower(string.sub(body, 1, 220))
		local blocked = string.find(prefix, "429:", 1, true)
			or string.find(prefix, "too many requests", 1, true)
			or string.find(prefix, "<html", 1, true)
			or string.find(prefix, "<!doctype", 1, true)

		local currentApi = true
		for _, method in ipairs(REQUIRED_API) do
			if not string.find(body, method, 1, true) then
				currentApi = false
				lastError = "outdated runtime from " .. url .. " (missing " .. method .. ")"
				break
			end
		end

		if not blocked and currentApi and #body > 1000 then
			local chunk, compileError = loadstring(body)
			if chunk then
				local ran, result = pcall(chunk)
				if ran then
					return result
				end
				lastError = tostring(result)
			else
				lastError = tostring(compileError)
			end
		elseif blocked or #body <= 1000 then
			lastError = "blocked or invalid response from " .. url
		end
	else
		lastError = tostring(body)
	end
end

error("[WindUI Modded] Failed to load any mirror: " .. tostring(lastError))
