Set WshShell = WScript.CreateObject("WScript.Shell")
If wscript.arguments.count <2 then
    WshShell.run """%USERPROFILE%\AppData\Local\wsltty\bin\mintty.exe"" --Title ""Neovim - %1"" --WSL=""Debian"" --configdir=""%APPDATA%\wsltty"" -e zsh --login -c ""nvim $(wslpath '%1')"""
Else
    sCmd = """%USERPROFILE%\AppData\Local\wsltty\bin\mintty.exe"" --Title ""Neovim - " & wscript.arguments(1) & " "" --WSL=""Debian"" --configdir=""%APPDATA%\wsltty"" -e zsh --login -c ""nvim $(wslpath '" & wscript.arguments(1) & "')"""
    WshShell.run sCmd
End If
