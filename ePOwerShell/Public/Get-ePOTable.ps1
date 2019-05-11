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
            [System.Collections.ArrayList] $Found = @()

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
            if (-not ($ePOQueries = Invoke-ePORequest @Request)) {
                Throw "Failed to find any ePO queries"
            }

            foreach ($ePOTable in $ePOQueries) {
                [Void] $Found.Add($ePOTable)
            }
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }

    end {
        try {
            Write-Verbose "Results: $($Found | Out-String)"
            Write-Output $Found
        } catch {
            Write-Information $_ -Tags Exception
            Throw $_
        }
    }
}