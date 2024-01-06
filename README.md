# Vim Config

Configuration files for Neovim.

## Required

- [Vim](https://www.vim.org)
- [Git](https://git-scm.com)
- [Node.js](https://nodejs.org/en)
- [Lazygit](https://github.com/jesseduffield/lazygit)

### Optional

- [PlemolJP](https://github.com/yuru7/PlemolJP) (Use Nerd Font synthetic edition)

## Plugins

In this configuration, the following plugins are used.
The plugin packages except `vim-jetpack` are installed in the setup procedure,
so you don't have to install these manually.

<details>
<summary>Used Plugins List</summary>

- [tani/vim-jetpack](https://github.com/tani/vim-jetpack)
- [easymotion/vim-easymotion](https://github.com/easymotion/vim-easymotion)
- [tpope/vim-surround](https://github.com/tpope/vim-surround)
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary)
- [raimondi/delimitmate](https://github.com/raimondi/delimitmate)
- [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- [tanvirtin/monokai.nvim](https://github.com/tanvirtin/monokai.nvim)
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [junegunn/fzf](https://github.com/junegunn/fzf)
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)
- [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
- [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
- [jmcantrell/vim-virtualenv](https://github.com/)
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
- [neoclide/coc-snippets](https://github.com/)
- [fannheyward/coc-markdownlint](https://github.com/fannheyward/coc-markdownlint)
- [kkiyama117/coc-toml](https://github.com/kkiyama117/coc-toml)
- [fannheyward/coc-pyright](https://github.com/fannheyward/coc-pyright)
- [fannheyward/coc-rust-analyzer](https://github.com/fannheyward/coc-rust-analyzer)
- [neoclide/coc-tsserver](https://github.com/neoclide/coc-tsserver)
- [neoclide/coc-prettier](https://github.com/neoclide/coc-prettier)
- [neoclide/coc-eslint](https://github.com/neoclide/coc-eslint)
- [josa42/coc-lua](https://github.com/josa42/coc-lua)

</details>

## Setup

First of all, clone this project files in your machine
with the following command in your terminal.

```shell
git clone https://github.com/shunya-sasaki/vim-config.git ~/.vim
```

And the Next, install the package manager "vim-jetpack" with the following command.

```shell
curl -fLo ~/.vim/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
```

After installing `vim-jetpack`, run `vim` with the following command.
At the startup of vim, 'vim-jetpack' runs and installs other plugins.
However, the colorscheme may be not set correctly at this time, because
some colorscheme files are installed at the initial startup.
If you use such colorschme, restart vim and the colorscheme will be set correctly.

```shell
vim -c JetpackSync
```

## Shortcut keys and commands

| Mode     | Key and command       | Description                            | Plugin           |
| -------- | --------------------- | -------------------------------------- | ---------------- |
| -        | \<Space\>             | Leader key                             | -                |
| Normal   | Y                     | Yank line                              | -                |
| Normal   | \<C-n\>               | Go to next buffer                      | -                |
| Normal   | \<C-p\>               | Go to previous buffer                  | -                |
| Normal   | \<Esc\>\<Esc\>        | Stop the hilighting for the `hlsearch` | -                |
| Terminal | \<Esc\>               | Return to Normal mode                  | -                |
| Normal   | \<Leader\>ff          | Find files                             | fzf.vim          |
| Normal   | \<Leader\>\<Leader\>s | Find {char} forward and backward       | vim-easymotion   |
| Normal   | : Format              | Format a buffer document               | coc.nvim         |
| Normal   | gd                    | Jump to definition                     | coc.nvim         |
| Normal   | gh                    | Hover                                  | coc.nvim         |
| Normal   | gr                    | Rename                                 | coc.nvim         |
| Insert   | \<C-l\>               | Expand selected snippet                | coc-snippets     |
| Normal   | : Prettier            | Format a buffer document with Prettier | coc-snippets     |
| Normal   | \<C-b\>               | Toggle NERDTree buffer                 | nerdtree         |
| Normal   | : MarkdownPreview     | Open a markdown preview in web browser | markdown-preview |
| Normal   | \<Leader\>g           | Run lazygit on floating terminal       | -                |
| Normal   | \<C-t\>               | Open a terminal in current buffer      | -                |

## License

[MIT](./LICENSE)
