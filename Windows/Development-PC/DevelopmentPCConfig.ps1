Configuration DevelopmentPCConfig {

    Import-DscResource -ModuleName PsDesiredStateConfiguration

    Node 'localhost' {
        WindowsOptionalFeature MicrosoftWindowsSubsystemLinux
        {
            Ensure = "Enable"
            Name   = "Microsoft-Windows-Subsystem-Linux"
        }

        # 開発者モード
        Registry DeveloperMode
        {
            Ensure    = "Present"
            Key       = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
            ValueName = "AllowDevelopmentWithoutDevLicense"
            ValueData = "1"
            ValueType = "Dword"
        }
    }
}