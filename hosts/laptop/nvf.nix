{ ... }:
{
  programs.nvf = {
    enable = true;
    # Your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };

      vim.languages = {
        nix.enable = true;
        rust.enable = true;
        zig.enable = true;
        lua.enable = true;
        clang.enable = true;
      };
      vim.treesitter.enable = true;
      vim.binds.whichKey.enable = true;
      vim.statusline.lualine.enable = true;
      vim.filetree.nvimTree.enable = true;
    };
  };
}
