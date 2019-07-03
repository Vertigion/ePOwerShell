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