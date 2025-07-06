# captainer-discover.ps1
# v1.0 – Captainer FOSS Edition
# Generates human-readable summary and saves key-values to captainer-context.txt

$hostname = $env:COMPUTERNAME
$os = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty Caption
$uptimeRaw = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$uptime = (Get-Date) - $uptimeRaw | Select-Object -ExpandProperty ToString

$cpu = (Get-CimInstance Win32_Processor).Name
$ram = "{0:N2} GB" -f ((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB)
$ipv4 = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "Ethernet*" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty IPAddress) -join ", "
$ipv6 = (Get-NetIPAddress -AddressFamily IPv6 -InterfaceAlias "Ethernet*" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty IPAddress) -join ", "

# Human-readable output
Write-Output "🖥️ Host:        $hostname"
Write-Output "🧠 OS:          $os"
Write-Output "⏱️ Uptime:      $uptime"
Write-Output "🧮 CPU:         $cpu"
Write-Output "🧵 RAM:         $ram"
Write-Output "🌐 IPv4:        $ipv4"
Write-Output "🌐 IPv6:        $ipv6"

# Save context file
"@"
host=$hostname
os=$os
uptime=$uptime
cpu=$cpu
ram=$ram
ipv4=$ipv4
ipv6=$ipv6
"@" | Out-File -FilePath "$env:USERPROFILE\captainer-context.txt" -Encoding UTF8

Write-Output "`n✅ Context saved to $env:USERPROFILE\captainer-context.txt"