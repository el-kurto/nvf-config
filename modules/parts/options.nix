{pkgs, ...}: {
  viAlias = true;
  vimAlias = true;

  extraPlugins = {
    vim-tmux-navigator = {
      package = pkgs.vimPlugins.vim-tmux-navigator;
      setup = "vim.g.tmux_navigator_no_mappings = 1";
    };
  };

  clipboard.enable = true;
  clipboard.registers = "unnamedplus";

  diagnostics.enable = true;

  options = {
    timeoutlen = 300;
    ttimeoutlen = 0;
    updatetime = 200;

    scrolloff = 4;
    sidescrolloff = 8;

    cursorline = true;
    cursorlineopt = "both";

    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    smartindent = false;

    wrap = false;
    number = true;
    relativenumber = true;

    ignorecase = true;
    smartcase = true;

    splitbelow = true;
    splitright = true;

    undofile = true;
    undolevels = 10000;

    signcolumn = "yes";
    colorcolumn = "+1";
    textwidth = 120;

    pumheight = 10;
    pumblend = 0;
    winblend = 0;

    inccommand = "split";

    sessionoptions = "buffers,curdir,tabpages,winsize,winpos";
  };

  ui.borders.enable = true;
  ui.borders.globalStyle = "single";

  visuals.nvim-web-devicons.enable = true;
  visuals.tiny-devicons-auto-colors.enable = true;

  keymaps = [
    # Window Management
    {
      key = "<C-h>";
      mode = ["n"];
      action = "<cmd>TmuxNavigateLeft<CR>";
      silent = true;
      desc = "Go to left window";
    }
    {
      key = "<C-j>";
      mode = ["n"];
      action = "<cmd>TmuxNavigateDown<CR>";
      silent = true;
      desc = "Go to lower window";
    }
    {
      key = "<C-k>";
      mode = ["n"];
      action = "<cmd>TmuxNavigateUp<CR>";
      silent = true;
      desc = "Go to upper window";
    }
    {
      key = "<C-l>";
      mode = ["n"];
      action = "<cmd>TmuxNavigateRight<CR>";
      silent = true;
      desc = "Go to right window";
    }
    {
      key = "<leader>wd";
      mode = ["n"];
      action = "<cmd>close<CR>";
      silent = true;
      desc = "Delete window";
    }
    {
      key = "<leader>ws";
      mode = ["n"];
      action = "<cmd>split<CR>";
      silent = true;
      desc = "Split window below";
    }
    {
      key = "<leader>wv";
      mode = ["n"];
      action = "<cmd>vsplit<CR>";
      silent = true;
      desc = "Split window right";
    }
    {
      key = "<leader>w=";
      mode = ["n"];
      action = "<C-w>=";
      silent = true;
      desc = "Equalize windows";
    }
    {
      key = "<leader>w+";
      mode = ["n"];
      action = "<cmd>resize +4<CR>";
      silent = true;
      desc = "Increase height";
    }
    {
      key = "<leader>w-";
      mode = ["n"];
      action = "<cmd>resize -4<CR>";
      silent = true;
      desc = "Decrease height";
    }
    {
      key = "<leader>w>";
      mode = ["n"];
      action = "<cmd>vertical resize +4<CR>";
      silent = true;
      desc = "Increase width";
    }
    {
      key = "<leader>w<";
      mode = ["n"];
      action = "<cmd>vertical resize -4<CR>";
      silent = true;
      desc = "Decrease width";
    }
    # Search & Navigation
    {
      key = "n";
      mode = ["n" "x" "o"];
      action = "nzzzv";
      silent = true;
      desc = "Next search result";
    }
    {
      key = "N";
      mode = ["n" "x" "o"];
      action = "Nzzzv";
      silent = true;
      desc = "Prev search result";
    }
    {
      key = "<Esc>";
      mode = ["n"];
      action = "<cmd>noh<CR><Esc>";
      silent = true;
      desc = "Clear search highlights";
    }
    # Visual Mode
    {
      key = "<";
      mode = ["v"];
      action = "<gv";
      silent = true;
      desc = "Decrease indent";
    }
    {
      key = ">";
      mode = ["v"];
      action = ">gv";
      silent = true;
      desc = "Increase indent";
    }
    # Jumplist
    {
      key = "gO";
      mode = ["n"];
      action = "<C-o>";
      silent = true;
      desc = "Jump back (jumplist)";
    }
    # Toggles
    {
      key = "<leader>us";
      mode = ["n"];
      action = "<cmd>setlocal spell!<CR>";
      silent = true;
      desc = "Toggle spelling";
    }
    {
      key = "<leader>ur";
      mode = ["n"];
      action = "<cmd>set relativenumber!<CR>";
      silent = true;
      desc = "Toggle relative line numbers";
    }
    {
      key = "<leader>um";
      mode = ["n"];
      action = "<cmd>Markview toggle<CR>";
      silent = true;
      desc = "Toggle markdown preview";
    }
  ];
}
