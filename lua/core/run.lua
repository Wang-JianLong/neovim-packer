-- TODO: 待优化
local M = {
  default_c_k = '<leader>c',
  default_r_k = '<leader>r',
  default_t_k = '<leader>ur',
  codes = {
    java = {
      name = 'java',
      -- ckey = '<space>c',
      -- rkey = '<space>r',
      -- tkey = '<space>ur',
      c = 'javac %',
      runf = function(_)
        return 'javac % && java %'
      end
    },
    cpp = {
      name = 'cpp',
      c = 'g++ % -o wjl',
      runf = function(os)
        if os then
          return 'g++ % -o wjl && time ./wjl'
        end
        return 'g++ % -o wjl && wjl'
      end
    },
    c = {
      name = 'c',
      c = 'gcc % -o ctest',
      runf = function(os)
        if os then
          return 'gcc % -o ctest && ./ctest'
        end
        return 'gcc % -o ctest  && ctest'
      end
    },
    go = {
      name = 'go',
      -- ckey = '<space>c',
      -- rkey = '<space>r',
      -- tkey = '<space>ur',
      runf = function(_)
        return 'go run %'
      end
    },
  }

}


local keybinding = function(code, os)
  -- { silent = true, noremap = true }
  -- complie
  if not code.ckey then
    code.ckey = M.default_c_k
  end
  if not code.rkey then
    code.rkey = M.default_r_k
  end
  if not code.tkey then
    code.tkey = M.default_t_k
  end

  if code.c then
    vim.keymap.set("n", code.ckey, ":w<Esc>:! time " .. code.c .. " <CR> ")
  end
  -- run
  vim.keymap.set("n", code.rkey, ":w<Esc>:!time " .. code.runf(os) .. "<CR>")
  -- terminal run
  vim.keymap.set("n", code.tkey, ":w<Esc>:terminal time " .. code.runf(os) .. "<CR>i")
  -- vim.keymap.set("i", code.ckey, "<Esc>:w<Esc>:!" .. code.c .. " <CR> ")
  -- -- run
  vim.keymap.set("i", code.rkey, "<Esc>:w<Esc>:!" .. code.runf(os) .. "<CR>")
  -- -- terminal run
  vim.keymap.set("i", code.tkey, "<Esc>:w<Esc>:terminal " .. code.runf(os) .. "<CR>i")
end;

function M.is_linux(sys)
  -- {name =  , }
  local codes = M.codes
  for _, v in pairs(codes) do
    vim.api.nvim_create_autocmd("FileType", {
      pattern = v.name,
      callback = function()
        keybinding(v, sys)
      end;
    })

  end
end

M.is_linux(vim.fn.has('win32') == 0)
