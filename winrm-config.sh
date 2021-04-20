https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html


### WinRM Setup ######
#(PowerShell)

$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)

powershell.exe -ExecutionPolicy ByPass -File $file


winrm enumerate winrm/config/Listener
    # Listener
    #     Address = *
    #     Transport = HTTP
    #     Port = 5985
    #     Hostname
    #     Enabled = true
    #     URLPrefix = wsman
    #     CertificateThumbprint
    #     ListeningOn = 10.0.1.4, 127.0.0.1, ::1, fe80::cef:2aa6:53a5:59ed%3
    #
    # Listener
    #     Address = *
    #     Transport = HTTPS
    #     Port = 5986
    #     Hostname = vm-ts-web01
    #     Enabled = true
    #     URLPrefix = wsman
    #     CertificateThumbprint = AB0BC863FA26DC225904AF61A15C28B47AB69115
    #     ListeningOn = 10.0.1.4, 127.0.0.1, ::1, fe80::cef:2aa6:53a5:59ed%3

winrm enumerate winrm/config/Listener
Listener
    Address = *
    Transport = HTTP
    Port = 5985
    Hostname
    Enabled = true
    URLPrefix = wsman
    CertificateThumbprint
    ListeningOn = 10.0.1.4, 127.0.0.1, ::1, fe80::cef:2aa6:53a5:59ed%3

Listener
    Address = *
    Transport = HTTPS
    Port = 5986
    Hostname = vm-ts-web01
    Enabled = true
    URLPrefix = wsman
    CertificateThumbprint = AB0BC863FA26DC225904AF61A15C28B47AB69115
    ListeningOn = 10.0.1.4, 127.0.0.1, ::1, fe80::cef:2aa6:53a5:59ed%3

winrm get winrm/config/Service
    # Service
    #     RootSDDL = O:NSG:BAD:P(A;;GA;;;BA)(A;;GR;;;IU)S:P(AU;FA;GA;;;WD)(AU;SA;GXGW;;;WD)
    #     MaxConcurrentOperations = 4294967295
    #     MaxConcurrentOperationsPerUser = 1500
    #     EnumerationTimeoutms = 240000
    #     MaxConnections = 300
    #     MaxPacketRetrievalTimeSeconds = 120
    #     AllowUnencrypted = false
    #     Auth
    #         Basic = true
    #         Kerberos = true
    #         Negotiate = true
    #         Certificate = false
    #         CredSSP = false
    #         CbtHardeningLevel = Relaxed
    #     DefaultPorts
    #         HTTP = 5985
    #         HTTPS = 5986
    #     IPv4Filter = *
    #     IPv6Filter = *
    #     EnableCompatibilityHttpListener = false
    #     EnableCompatibilityHttpsListener = false
    #     CertificateThumbprint
    #     AllowRemoteAccess = true

winrm get winrm/config/Winrs
    # Winrs
    #     AllowRemoteShellAccess = true
    #     IdleTimeout = 7200000
    #     MaxConcurrentUsers = 2147483647
    #     MaxShellRunTime = 2147483647
    #     MaxProcessesPerShell = 2147483647
    #     MaxMemoryPerShellMB = 2147483647
    #     MaxShellsPerUser = 2147483647
