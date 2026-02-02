return {
  "echasnovski/mini.icons",
  version = false,
  config = function()
    require("mini.icons").setup()
    -- Mock nvim-web-devicons so plugins using it will use mini.icons instead
    require("mini.icons").mock_nvim_web_devicons()
  end,
}
