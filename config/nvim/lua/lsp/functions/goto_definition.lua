function f()
    local util = vim.lsp.util
    local log = require("vim.lsp.log")
    local api = vim.api

    local handler = function(_, result, ctx)
        if result == nil or vim.tbl_isempty(result) then
            local _ = log.info() and log.info(ctx.method, "No location found")
            return nil
        end

        -- (v)split depending on window orientation
        if vim.api.nvim_win_get_width(0) > (vim.api.nvim_win_get_height(0) * 3) then
            vim.cmd('vsplit')
        else
            vim.cmd('split')
        end
        
        if vim.tbl_islist(result) then
            util.jump_to_location(result[1])

            if #result > 1 then
                util.set_qflist(util.locations_to_items(result))
                api.nvim_command("copen")
                api.nvim_command("wincmd p")
            end
        else
            util.jump_to_location(result)
        end
    end

    return handler
end

vim.lsp.handlers["textDocument/definition"] = f()

