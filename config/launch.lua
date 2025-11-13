local platform = require('utils.platform')


-- Default shell for each platform
local default_shells = {
   windows = 'powershell_core',
   mac = 'zsh',
   linux = 'zsh',
}

-- Shell paths and arguments
local shell_paths = {
   windows = {
      powershell_core = 'pwsh',
      powershell_desktop = 'powershell',
      cmd = 'cmd',
      nushell = 'nu',
      msys2 = 'ucrt64.cmd',
      git_bash = 'C:\\Program Files\\Git\\bin\\bash.exe',
   },
   mac = {
      homebrew_prefix = '/opt/homebrew/bin',
      bash = 'bash',
      fish = '/opt/homebrew/bin/fish',
      nushell = '/opt/homebrew/bin/nu',
      zsh = 'zsh',
   },
   linux = {
      bash = 'bash',
      fish = 'fish',
      zsh = 'zsh',
   }
}

-- Common arguments
local shell_args = {
   login = '-l',
   no_logo = '-NoLogo',
}

local options = {
   default_prog = {},
   launch_menu = {},
}


if platform.is_win then
   local default_shell = shell_paths.windows[default_shells.windows]
   options.default_prog = { default_shell, shell_args.no_logo }
   options.launch_menu = {
      { label = 'PowerShell Core',    args = { shell_paths.windows.powershell_core, shell_args.no_logo } },
      { label = 'PowerShell Desktop', args = { shell_paths.windows.powershell_desktop } },
      { label = 'Command Prompt',     args = { shell_paths.windows.cmd } },
      { label = 'Nushell',            args = { shell_paths.windows.nushell } },
      { label = 'Msys2',              args = { shell_paths.windows.msys2 } },
      {
         label = 'Git Bash',
         args = { shell_paths.windows.git_bash },
      },
   }
elseif platform.is_mac then
   local default_shell = shell_paths.mac[default_shells.mac]
   options.default_prog = { default_shell, shell_args.login }
   options.launch_menu = {
      { label = 'Bash',    args = { shell_paths.mac.bash, shell_args.login } },
      { label = 'Fish',    args = { shell_paths.mac.fish, shell_args.login } },
      { label = 'Nushell', args = { shell_paths.mac.nushell, shell_args.login } },
      { label = 'Zsh',     args = { shell_paths.mac.zsh, shell_args.login } },
   }
elseif platform.is_linux then
   local default_shell = shell_paths.linux[default_shells.linux]
   options.default_prog = { default_shell, shell_args.login }
   options.launch_menu = {
      { label = 'Bash', args = { shell_paths.linux.bash, shell_args.login } },
      { label = 'Fish', args = { shell_paths.linux.fish, shell_args.login } },
      { label = 'Zsh',  args = { shell_paths.linux.zsh, shell_args.login } },
   }
end

return options
