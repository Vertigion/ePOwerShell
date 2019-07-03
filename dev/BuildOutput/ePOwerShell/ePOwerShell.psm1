Class ePOComputer {
    [System.Int32]    $ParentID
    [System.String]   $ComputerName
    [System.String]   $Description
    [System.String]   $SystemDescription
    [System.String]   $TimeZone
    [System.String]   $DefaultLangID
    [System.String]   $UserName
    [System.String]   $DomainName
    [System.String]   $IPHostName
    [System.String]   $IPV6
    [System.String]   $IPAddress
    [System.String]   $IPSubnet
    [System.String]   $IPSubnetMask
    [System.String]   $IPV4x
    [System.String]   $IPXAddress
    [System.String]   $SubnetAddress
    [System.String]   $SubnetMask
    [System.String]   $NetAddress
    [System.String]   $OSType
    [System.String]   $OSVersion
    [System.String]   $OSServicePackVer
    [System.String]   $OSBuildNum
    [System.String]   $OSPlatform
    [System.String]   $OSOEMID
    [System.String]   $CPUType
    [System.String]   $CPUSpeed
    [System.String]   $NumOfCPU
    [System.String]   $CPUSerialNum
    [System.Double]   $TotalPhysicalMemory
    [System.Double]   $FreeMemory
    [System.Double]   $FreeDiskSpace
    [System.Double]   $TotalDiskSpace
    [System.Boolean]  $IsPortable
    [System.Boolean]  $Vdi
    [System.String]   $OSBitMode
    [System.String]   $LastAgentHandler
    [System.String]   $UserProperty1
    [System.String]   $UserProperty2
    [System.String]   $UserProperty3
    [System.String]   $UserProperty4
    [System.String]   $UserProperty5
    [System.String]   $UserProperty6
    [System.String]   $UserProperty7
    [System.String]   $UserProperty8
    [System.String]   $SysvolFreeSpace
    [System.String]   $SysvolTotalSpace
    [System.String[]] $Tags
    [System.String[]] $ExcludedTags
    [System.DateTime] $LastUpdate
    [System.Boolean]  $ManagedState
    [System.Guid]     $AgentGUID
    [System.Version]  $AgentVersion
    [System.String]   $AutoID
}
Class ePOConfig {
    [System.String] $Server
    [System.Management.Automation.PSCredential] $Credentials
    [System.Int32] $Port
    [System.Boolean] $AcceptSelfSignedCerts
}
Class ePOGroup {
    [System.String] $Name
    [System.Int32]  $ID

    ePOGroup([String]$Name, [Int32] $ID) {
        $This.Name = $Name
        $This.ID   = $ID
    }
}
Class ePOHelp {
    [System.String]    $CommandName
    [System.String[]]  $Parameters
    [System.String]    $Description
}
Class ePOQuery {
    [System.Int32]      $ID
    [System.String]     $Name
    [System.String]     $Description
    [System.String]     $CreatedBy
    [System.DateTime]   $CreatedOn
    [System.String]     $ModifiedBy
    [System.DateTime]   $ModifiedOn
    [System.String]     $ConditionSexp
    [System.String]     $DatabaseType
    [System.String]     $GroupName
    [System.String]     $Target
    [System.String]     $UserName
}
Class ePORecoveryKey {
    [System.String] $ComputerName
    [System.String] $DriveLetter
    [System.String] $RecoveryKey

    ePORecoveryKey([System.String] $ComputerName, [System.String] $DriveLetter, [System.String] $RecoveryKey) {
        $this.ComputerName = $ComputerName
        $this.DriveLetter = $DriveLetter
        $this.RecoveryKey = $RecoveryKey
    }
}
Class ePOTable {
    [System.String]     $Name
    [System.String]     $Target
    [System.String]     $Type
    [System.String]     $DatabaseType
    [System.String]     $Description
    [System.String[]]   $RelatedTables
    [ePOColumn[]]       $Columns
}

Class ePOColumn {
    [System.String]     $Name
    [System.String]     $Type
    [System.Boolean]    $Select
    [System.Boolean]    $Condition
    [System.Boolean]    $GroupBy
    [System.Boolean]    $Order
    [System.Boolean]    $Number
}
Class ePOTag {
    [System.String] $Name
    [System.Int32]  $ID
    [System.String] $Description

    ePOTag([String] $Name, [Int32] $ID, [String] $Description) {
        $this.Name = $Name
        $this.ID = $ID
        $this.Description = $Description
    }
}
function ConvertTo-ePOComputer {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, Mandatory = $True)]
        [PSCustomObject]
        $ePOComputer
    )

    $ePOComputerObject = [ePOComputer]::new()

    $ePOComputerObject.ParentID = $ePOComputer.'EPOComputerProperties.ParentID'
    $ePOComputerObject.ComputerName = $ePOComputer.'EPOComputerProperties.ComputerName'
    $ePOComputerObject.Description = $ePOComputer.'EPOComputerProperties.Description'
    $ePOComputerObject.SystemDescription = $ePOComputer.'EPOComputerProperties.SystemDescription'
    $ePOComputerObject.TimeZone = $ePOComputer.'EPOComputerProperties.TimeZone'
    $ePOComputerObject.DefaultLangID = $ePOComputer.'EPOComputerProperties.DefaultLangID'
    $ePOComputerObject.UserName = $ePOComputer.'EPOComputerProperties.UserName'
    $ePOComputerObject.DomainName = $ePOComputer.'EPOComputerProperties.DomainName'
    $ePOComputerObject.IPHostName = $ePOComputer.'EPOComputerProperties.IPHostName'
    $ePOComputerObject.IPV6 = $ePOComputer.'EPOComputerProperties.IPV6'
    $ePOComputerObject.IPAddress = $ePOComputer.'EPOComputerProperties.IPAddress'
    $ePOComputerObject.IPSubnet = $ePOComputer.'EPOComputerProperties.IPSubnet'
    $ePOComputerObject.IPSubnetMask = $ePOComputer.'EPOComputerProperties.IPSubnetMask'
    $ePOComputerObject.IPV4x = $ePOComputer.'EPOComputerProperties.IPV4x'
    $ePOComputerObject.IPXAddress = $ePOComputer.'EPOComputerProperties.IPXAddress'
    $ePOComputerObject.SubnetAddress = $ePOComputer.'EPOComputerProperties.SubnetAddress'
    $ePOComputerObject.SubnetMask = $ePOComputer.'EPOComputerProperties.SubnetMask'
    $ePOComputerObject.NetAddress = $ePOComputer.'EPOComputerProperties.NetAddress'
    $ePOComputerObject.OSType = $ePOComputer.'EPOComputerProperties.OSType'
    $ePOComputerObject.OSVersion = $ePOComputer.'EPOComputerProperties.OSVersion'
    $ePOComputerObject.OSServicePackVer = $ePOComputer.'EPOComputerProperties.OSServicePackVer'
    $ePOComputerObject.OSBuildNum = $ePOComputer.'EPOComputerProperties.OSBuildNum'
    $ePOComputerObject.OSPlatform = $ePOComputer.'EPOComputerProperties.OSPlatform'
    $ePOComputerObject.OSOEMID = $ePOComputer.'EPOComputerProperties.OSOEMID'
    $ePOComputerObject.CPUType = $ePOComputer.'EPOComputerProperties.CPUType'
    $ePOComputerObject.CPUSpeed = $ePOComputer.'EPOComputerProperties.CPUSpeed'
    $ePOComputerObject.NumOfCPU = $ePOComputer.'EPOComputerProperties.NumOfCPU'
    $ePOComputerObject.CPUSerialNum = $ePOComputer.'EPOComputerProperties.CPUSerialNum'
    $ePOComputerObject.TotalPhysicalMemory = ([Math]::Round($ePOComputer.'EPOComputerProperties.TotalPhysicalMemory'/1GB))
    $ePOComputerObject.FreeMemory = ([Math]::Round($ePOComputer.'EPOComputerProperties.FreeMemory'/1GB))
    $ePOComputerObject.FreeDiskSpace = ([Math]::Round($ePOComputer.'EPOComputerProperties.FreeDiskSpace'/1GB))
    $ePOComputerObject.TotalDiskSpace = ([Math]::Round($ePOComputer.'EPOComputerProperties.TotalDiskSpace'/1GB))
    $ePOComputerObject.IsPortable = $ePOComputer.'EPOComputerProperties.IsPortable'
    $ePOComputerObject.Vdi = $ePOComputer.'EPOComputerProperties.Vdi'
    $ePOComputerObject.OSBitMode = $ePOComputer.'EPOComputerProperties.OSBitMode'
    $ePOComputerObject.LastAgentHandler = $ePOComputer.'EPOComputerProperties.LastAgentHandler'
    $ePOComputerObject.UserProperty1 = $ePOComputer.'EPOComputerProperties.UserProperty1'
    $ePOComputerObject.UserProperty2 = $ePOComputer.'EPOComputerProperties.UserProperty2'
    $ePOComputerObject.UserProperty3 = $ePOComputer.'EPOComputerProperties.UserProperty3'
    $ePOComputerObject.UserProperty4 = $ePOComputer.'EPOComputerProperties.UserProperty4'
    $ePOComputerObject.UserProperty5 = $ePOComputer.'EPOComputerProperties.UserProperty5'
    $ePOComputerObject.UserProperty6 = $ePOComputer.'EPOComputerProperties.UserProperty6'
    $ePOComputerObject.UserProperty7 = $ePOComputer.'EPOComputerProperties.UserProperty7'
    $ePOComputerObject.UserProperty8 = $ePOComputer.'EPOComputerProperties.UserProperty8'
    $ePOComputerObject.SysvolFreeSpace = $ePOComputer.'EPOComputerProperties.SysvolFreeSpace'
    $ePOComputerObject.SysvolTotalSpace = $ePOComputer.'EPOComputerProperties.SysvolTotalSpace'
    $ePOComputerObject.Tags = ($ePOComputer.'EPOLeafNode.Tags').Split(',').Trim()
    $ePOComputerObject.ExcludedTags = ($ePOComputer.'EPOLeafNode.ExcludedTags').Split(',').Trim()
    if ($ePOComputer.'EPOLeafNode.LastUpdate') { $ePOComputerObject.LastUpdate = $ePOComputer.'EPOLeafNode.LastUpdate' }
    $ePOComputerObject.ManagedState = $ePOComputer.'EPOLeafNode.ManagedState'
    if ($ePOComputer.'EPOLeafNode.AgentGUID') { $ePOComputerObject.AgentGUID = $ePOComputer.'EPOLeafNode.AgentGUID' }
    if ($ePOComputer.'EPOLeafNode.AgentVersion') { $ePOComputerObject.AgentVersion = $ePOComputer.'EPOLeafNode.AgentVersion' }
    $ePOComputerObject.AutoID = $ePOComputer.'EPOBranchNode.AutoID'

    Write-Output $ePOComputerObject
}
function ConvertTo-ePOQuery {
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, Mandatory = $True)]
        [PSCustomObject]
        $ePOQuery
    )

    $ePOQueryObject = [ePOQuery]::new()

    $ePOQueryObject.ID = $ePOQuery.id
    $ePOQueryObject.Name = $ePOQuery.name
    $ePOQueryObject.Description = $ePOQuery.description
    $ePOQueryObject.ConditionSexp = $ePOQuery.conditionSexp
    $ePOQueryObject.GroupName = $ePOQuery.GroupName
    $ePOQueryObject.UserName = $ePOQuery.userName
    $ePOQueryObject.DatabaseType = $ePOQuery.databaseType
    $ePOQueryObject.CreatedOn = if ($ePOQuery.createdOn) { $ePOQuery.createdOn }
    $ePOQueryObject.CreatedBy = $ePOQuery.createdBy
    $ePOQueryObject.ModifiedOn= if ($ePOQuery.modifiedOn) { $ePOQuery.modifiedOn }
    $ePOQueryObject.ModifiedBy = $ePOQuery.modifiedBy

    Write-Output $ePOQueryObject
}
<#
    .SYNOPSIS
        Called by Set-ePOServer, this function initializes the script scope variable, ePOwerShell,
        which is used to communicate with the ePO server
#>

function Initialize-ePOConfig {
    [CmdletBinding()]
    param (
        <#
            .PARAMETER Server
                URL to the ePO server
        #>
        [Parameter(Mandatory=$True)]
        [System.String]
        $Server,

        <#
            .PARAMETER Credentials
                Credentials with access to the ePO server
        #>
        [Parameter(Mandatory=$True)]
        [System.Management.Automation.PSCredential]
        $Credentials,

        <#
            .PARAMETER Port
                Specifies the port necessary to communicate with the ePO server
        #>
        [System.Int32]
        $Port = 8443,

        <#
            .PARAMETER AllowSelfSignedCerts
                Allows for self signed certs to be accepted while connecting to the ePO server
        #>
        [Switch]
        $AllowSelfSignedCerts
    )

    if (-not ($Server.StartsWith('https://'))) {
        if ($Server.StartsWith('http://')) {
            Write-Verbose 'Server address starts with HTTP. Changing to HTTPS'
            $Server = $Server.Replace('http://', 'https://')
        } else {
            Write-Verbose 'Server address does not start with HTTPS. Changing...'
            $Server = 'https://' + $Server
        }

        Write-Verbose ('Updated server address: {0}' -f $Server)
    }

    $Script:ePOwerShell = @{
        Port            = $Port
        Server          = $Server
        Credentials     = $Credentials
        AllowSelfSigned = $AllowSelfSignedCerts
    }

    try {
        [Void] (Get-ePOHelp)
        Write-Verbose 'Successfully fetched ePOs core.help page'
    } catch {
        Remove-Variable ePOwerShell -Scope Script -Force
        Write-Information $_ -Tags Exception
        Throw $_
    }
}
<#
    .SYNOPSIS
        Builds the request URL to the ePO server, executes the API call, and returns values.
#>

function Invoke-ePORequest {
    [CmdletBinding()]
    [OutputType([PSCustomObject])]
    param (
        <#
            .PARAMETER Name
                Specifies the function name to be used
        #>
        [String]
        $Name,

        <#
            .PARAMETER Query
                Specifies the query parameters to be used against the ePO server
        #>
        [Hashtable]
        $Query = @{}
    )

    if (-not ($Script:ePOwerShell)) {
        try {
            Set-ePOConfig
        } catch {
            Throw [System.Management.Automation.ParameterBindingException] 'ePO Server is not configured yet. Run Set-ePOwerShellServer first!'
        }
    }

    if (-not ($Query.':output' -eq 'json')) {
        [Void] $Query.Add(':output', 'json')
    }

    $URL = '{0}:{1}/remote/{2}' -f $ePOwerShell.Server, $ePOwerShell.Port, $Name

    [System.Collections.ArrayList] $QueryString = @()

    foreach ($Item in $Query.GetEnumerator()) {
        [Void] $QueryString.Add("$($Item.Name)=$($Item.Value)")
    }

    $RequestUrl = ('{0}?{1}' -f $Url, ($QueryString -join '&'))

    Write-Verbose ('Request URL: {0}' -f $RequestUrl)

    if (-not ([Net.ServicePointManager]::SecurityProtocol -eq 'Tls12')) {
        [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor
            [Net.SecurityProtocolType]::Tls12
    }

    $InvokeWebRequest = @{
        Uri             = $RequestUrl
        Credential      = $ePOwerShell.Credentials
        UseBasicParsing = $True
        ErrorAction     = 'Stop'
    }

    if ($Script:ePOwerShell.AllowSelfSignedCerts) {
        if ($PSVersionTable.PSVersion.Major -le 5) {
            Write-Verbose 'PSVersion is -le 5'
            Write-Debug 'Allowing self signed certs'

Add-Type @"
using System.Net;
using System.Security.Cryptography.X509Certificates;
public class TrustAllCertsPolicy : ICertificatePolicy {
    public bool CheckValidationResult(
        ServicePoint srvPoint, X509Certificate certificate,
        WebRequest request, int certificateProblem) {
        return true;
    }
}
"@
            [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
        } else {
            Write-Verbose 'PSVersion is -gt 5'
            [Void] $InvokeWebRequest.Add('SkipCertificateCheck', $True)
        }
    }

    Write-Verbose ('Request: {0}' -f ($InvokeWebRequest | ConvertTo-Json))

    try {
        $Response = Invoke-WebRequest @InvokeWebRequest
    } catch {
        Write-Information $_ -Tags Exception
        Throw $_
    }

    Write-Debug "Response: $($Response | Out-String)"

    if (-not ($Response.Content.StartsWith('OK:'))) {
        Throw $Response
    }

    Write-Output ($Response.Content.Substring(3).Trim() | ConvertFrom-Json)
}
<#
    .SYNOPSIS
        Write the WHERE portion of the ePO custom query.

    .DESCRIPTION
        Write the WHERE portion of the ePO custom query returning the string that's ready to be sent to ePO.

    .EXAMPLE
        ```powershell
        $where = @{
            and = @{
                eq = @{
                    EPOLeafNodeId = 1234
                    ComputerName  = 'CAS-12345'
                }
            }
        }
        Write-ePOWhere $where
        ```

        Output:
        ```
        (and (eq ComputerName CAS-12345) (eq EPOLeafNodeId 1234))
        ```

    .EXAMPLE
        ```powershell
        $where = @{
            or = @{
                eq = @{
                    EPOLeafNodeId = 1234
                    ComputerName = 'CAS-12345'
                }
                ne = @{
                    EPOLeafNodeId = 4321
                }
            }
        }
        Write-ePOWhere $where
        ```

        Output:
        ```
        (or (eq ComputerName CAS-12345) (eq EPOLeafNodeId 1234) (ne EPOLeafNodeId 4321))
        ```

    .EXAMPLE
        ```powershell
        $where = @{
            eq = @{
                EPOLeafNodeId = 1234
            }
        }
        Write-ePOWhere $where
        ```

        Output:
        ```
        (where (eq EPOLeafNodeId 1234))
        ```
#>
function Write-ePOWhere {
    [CmdletBinding()]
    param(
        <#
            .PARAMETER WherePart
                A hashtable of the structure of the WHERE clause. See examples.
        #>
        [Parameter(Mandatory = $true)]
        [hashtable]
        $WherePart,

        <#
            .PARAMETER Parent
                This is really just called when re-calling this function from within itself.
                You probably shouldn't pass this parameter manually.
        #>
        [Parameter()]
        [string]
        $Parent
    )

    foreach ($Part in $WherePart.GetEnumerator()) {
        if ($Part.Value -is [hashtable]) {
            if (@('and', 'or') -contains $Part.Name) {
                $Return += ' ({0} {1})' -f $Part.Name, (Write-ePOWhere $Part.Value -Parent $Part.Name)
            } else {
                $Return += ' {0}' -f (Write-ePOWhere $Part.Value -Parent $Part.Name)
            }
        } else {
            $Value = $Part.Value
            $Return += ' ({0} {1} "{2}")' -f $Parent, $Part.Name, $Value
        }
    }

    while ($Return.Contains('  ')) {
        $Return = $Return.Replace('  ', ' ')
    }
    $Return = $Return.Trim()

    if ((-not $Parent) -and ($Return.StartsWith('(eq') -or $Return.StartsWith('(ne'))) {
        $Return = '(where {0})' -f $Return
    }

    Write-Output $Return
}
<#
    .SYNOPSIS
        Finds available computer systems on the ePO server

    .DESCRIPTION
        Finds all available computer systems from the ePO server. If a computer system name is specifed, it searches for only
        the one computer system from the server. If a computer system is not specified, then it will return a list of all
        available computer systems on the ePO server. You can search for a computer using the Agent Guid, Computer Name,
        MAC Address, IP Address, Tags, and Usernames.

    .EXAMPLE
        Returns all computers in the ePO system
        ```powershell
        $Computer = Get-ePOComputer -All
        ```

    .EXAMPLE
        Returns ePO computer object searching by hostname
        ```powershell
        $Computer = Get-ePOComputer -ComputerName 'Computer1'
        ```

    .EXAMPLE
        Returns ePO computer object searching by hostname with wildcard
        ```powershell
        $Computer = Get-ePOComputer -ComputerName 'Computer*' -ForceWildcardHandling
        ```

    .EXAMPLE
        Returns ePO computer object searching by Agent Guid
        ```powershell
        $Computer = Get-ePOComputer -AgentGuid 5b273b72-977b-4566-9cb4-9af816ac222b
        ```

    .EXAMPLE
        Returns ePO computer object searching by MAC Address
        ```powershell
        $Computer = Get-ePOComputer -MacAddress 00-05-9A-3C-7A-00
        ```

    .EXAMPLE
        Returns ePO computer object searching by IP Address
        ```powershell
        $Computer = Get-ePOComputer -IPAddress 192.168.32.46
        ```

    .EXAMPLE
        Returns ePO computer object searching by Username
        ```powershell
        $Computer = Get-ePOComputer -Username MyUsername
        ```

    .EXAMPLE
        Returns ePO computer objects searching by Tag
        ```powershell
        $Computer = Get-ePOComputer -Tag ePOTag1
        ```
#>

function Get-ePOComputer {
    [CmdletBinding(DefaultParameterSetName = 'All')]
    [Alias('Find-ePOwerShellComputerSystem', 'Find-ePOComputerSystem')]
    [OutputType([System.Object[]])]
    param (
        <#
            .PARAMETER AgentGuid
                Specifies the computers Agent Guid to be found on the ePO server
        #>
        [Parameter(ParameterSetName = 'AgentGuid')]
        $AgentGuid,

        <#
            .PARAMETER Computer
                Specifies a computer system to be found on the ePO server
        #>
        [Parameter(ParameterSetName = 'ComputerName', Position = 1, ValueFromPipeline = $True)]
        [Alias('hostname', 'name', 'computername')]
        $Computer,

        <#
            .PARAMETER ForceWildcardHandling
                Allows for wildcards to be used when searching by computer name
        #>
        [Parameter(ParameterSetName = 'ComputerName')]
        [Switch]
        $ForceWildcardHandling,

        <#
            .PARAMETER MACAddress
                Specifies the computers MAC Address to be found on the ePO server
        #>
        [Parameter(ParameterSetName = 'MACAddress')]
        $MACAddress,

        <#
            .PARAMETER IPAddress
                Specifies the computers IPAddress to be found on the ePO server
        #>
        [Parameter(ParameterSetName = 'IPAddress')]
        $IPAddress,

        <#
            .PARAMETER Tag
                Specifies the tag a computer might have applied to be found on the ePO server
        #>
        [Parameter(ParameterSetName = 'Tag')]
        $Tag,

        <#
            .PARAMETER Username
                Specifies the computers Username to be found on the ePO server
        #>
        [Parameter(ParameterSetName = 'Username')]
        $Username,

        <#
            .PARAMETER All
                Returns all computers in the ePO server
        #>
        [Parameter(ParameterSetName = 'All')]
        [Switch]
        $All
    )

    begin {
        try {
            $Request = @{
                Name  = 'system.find'
                Query = @{
                    searchText = ''
                }
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    process {
        try {
            switch ($PSCmdlet.ParameterSetName) {
                "ComputerName" {
                    $Request.Query.searchText = $Computer
                }

                "MACAddress" {
                    $MACAddress = $MACAddress.ToUpper()

                    switch -Regex ($MACAddress) {
                        '^([0-9a-f]{2}:){5}([0-9a-f]{2})$' {
                            Write-Verbose 'Delimiter: Colons'
                            $MACAddress = $MACAddress.Replace(':', '')
                            break
                        }

                        '^([0-9a-f]{2}-){5}([0-9a-f]{2})$' {
                            Write-Verbose 'Delimiter: Dashs'
                            $MACAddress = $MACAddress.Replace('-', '')
                            break
                        }

                        '^([0-9a-f]{2}\.){5}([0-9a-f]{2})$' {
                            Write-Verbose 'Delimiter: Periods'
                            $MACAddress = $MACAddress.Replace('.', '')
                            break
                        }

                        '^([0-9a-f]{2}\s){5}([0-9a-f]{2})$' {
                            Write-Verbose 'Delimiter: Spaces'
                            $MACAddress = $MACAddress.Replace(' ', '')
                            break
                        }

                        '^([0-9a-f]{12})$' {
                            Write-Verbose 'Delimiter: None'
                            break
                        }

                        default {
                            Throw ('MAC Address does not match known format: {0}' -f $MACAddress)
                        }
                    }

                    $Request.Query.searchText = $MACAddress
                }

                "IPAddress" {
                    $Request.Query.searchText = $IPAddress
                }

                "Tag" {
                    $Request.Query.searchText = $Tag
                }

                "AgentGuid" {
                    $Request.Query.searchText = $AgentGuid
                }

                "Username" {
                    $Request.Query.searchText = $Username
                }

                "All" {
                    $Request.Query.searchText = ''
                }
            }

            if ($PSCmdlet.ParameterSetName -eq 'ComputerName' -and $Computer -is [ePOComputer]) {
                Write-Verbose 'Using pipelined ePOComputer object'
                Write-Output $Computer
            } else {
                Write-Verbose 'Either not pipelined, or pipeline object is not an ePOComputer object'
                $ePOComputers = Invoke-ePORequest @Request

                foreach ($ePOComputer in $ePOComputers) {
                    $ePOComputerObject = ConvertTo-ePOComputer $ePOComputer
                    if ($PSCmdlet.ParameterSetName -eq 'ComputerName') {
                        if ($ForceWildcardHandling) {
                            Write-Output $ePOComputerObject
                        } elseif ($ePOComputer.'EPOComputerProperties.ComputerName' -eq $Computer) {
                            Write-Output $ePOComputerObject
                        }
                    } else {
                        Write-Output $ePOComputerObject
                    }
                }
            }
        } catch {
            Write-Information $_ -Tags Exception
        }
    }

    end {}
}

Export-ModuleMember -Function 'Get-ePOComputer' -Alias 'Find-ePOwerShellComputerSystem', 'Find-ePOComputerSystem'
<#
    .SYNOPSIS
        Returns saved $ePOwerShell settings

    .DESCRIPTION
        Returns an ePOConfig object of the saved information necessary to communicate with the ePO server

    .EXAMPLE
        Returns the currently set configuration for connecting to the ePO server.
        ```powershell
        $Config = Get-ePOConfig
        ```
#>

function Get-ePOConfig {
    [CmdletBinding()]
    [OutputType([Hashtable])]
    [Alias('Get-ePOwerShellServer', 'Get-ePOServer')]
    param ()

    process {
        try {
            if (-not ($Script:ePOwerShell)) {
                Write-Error 'ePO Server is not configured yet. Run Set-ePOConfig first' -ErrorAction Stop
            }

            Write-Output $Script:ePOwerShell
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }
}

Export-ModuleMember 'Get-ePOConfig' -Alias 'Get-ePOwerShellServer', 'Get-ePOServer'
<#
    .SYNOPSIS
        Finds available groups on the ePO server

    .DESCRIPTION
        Finds all available groups from the ePO server as an ePOGroup object. If a group name is specifed,
        it searches for only the one group from the server. If a group is not specified, then it will
        return a list of all available groups on the ePO server.

    .EXAMPLE
        Returns array of ePOGroup objects containing group information
        ```powershell
        $Groups = Get-ePOGroup
        ```

    .EXAMPLE
        Returns array of ePOGroup objects containing requested group information with matching group name
        ```powershell
        $Groups = Get-ePOGroup 'Group1'
        ```

    .EXAMPLE
        Returns array of ePOGroup objects containing requested group information with matching group name by wildcard
        ```powershell
        $Groups = Get-ePOGroup 'Group*' -ForceWildcardHandling
        ```
#>

function Get-ePOGroup {
    [CmdletBinding()]
    [Alias('Find-ePOwerShellGroups','Find-ePOGroups')]
    [OutputType([System.Object[]])]
    param (
        <#
            .PARAMETER Group
                Specifies a group name to be found on the ePO server. This parameter can be provider by either:

                    * an ePOGroup object
                    * a group name

                This parameter can be passed in from the pipeline.
        #>
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [Alias('GroupName')]
        $Group = '',

        <#
            .PARAMETER ForceWildcardHandling
                Allows for wildcards to be used when searching by group name
        #>
        [Switch]
        $ForceWildcardHandling
    )

    begin {}

    process {
        try {
            if ($Group -is [ePOGroup]) {
                Write-Output $Group
            } else {
                $Request = @{
                    Name  = 'system.findGroups'
                    Query = @{
                        searchText = $Group
                    }
                }

                Write-Debug "Request: $($Request | ConvertTo-Json)"
                $ePOGroups = Invoke-ePORequest @Request

                foreach ($ePOGroup in $ePOGroups) {
                    $GroupObject = [ePOGroup]::new($ePOGroup.groupPath, $ePOGroup.groupId)
                    Write-Output $GroupObject
                }
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    end {}
}

Export-ModuleMember -Function Get-ePOGroup -Alias 'Find-ePOwerShellGroups','Find-ePOGroups'
<#
    .SYNOPSIS
        Returns members of a specified ePO group

    .DESCRIPTION
        This function returns an array of ePOComputer objects for each computer in the specified ePO group. If the `$Recurse`
        parameter is specified, then all subgroups are included in the search as well.

    .EXAMPLE
        Get group members of a single group
        ```powershell
        $Group = Get-ePOGroup -Group 'Group1'
        $GroupMembers = Get-ePOGroupMember -Group $Group
        ```

    .EXAMPLE
        Get group members from a pipeline
        ```powershell
        $GroupMembers = Get-ePOGroup -Group 'Group1' | Get-ePOGroupMember
        ```

    .EXAMPLE
        Recursively get group members from a pipeline
        ```powershell
        $GroupMembers = Get-ePOGroup -Group 'Group1' | Get-ePOGroupMember -Recurse
        ```
#>

function Get-ePOGroupMember {
    [CmdletBinding()]
    param (
        <#
            .PARAMETER Group
                Specifies the group we want to search for group members. This parameter can be provided as either:

                    * An ePOGroup object
                    * A group name

                This parameter can be passed in from the pipeline
        #>
        [Parameter(Position = 0, ValueFromPipeline = $True, Mandatory = $True)]
        $Group,

        <#
            .PARAMETER Recurse
                Include members in all subgroups
        #>
        [Switch]
        $Recurse
    )

    begin {
        if ($Group) {
            $Group = $Group.Split(',').Trim()
        }
    }

    process {
        try {
            foreach ($GroupItem in $Group) {
                $Request = @{
                    Name  = 'epogroup.findSystems'
                    Query = @{}
                }

                if ($GroupItem -is [ePOGroup]) {
                    [Void] $Request.Query.Add('groupId', $GroupItem.ID)
                } else {
                    [Void] $Request.Query.Add('groupId', $GroupItem)
                }

                if ($Recurse) {
                    [Void] $Request.Query.Add('searchSubgroups', 'true')
                }

                Write-Debug "Request: $($Request | ConvertTo-Json)"
                $ePOGroupMembers = Invoke-ePORequest @Request

                foreach ($ePOGroupMember in $ePOGroupMembers) {
                    $ePOGroupMemberObject = ConvertTo-ePOComputer $ePOGroupMember
                    Write-Output $ePOGroupMemberObject
                }
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    end {}
}

Export-ModuleMember -Function 'Get-ePOGroupMember'
<#
    .SYNOPSIS
        Fetchs and returns the content from ePOs core.help menu.

    .DESCRIPTION
        Fetches all commands from the ePOs core.help menu. If a command is specified, the function will
        only return a single command. Each command is converted to an ePOHelp object containing 3 values:

            * Command
            * Parameters
            * Description

        The function will then return an array containing all ePOHelp objects.

    .EXAMPLE
        Get all help objects on the ePO servers core.help page.
        ```powershell
        $Help = Get-ePOHelp
        ```

    .EXAMPLE
        Get a single help object from the ePO servers core.help page.
        ```powershell
        $FindHelp = Get-ePOHelp -Command 'system.find'
        ```
#>

function Get-ePOHelp {
    [CmdletBinding()]
    [Alias('Get-ePOwerShellCoreHelp', 'Get-ePOCoreHelp')]
    param (
        <#
            .PARAMETER Command
                Specifies a command the be queried from the ePO server
        #>
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        $Command
    )

    begin {
        try {
            $Request = @{
                Name = 'core.help'
            }

            if ($Command) {
                $Request.Add('Query', @{})
                if ($Command -is [ePOHelp]) {
                    $Request.Query.Add('Command', $Command.CommandName)
                } else {
                    $Request.Query.Add('Command', $Command)
                }
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    process {
        try {
            $Response = Invoke-ePORequest @Request

            foreach ($Item in $Response) {
                $HelpObject = [ePOHelp]::new()
                $Item = $Item -replace '\r\n', ' '

                $FirstRegexProduct = [Regex]::Match($Item, '^(\S+)\s(.*)$')
                $HelpObject.CommandName = $FirstRegexProduct.Groups[1].Value
                $Remainder = $FirstRegexProduct.Groups[2].Value

                if ($Remainder -match '^\-.*') {
                    $Remainder = $Remainder.TrimStart('- ')
                }

                if ($Remainder -match '\s\-\s') {
                    $SecondRegexProduct = [Regex]::Match($Remainder, '(^\S+.{0,})\s\-\s(\S+.{0,})$')

                    $HelpObject.Parameters = ($SecondRegexProduct.Groups[1].Value -Split ' ').Trim('[').Trim(']')
                    $HelpObject.Description = $SecondRegexProduct.Groups[2].Value
                } else {
                    $HelpObject.Description = $Remainder
                }

                Write-Output $HelpObject
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    end {}
}

Export-ModuleMember -Function 'Get-ePOHelp' -Alias 'Get-ePOwerShellCoreHelp', 'Get-ePOCoreHelp'
<#
    .SYNOPSIS
        Finds available predefined queries on the ePO server.

    .DESCRIPTION
        Finds all available queries from the ePO server. Each query is then converted to an ePOQuery object,
        and an array containing all objects will be returned.

    .EXAMPLE
        Get all predefined queries in ePO
        ```powershell
        $Queries = Get-ePOQuery
        ```
#>

function Get-ePOQuery {
    [CmdletBinding()]
    [Alias('Get-ePOwerShellQueries', 'Get-ePOQueries')]
    param ()

    begin {
        try {
            $Request = @{
                Name  = 'core.listQueries'
                Query = @{}
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    process {
        try {
            Write-Verbose "Request: $($Request | ConvertTo-Json)"
            if (-not ($ePOQueries = Invoke-ePORequest @Request)) {
                Throw "Failed to find any ePO queries"
            }

            foreach ($ePOQuery in $ePOQueries) {
                $ePOQueryObject = ConvertTo-ePOQuery $ePOQuery
                Write-Output $ePOQueryObject
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    end {}
}

Export-ModuleMember -Function 'Get-ePOQuery' -Alias 'Get-ePOwerShellQueries', 'Get-ePOQueries'
<#
    .SYNOPSIS
        Returns the MNE Recovery Key for specified encrypted systems

    .DESCRIPTION
        For the provided computer(s), this will query the ePO servers to find all of the encrypted volumes.
        For each volume, it collects the mount point and the volume serial number stored in ePO. For each of
        the encrypted volumes, it queries for a recovery key. The problem with only querying against the ePO
        Leaf Node ID is that it only returns a recovery key for the systems boot volume. If the system has
        additional mounted drives that are also encrypted, it does not return these keys.

        This function outputs an array of ePORecoveryKey objects containing the computer name, mount point,
        and recovery key.

    .EXAMPLE
        Fetch the recovery key for a system:
        ```powershell
        $RecoveyKey = Get-ePORecoveryKey -Computer 'My-ComputerName'
        ```
#>

function Get-ePORecoveryKey {
    [CmdletBinding(DefaultParametersetname = 'Computer')]
    [Alias('Get-ePOwerShellMneRecoveryKey', 'Get-ePOMneRecoveryKey')]
    [OutputType([System.Object[]])]
    param (
        <#
            .PARAMETER Computer
                Specifies the computer we're finding the recovery key for. Can be provided as:

                    * An ePOComputer object
                    * A computer name

                This parameter can be passed in from the pipeline.
        #>
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
        [Alias('ComputerName', 'Name')]
        $Computer
    )

    begin {
        try {
            $Request = @{
                Name        = 'mne.recoverMachine'
                Query       = @{
                    serialNumber = ''
                }
                ErrorAction = 'Stop'
            }

            if ($Computer) {
                $Computer = $Computer.Split(',').Trim()
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    process {
        foreach ($Comp in $Computer) {
            if ($Comp -is [ePOComputer]) {
                Write-Verbose 'Computer is an ePOComputer object'
                $CompResponse = $Comp
            } else {
                Write-Verbose 'Computer is not an ePOComputer object. Searching for...'
                $CompResponse = Get-ePOComputer -Computer $Comp -ErrorAction Stop
            }

            foreach ($Item in $CompResponse) {
                $QueryRequest = @{
                    Table       = 'MneVolumes'
                    Select      = @(
                        'MneFvRecoveryKeys.DisplayName',
                        'MneVolumes.MountPoint'
                    )
                    Where       = @{
                        eq = @{
                            'MneVolumes.EPOLeafNodeId' = $Item.ParentID
                        }
                    }
                    ErrorAction = 'Stop'
                }

                try {
                    $MountPoints = Invoke-ePOQuery @QueryRequest
                } catch {
                    Write-Warning ('Failed to find mount points for {0}' -f $Item.ComputerName)
                    continue
                }

                foreach ($MountPoint in $MountPoints) {
                    Write-Verbose ('Getting recovery key for mount point: {0}' -f $MountPoint.'MneFvRecoveryKeys.DisplayName')
                    $Request.Query.serialNumber = $MountPoint.'MneFvRecoveryKeys.DisplayName'

                    $RecoveryKey = Invoke-ePORequest @Request
                    $RecoveryKeyObject = [ePORecoveryKey]::new($Item.ComputerName, $MountPoint.'MneVolumes.MountPoint', $RecoveryKey)
                    Write-Output $RecoveryKeyObject
                }
            }
        }
    }

    end {}
}

Export-ModuleMember -Function 'Get-ePORecoveryKey' -Alias 'Get-ePOwerShellMneRecoveryKey', 'Get-ePOMneRecoveryKey'
<#
.SYNOPSIS

    Finds available queries on the ePO server

.DESCRIPTION

    Finds all available queries from the ePO server.

.EXAMPLE

    Get-ePOTable

#>

function Get-ePOTable {
    [CmdletBinding()]
    param ()

    begin {
        try {
            $Request = @{
                Name  = 'core.listTables'
                Query = @{}
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    process {
        try {
            Write-Verbose "Request: $($Request | ConvertTo-Json)"
            if (-not ($ePOTables = Invoke-ePORequest @Request)) {
                Write-Error "Failed to find any ePO queries"
            }

            foreach ($ePOTable in $ePOTables) {
                Write-Output $ePOTable
            }
        } catch {
            Write-Information $_ -Tags Exception
        }
    }

    end {}
}

Export-ModuleMember -Function 'Get-ePOTable'
<#
    .SYNOPSIS
        Finds available tags on the ePO server

    .DESCRIPTION
        Finds all available tags from the ePO server. If a tag name is specifed, it searches for only
        the one tag from the server. If a tag is not specified, then it will return an array of ePOTag
        objects from the ePO server. Each tag contains an ID, Name, and Description.

    .EXAMPLE
        Get all tags from the ePO server
        ```powershell
        $Tags = Get-ePOTag
        ```

    .EXAMPLE
        Get a single tag from the ePO server
        ```powershell
        $Tag = Get-ePOTag 'Tag1'
        ```
#>

function Get-ePOTag {
    [CmdletBinding()]
    [Alias('Find-ePOwerShellTag','Find-ePOTag')]
    [OutputType([System.Object[]])]
    param (
        <#
            .PARAMETER Tag
                This parameter is used to request a specific tag. This can be provided as:

                    * An ePOTag object
                    * A tag name

                This value can be passed in from the pipeline.
        #>
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [Alias('TagName')]
        $Tag = ''
    )

    begin {}

    process {
        try {
            if ($Tag -is [ePOTag]) {
                Write-Verbose 'Using pipelined ePOTag object'
                Write-Output $Tag
            } else {
                Write-Verbose 'Either not pipelined, or pipeline object is not an ePOTag object'
                $Request = @{
                    Name  = 'system.findTag'
                    Query = @{
                        searchText = $Tag
                    }
                }

                Write-Debug "Request: $($Request | ConvertTo-Json)"
                $ePOTags = Invoke-ePORequest @Request

                foreach ($ePOTag in $ePOTags) {
                    if (-not ($Tag) -or ($Tag -eq $ePOTag.tagName)) {
                        $TagObject = [ePOTag]::new($ePOTag.tagName, $ePOTag.tagId, $ePOTag.tagNotes)
                        Write-Output $TagObject
                    }
                }
            }
        } catch {
            Write-Information $_ -Tags Exception
        }
    }

    end {}
}

Export-ModuleMember -Function 'Get-ePOTag' -Alias 'Find-ePOwerShellTag','Find-ePOTag'
<#
    .SYNOPSIS
        Returns the ePO version
#>

function Get-ePOVersion {
    [CmdletBinding()]
    [OutputType([System.String])]
    param ()

    begin {}
    process {
        try {
            $Request = @{
                Name = 'epo.getVersion'
            }

            Write-Debug "Request: $($Request | ConvertTo-Json)"
            if (-not ($Response = Invoke-ePORequest @Request)) {
                Throw 'Failed to determine ePO version'
            }

            Write-Output ($Response -as [System.Version])
        } catch {
            Write-Information $_ -Tags Exception
        }
    }

    end {}
}

Export-ModuleMember -Function 'Get-ePOVersion'
<#
.SYNOPSIS
    Either runs a predefined query or a custom query against the ePO server

.DESCRIPTION
    Based off the Query Name or ID, runs the query and returns the output.

.EXAMPLE
    Run a predefined query saved on the ePO server:
    ```powershell
    $Query = Get-ePOQuery
    $Query = $Query | Where-Object { $_.Name -eq 'My Awesome Query' }
    $Results = Invoke-ePOQuery -Query $Query
    ```
#>

function Invoke-ePOQuery {
    [CmdletBinding()]
    [Alias('Invoke-ePOwerShellQuery')]
    param (
        <#
            Specifies a predefined query that is stored on the ePO server. Can be provided by:

                * An ePOQuery object
                * A query ID
                * A query Name

            This parameter can be passed in from the pipeline.
        #>
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True, ParameterSetName = 'PremadeQuery')]
        $Query,

        <#
            .PARAMETER Table
                Specifies the table on the ePO server you would like to query against. Run Get-ePOTable to see available tables and values.
        #>
        [Parameter(Mandatory = $True, ParameterSetName = 'CustomQuery')]
        [System.String]
        $Table,

        <#
            .PARAMETER Select
                Specifies the items from tables you're specifically looking for. If a table name is not specified in your select string,
                then `$Table` is prepended to the beginning of your select item.
        #>
        [Parameter(Mandatory = $True, ParameterSetName = 'CustomQuery')]
        [System.String[]]
        $Select,

        <#
            .PARAMETER Where
                A hashtable used to limit the query to items meeting only specific criteria
        #>
        [Parameter(Mandatory = $True, ParameterSetName = 'CustomQuery')]
        [HashTable]
        $Where,

        <#
            .PARAMETER Database
                Optional parameter. Specifies a separate database to query, other than the default one.
        #>
        [Parameter(ParameterSetName = 'CustomQuery')]
        [Parameter(ParameterSetName = 'PremadeQuery')]
        [System.String]
        $Database
    )

    begin {
        try {
            switch ($PSCmdlet.ParameterSetName) {
                'PremadeQuery' {
                    $Request = @{
                        Name  = 'core.executeQuery'
                        Query = @{
                            queryId = ''
                        }
                    }
                }

                'CustomQuery' {
                    $Request = @{
                        Name  = 'core.executeQuery'
                        Query = @{
                            target = $Table
                        }
                    }
                }

                Default {
                    Write-Error 'Failed to determine parameter set' -ErrorAction Stop
                }
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    process {
        try {
            foreach ($QueryItem in $Query) {
                switch ($PSCmdlet.ParameterSetName) {
                    'PremadeQuery' {
                        Write-Debug 'Using a premade query'
                        if ($QueryItem -is [ePOQuery]) {
                            Write-Debug 'ePOQuery object specified'
                            $Request.Query.queryId = $QueryItem.ID
                        } elseif ($QueryItem -is [Int32]) {
                            Write-Debug 'Query ID specified'
                            $Request.Query.queryId = $QueryItem
                        } else {
                            Write-Debug 'Query Name specified'

                            if (-not ($ePOQuery = Get-ePOQuery | Where-Object { $_.name -eq $QueryItem })) {
                                Write-Error ('Failed to find a query for: {0}' -f $QueryItem) -ErrorAction Stop
                            }

                            $Request.Query.queryId = $ePOQuery.ID
                        }

                        if ($Database) {
                            [Void] $Request.Query.Add('database', $Database)
                        }
                    }

                    'CustomQuery' {
                        $Select = foreach ($Item in $Select) {
                            if ($Item -Match '^(\S+\.){1,}\S+$') {
                                $Item
                            } else {
                                $Table + '.' + $Item
                            }
                        }

                        $Select = '(select ' + ($Select -Join ' ') + ')'
                        [Void] $Request.Query.Add('select', $Select)

                        if ($Where) {
                            $WhereString = Write-ePOWhere $Where
                            Write-Debug ('Where String: {0}' -f $WhereString)
                            [Void] $Request.Query.Add('where', $WhereString)
                        }
                    }
                }

                Write-Debug "Request: $($Request | ConvertTo-Json)"
                if (-not ($QueryResults = Invoke-ePORequest @Request)) {
                    Throw "Failed to find any ePO query results"
                }

                Write-Debug "Results: $($QueryResults | Out-String)"
                Write-Output $QueryResults
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    end {}
}

Export-ModuleMember -Function 'Invoke-ePOQuery' -Alias 'Invoke-ePOwerShellQuery'
<#
    .SYNOPSIS
        Wakes up the ePO Agent on specified computer

    .DESCRIPTION
        For each specified computer, the ePO server attempts to wake up the computer's agent and run
        policy updates.
#>

function Invoke-ePOWakeUpAgent {
    [CmdletBinding()]
    [Alias('Invoke-ePOwerShellWakeUpAgent')]
    param (
        <#
            .PARAMETER Computer
                Specifies the computer(s) to waking up. Can be provided as:

                    * An ePOComputer object
                    * A computer name

                This parameter can be passed in from the pipeline.
        #>
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
        $ComputerName,

        <#
            .PARAMETER ForceFullPolicyUpdate
                Updates the agent with all polices and properties
        #>
        [Switch]
        $ForceFullPolicyUpdate,

        <#
            .PARAMETER FullProps
                Full properties will be sent by Agent.
        #>
        [Switch]
        $FullProps,

        <#
            .PARAMETER SuperAgent
                Allows you to use a SuperAgent to broadcast wakeup calls to other agents.
        #>
        [Switch]
        $SuperAgent,

        <#
            .PARAMETER AbortAfter
                Specifies total number of minutes it should wait for an agent to respond before it considers the attempt a failure.
        #>
        [int32]
        $AbortAfter = 5,

        <#
            .PARAMETER RetryIntervalSeconds
                Specifies how long it should wait between attempts if the previous attempt to wake up an agent failed.
        #>
        [int32]
        $RetryIntervalSeconds = 30,

        <#
            .PARAMETER NumberOfAttempts
                Specifies how many times the ePO server should attempt to wake up the agent before it deems it a failure.
                Default: 1 attempt
        #>
        [int32]
        $NumberOfAttempts = 1,

        <#
            .PARAMETER RandomMinutes
                Specifies number of minutes to randomise the wakeup calls
                Default: 0 (immediate)
        #>
        [int32]
        $RandomMinutes = 0
    )

    begin {}

    process {
        try {
            foreach ($Computer in $ComputerName) {
                if ($Computer -is [ePOComputer]) {
                    Write-Verbose "Computer was pipelined with an ePOComputer object"
                    $ePOComputer = $Computer
                } else {
                    Write-Verbose "Confirming computer is in ePO: $Computer"

                    if (-not ($ePOComputer = Get-ePOComputer -Computer $Computer)) {
                        Write-Error ("Failed to find computer system '{0}' in ePO" -f $Computer) -ErrorAction Stop
                        continue
                    }
                }

                Write-Verbose ('Found computer system in ePO: {0}' -f ($ePOComputer | Out-String))

                if (-not ($ePOComputer.ManagedState)) {
                    Write-Error ('Computer System is not in a managed state: {0}' -f $Computer) -ErrorAction Stop
                    continue
                }

                Write-Verbose ('Computer System is in a managed state: {0}' -f $Computer)

                $Request = @{
                    Name  = 'system.wakeupAgent'
                    Query = @{
                        names                 = $ePOComputer.ComputerName
                        fullProps             = $FullProps
                        forceFullPolicyUpdate = $ForceFullPolicyUpdate
                        abortAfterMinutes     = $AbortAfter
                        retryIntervalSeconds  = $RetryIntervalSeconds
                        attempts              = $NumberOfAttempts
                        randomMinutes         = $RandomMinutes
                        superAgent            = $SuperAgent
                    }
                }

                Write-Verbose "Request: $($Request | ConvertTo-Json)"
                $Response = Invoke-ePORequest @Request

                $Results = @{}
                foreach ($Item in (($Response | ConvertTo-Json).Split('\n').Replace('"', ''))) {
                    if ($Item) {
                        $ItemName = ($Item.Split(':')[0].Trim())
                        $ItemResults = ([Boolean]($Item.Split(':')[1].Trim() -as [Int]))
                        $Results.Add($ItemName, $ItemResults)
                    }
                }

                if ($Results.Completed) {
                    Write-Verbose ('Successfully woke up {0}' -f $ePOComputer.ComputerName)
                } elseif ($Results.Failed) {
                    Throw ('Failed to wake up {0}' -f $ePOComputer.ComputerName)
                } elseif ($Results.Expired) {
                    Throw ('Failed to wake up {0}. Session expired.' -f $ePOComputer.ComputerName)
                } else {
                    Throw ('Failed to wake up {0}. Unknown error' -f $ePOComputer.ComputerName)
                }
            }
        } catch {
            Write-Error $_
        }
    }

    end {}
}

Export-ModuleMember -Function 'Invoke-ePOWakeUpAgent' -Alias 'Invoke-ePOwerShellWakeUpAgent'
<#
    .SYNOPSIS
        Removes tags from computers managed in ePO

    .DESCRIPTION
        Using the supplied ComputerName(s) and TagName(s), we can remove the tag to the computers
        specified. Tags or Computers can be passed in through the pipeline, but not both at the same time.

    .EXAMPLE
        Remove a single tag on a single computer
        ```powershell
        $Tag = Get-ePOTag -Tag 'Tag1'
        $Computer = Get-ePOComputer -Computer 'Computer1'
        Remove-ePOTag -Computer $Computer -Tag $Tag
        ```

    .EXAMPLE
        Remove one tag on two computers
        ```powershell
        Remove-ePOTag @(Computer1, Computer2) Tag1
        ```

    .EXAMPLE
        Remove two tags to a single computer:
        ```powershell
        Remove-ePOTag Computer1 @(Tag1, Tag2)
        ```
#>

function Remove-ePOTag {
    [CmdletBinding(SupportsShouldProcess = $True, ConfirmImpact = "High")]
    [Alias('Clear-ePOwerShellTag', 'Clear-ePOTag')]
    param (
        <#
            .PARAMETER Computer
                Specifies the name of the computer managed by ePO to have a tag applied to it. This can be provided by:

                    * An ePOComputer object
                    * A computer name

                This parameter can be provided through the pipeline
        #>
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
        [Alias('Computer', 'cn', 'Name')]
        $ComputerName,

        <#
            .PARAMETER Tag
                Specifies the name of the tag to be applied. This can be provided by:

                    * An ePOTag object
                    * A tag name

                This parameter can be provided through the pipeline
        #>
        [Parameter(Mandatory = $True, Position = 1, ValueFromPipeline = $True)]
        [Alias('Tag')]
        $TagName
    )

    begin {
        try {
            $Request = @{
                Name  = 'system.clearTag'
                Query = @{
                    names   = ''
                    tagName = ''
                }
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    process {
        try {
            foreach ($Computer in $ComputerName) {
                foreach ($Tag in $TagName) {
                    if ($Computer -is [ePOComputer]) {
                        $Request.Query.names = $Computer.ComputerName
                    } elseif ($Computer -is [ePOTag]) {
                        $Request.Query.tagName = $Computer.Name
                    } else {
                        $Request.Query.names = $Computer
                    }

                    if ($Tag -is [ePOTag]) {
                        $Request.Query.tagName = $Tag.Name
                    } elseif ($T -is [ePOComputer]) {
                        $Request.Query.names = $Tag.ComputerName
                    } else {
                        $Request.Query.tagName = $Tag
                    }

                    Write-Verbose ('Computer Name: {0}' -f $Request.Query.names)
                    Write-Verbose ('Tag Name: {0}' -f $Request.Query.tagName)

                    if ($PSCmdlet.ShouldProcess("Remove ePO tag $($Request.Query.tagName) from $($Request.Query.names)")) {
                        $Result = Invoke-ePORequest @Request

                        if ($Result -eq 0) {
                            Write-Verbose ('Tag [{0}] is already cleared from computer {1}' -f $Tag, $Computer)
                        } elseif ($Result -eq 1) {
                            Write-Verbose ('Successfully cleared tag [{0}] to computer {1}' -f $Tag, $Computer)
                        } else {
                            Write-Error ('Unknown response while clearing tag [{0}] from {1}: {2}' -f $Tag, $Computer, $Result)
                        }
                    }
                }
            }
        } catch {
            Write-Information $_ -Tags Exception
        }
    }

    end {}
}

Export-ModuleMember -Function 'Remove-ePOTag' -Alias 'Clear-ePOwerShellTag', 'Clear-ePOTag'
<#
    .SYNOPSIS
        Required command. Sets the necessary parameters to successfully communicate with an ePO server

    .DESCRIPTION
        This function sets up all information necessary to communicate with your ePO server.

        There are three ways to utilize this command: By manually specifying the variables each time you
        load the module, saving a json file on your computer with the necessary information, or saving the
        json as an environment variable, $env:ePOwerShell.

    .EXAMPLE
        Set ePO config after reading settings from an Environment variable
        ```powershell
        $env:ePOwerShell = @{
            Server      = 'My-ePO-Server.domain.com'
            Port        = 1234
            Credentials = (Get-Credential)
        }

        Set-ePOConfig
        ```
    .EXAMPLE
        Set ePO config by manually specifying values each time
        ```powershell
        Set-ePOConfig -Server 'My-ePO-Server.domain.com' -Port 1234 -Credentials (Get-Credential)
        ```
#>

function Set-ePOConfig {
    [CmdletBinding(DefaultParameterSetName = 'Env', SupportsShouldProcess = $True)]
    [Alias('Set-ePOServer')]
    param (
        <#
            .PARAMETER Server
                URL to the ePO server
        #>
        [Parameter(Mandatory = $True, ParameterSetName = 'ManualEntry')]
        [String]
        $Server,

        <#
            .PARAMETER Credentials
                Credentials with access to the ePO server
        #>
        [Parameter(Mandatory = $True, ParameterSetName = 'ManualEntry')]
        [System.Management.Automation.PSCredential]
        $Credentials,

        <#
            .PARAMETER Port
                Specifies the port necessary to communicate with the ePO server
        #>
        [Parameter(Mandatory = $False, ParameterSetName = 'ManualEntry')]
        [Int]
        $Port,

        <#
            .PARAMETER AllowSelfSignedCerts
                Specifies if you'd like to allow ePOwerShell to allow self signed certificates on the ePO server
        #>
        [Switch]
        $AllowSelfSignedCerts = ($Script:ePOwerShell.AllowSelfSignedCerts),

        <#
            .PARAMETER ePOwerShellSettings
                Specifies a path to a json containing all information necessary to connect to an ePO server
        #>
        [Parameter(ParameterSetName = 'Env')]
        [String]
        $ePOwerShellSettings = (${env:ePOwerShell})
    )

    Write-Debug "PSCmdlet.ParameterSetName: $($PSCmdlet.ParameterSetName)"
    Write-Debug "ePOwerShellSettings: $ePOwerShellSettings"
    if (
        (-not ($PSCmdLet.ParameterSetName -Contains 'ManualEntry')) -and
        (-not ($ePOwerShellSettings))
    ) {
        Throw "Unable to set ePOwerShell server information. Either set '`$env:ePOwerShell', or re-run the command and specify all necessary information"
    }
    Write-Debug "Found something"

    switch ($PSCmdLet.ParameterSetName) {
        'Env' {
            if (Test-Path $ePOwerShellSettings) {
                Write-Debug "This is a filepath too a json"
                Write-Debug "FilePath: $ePOwerShellSettings"
                try {
                    $Settings = Get-Content $ePOwerShellSettings | Out-String | ConvertFrom-Json
                } catch {
                    Throw "Failed to import existing Json: $($_.Exception)"
                }
            } else {
                Write-Debug "This is a stored json in env"
                try {
                    $Settings = $ePOwerShellSettings | ConvertFrom-Json
                } catch {
                    Throw "Failed to import existing Json: $($_.Exception)"
                }
            }

            Write-Debug "Settings: $($Settings | Out-String)"

            $GetCredentials = @{
                TypeName     = 'System.Management.Automation.PSCredential'
                ArgumentList = @(
                    $Settings.Username,
                    ($Settings.Password | ConvertTo-SecureString)
                )
            }

            $Credentials = New-Object @GetCredentials

            $ePOwerShellVariables = @{
                Server      = $Settings.Server
                Credentials = $Credentials
            }

            if ($settings.Port) {
                [void]$ePOwerShellVariables.Add("Port", $Settings.Port)
            }
        }
        'ManualEntry' {
            $ePOwerShellVariables = @{
                Server               = $Server
                Credentials          = $Credentials
                AllowSelfSignedCerts = $AllowSelfSignedCerts
            }

            if ($Port) {
                [void]$ePOwerShellVariables.Add("Port", $Port)
            }
        }
    }

    Write-Debug "Variables: $($ePOwerShellVariables | Out-String)"

    if ($PSCmdlet.ShouldProcess("Settings ePOwerShell configurations successfully")) {
        Initialize-ePOConfig @ePOwerShellVariables
    }
}

Export-ModuleMember -Function 'Set-ePOConfig' -Alias 'Set-ePOServer'
<#
    .SYNOPSIS
        Applies tags to computers managed in ePO

    .DESCRIPTION
        Using the supplied ComputerName(s) and TagName(s), we can apply the tag to the computers
        specified. Tags or Computers can be passed in through the pipeline, but not both at the same time.

    .EXAMPLE
        Set a single tag on a single computer
        ```powershell
        $Tag = Get-ePOTag -Tag 'Tag1'
        $Computer = Get-ePOComputer -Computer 'Computer1'
        Set-ePOwerShellTag -Computer $Computer -Tag $Tag
        ```

    .EXAMPLE
        Set one tag on two computers
        ```powershell
        Set-ePOwerShellTag @(Computer1, Computer2) Tag1
        ```

    .EXAMPLE
        Set two tags to a single computer:
        ```powershell
        Set-ePOwerShellTag Computer1 @(Tag1, Tag2)
        ```
#>

function Set-ePOTag {
    [CmdletBinding(SupportsShouldProcess = $True, ConfirmImpact = "Medium")]
    [Alias('Set-ePOwerShellTag')]
    param (
        <#
            .PARAMETER ComputerName
                Specifies the name of the computer managed by ePO to have a tag applied to it. This can be provided by:

                    * An ePOComputer object
                    * A computer name

                This parameter can be provided through the pipeline
        #>
        [Parameter(Mandatory = $True, Position = 0, ValueFromPipeline = $True)]
        [Alias('Computer', 'cn')]
        $ComputerName,

        <#
            .PARAMETER Tag
                Specifies the name of the tag to be applied. This can be provided by:

                    * An ePOTag object
                    * A tag name

                This parameter can be provided through the pipeline
        #>
        [Parameter(Mandatory = $True, Position = 1, ValueFromPipeline = $True)]
        [Alias('Tag')]
        $TagName
    )

    begin {
        try {
            $Request = @{
                Name  = 'system.applyTag'
                Query = @{
                    names   = ''
                    tagName = ''
                }
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    process {
        try {
            foreach ($Computer in $ComputerName) {
                foreach ($Tag in $TagName) {
                    if ($Computer -is [ePOComputer]) {
                        $Request.Query.names = $Computer.ComputerName
                    } elseif ($Computer -is [ePOTag]) {
                        $Request.Query.tagName = $Computer.Name
                    } else {
                        $Request.Query.names = $Computer
                    }

                    if ($Tag -is [ePOTag]) {
                        $Request.Query.tagName = $Tag.Name
                    } elseif ($Tag -is [ePOComputer]) {
                        $Request.Query.names = $Tag.ComputerName
                    } else {
                        $Request.Query.tagName = $Tag
                    }

                    Write-Verbose ('Computer Name: {0}' -f $Request.Query.names)
                    Write-Verbose ('Tag Name: {0}' -f $Request.Query.tagName)

                    if ($PSCmdlet.ShouldProcess("Set ePO tag $($Request.Query.tagName) from $($Request.Query.names)")) {
                        $Result = Invoke-ePORequest @Request

                        if ($Result -eq 0) {
                            Write-Verbose ('Tag [{0}] is already cleared from computer {1}' -f $Tag, $Computer)
                        } elseif ($Result -eq 1) {
                            Write-Verbose ('Successfully cleared tag [{0}] to computer {1}' -f $Tag, $Computer)
                        } else {
                            Write-Error ('Unknown response while clearing tag [{0}] from {1}: {2}' -f $Tag, $Computer, $Result) -ErrorAction Stop
                        }
                    }
                }
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    end {}
}

Export-ModuleMember -Function 'Set-ePOTag' -Alias 'Set-ePOwerShellTag'
<#
    .SYNOPSIS
        Updates ePOwerShell config options individually, rather than setting everything at once.

    .DESCRIPTION
        This function sets up all information necessary to communicate with your ePO server.

        There are three ways to utilize this command: By manually specifying the variables each time you
        load the module, saving a json file on your computer with the necessary information, or saving the
        json as an environment variable, $env:ePOwerShell.

    .EXAMPLE
        Update ePOwerShell to target a new server:
        ```powershell
        Update-ePOwerShellServer -Server 'My-ePO-Server.domain.com'
        ```
#>

function Update-ePOConfig {
    [CmdletBinding(SupportsShouldProcess = $True, ConfirmImpact = "Low")]
    [Alias('Update-ePOwerShellServer', 'Update-ePOServer')]
    param (
        <#
            .PARAMETER Server
                URL to the ePO server
        #>
        [System.String]
        $Server = ($Script:ePOwerShell.Server),

        <#
            .PARAMETER Port
                Specifies the port necessary to communicate with the ePO server
        #>
        [System.Int32]
        $Port = ($Script:ePOwerShell.Port),

        <#
            .PARAMETER Credentials
                Credentials with access to the ePO server
        #>
        [System.Management.Automation.PSCredential]
        $Credentials = ($Script:ePOwerShell.Credentials),

        <#
            .PARAMETER AllowSelfSignedCerts
                Specifies if you'd like to allow ePOwerShell to allow self signed certificates on the ePO server
        #>
        [Switch]
        $AllowSelfSignedCerts = ($Script:ePOwerShell.AllowSelfSignedCerts)
    )

    if (-not ($script:ePOwerShell)) {
        Throw "Unable to set ePOwerShell server information. Either set '`$env:ePOwerShell', or run Set-ePOwerShellServer and specify all necessary information"
    }

    $ePOwerShellVariables = @{
        Server               = $Server
        Port                 = $Port
        Credentials          = $Credentials
        AllowSelfSignedCerts = $AllowSelfSignedCerts
    }

    Write-Debug "Variables: $($ePOwerShellVariables | Out-String)"

    if ($PSCmdlet.ShouldProcess("Updating ePOwerShell configurations")) {
        Initialize-ePOConfig @ePOwerShellVariables
    }
}

Export-ModuleMember -Function 'Update-ePOConfig' -Alias 'Update-ePOwerShellServer', 'Update-ePOServer'
