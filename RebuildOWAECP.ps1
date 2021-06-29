Remove-OwaVirtualDirectory “$env:computername\owa (Default Web Site)”
New-OwaVirtualDirectory  -InternalUrl “https://webmail.vejlebrand.dk/owa” -ExternalUrl “https://webmail.vejlebrand.dk/owa”

Remove-EcpVirtualDirectory -Identity “$env:computername\ecp (Default Web Site)”
New-EcpVirtualDirectory  -InternalUrl “https://webmail.vejlebrand.dk/ecp” -ExternalUrl  “https://webmail.vejlebrand.dk/ecp”

remove-WebApplication -Site "Exchange Back End" -Name owa
remove-WebApplication -Site "Exchange Back End" -Name ecp

New-WebApplication -Site "Exchange Back End" -Name owa -PhysicalPath "C:\Program Files\Microsoft\Exchange Server\V15\ClientAccess\owa" -ApplicationPool MSExchangeOWAAppPool
New-WebApplication -Site "Exchange Back End" -Name ecp -PhysicalPath "C:\Program Files\Microsoft\Exchange Server\V15\ClientAccess\ecp" -ApplicationPool MSExchangeECPAppPool
