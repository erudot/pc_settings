# Development PC

PowerShell DSCでやる。

```PowerShell
# 実行ポリシーを変更
Set-ExecutionPolicy RemoteSigned

# WinRMサービス起動
Start-Service –Name WinRM –PassThru

# TrastedHostsにlocalhost追加
Set-Item wsman:\localhost\Client\TrustedHosts localhost -Concatenate
Get-Item WSMan:\localhost\Client\TrustedHosts

# DSC構成の置いてあるパスに移動
cd Development-PC
. .\DevelopmentPCConfig.ps1
# MOF生成
DevelopmentPCConfig
# 構成を適用
Start-DscConfiguration -Path .\DevelopmentPCConfig  -Wait -Verbose

# TrastedHostsをクリア
Clear-Item WSMan:\localhost\Client\Trustedhosts
Get-Item WSMan:\localhost\Client\TrustedHosts

# 実行ポリシーを戻す
Set-ExecutionPolicy Restricted
```
