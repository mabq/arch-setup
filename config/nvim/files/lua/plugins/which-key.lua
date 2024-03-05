-- use `:checkhealth whick-key` to check for possible keybindings duplicates
-- timeout options are set on the `options` config file
return {
    {
        enabled = true,
        'folke/which-key.nvim', -- Useful plugin to show you pending keybinds.
        event = 'VimEnter', -- load before all the UI elements
        config = function() -- this is the function that runs, AFTER loading
            require('which-key').setup()

            -- Document existing key chains
            require('which-key').register {
                ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
                ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
                ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
                ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
                ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
            }
        end,
    },
}
