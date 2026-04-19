return {
    'johnpgr/bible-reader.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function()
        require('bible-reader').setup()
    end
}
