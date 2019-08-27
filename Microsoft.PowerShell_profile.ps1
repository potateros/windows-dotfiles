#set-location C:\Users\ericn\Desktop

new-alias -name l -value dir
new-alias -name vim -value 'C:\Program Files (x86)\vim\vim81\vim.exe'
new-alias -name trash -value Remove-ItemSafely

Set-PSReadlineOption -EditMode vi -BellStyle None

Function gig {
  param(
    [Parameter(Mandatory=$true)]
    [string[]]$list
  )
  $params = ($list | ForEach-Object { [uri]::EscapeDataString($_) }) -join ","
  Invoke-WebRequest -Uri "https://www.gitignore.io/api/$params"  -UseBasicParsing | select -ExpandProperty content | Out-File -FilePath $(Join-Path -path $pwd -ChildPath ".gitignore") -Encoding ascii
}

Function touch {
  set-content -Path ($args[0]) -Value ($null)
}

Function rmd {
	Remove-Item -Recurse -Force -Path $args
}

Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
Import-Module posh-git
Import-Module oh-my-posh

Set-Theme Robbyrussell

clear-host
