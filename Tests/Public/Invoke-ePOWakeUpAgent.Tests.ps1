[System.String]    $ProjectDirectoryName = 'ePOwerShell'
[System.String]    $FunctionType         = 'Public'
[IO.FileInfo]      $PesterFile           = [IO.FileInfo] ([System.String] (Resolve-Path -Path $MyInvocation.MyCommand.Path))
[System.String]    $FunctionName         = $PesterFile.Name.Split('.')[0]
[IO.DirectoryInfo] $ProjectRoot          = Split-Path -Parent $PesterFile.Directory

while (-not ($ProjectRoot.Name -eq $ProjectDirectoryName)) {
    $ProjectRoot = Split-Path -Parent $ProjectRoot.FullName
}

[IO.DirectoryInfo] $ExampleDirectory          = Join-Path (Join-Path -Path $ProjectRoot -ChildPath 'Examples' -Resolve) -ChildPath $FunctionType -Resolve
[IO.DirectoryInfo] $ExampleDirectory          = Join-Path $ExampleDirectory.FullName -ChildPath $FunctionName -Resolve
[IO.DirectoryInfo] $Global:ReferenceDirectory = Join-Path $ExampleDirectory.FullName -ChildPath 'References' -Resolve

$Examples = Get-ChildItem $ExampleDirectory -Filter "*.psd1" -File

$Tests = foreach ($Example in $Examples) {
    [hashtable] $Test = @{
        Name = $Example.BaseName.Split('.')[1]
    }

    Write-Verbose "Test: $($Test | ConvertTo-Json)"

    foreach ($ExampleData in (Import-PowerShellDataFile -LiteralPath $Example.FullName).GetEnumerator()) {
        $Test.Add($ExampleData.Name, $ExampleData.Value) | Out-Null
    }

    Write-Verbose "Test: $($Test | ConvertTo-Json)"
    Write-Output $Test
}

Describe $FunctionName {
    foreach ($Global:Test in $Tests) {
        InModuleScope ePOwerShell {
            Mock Invoke-ePORequest {
                $File = Get-ChildItem $ReferenceDirectory.FullName -Filter ('{0}.html' -f $Test.ResultsFile)
                $Content = (Get-Content $File.FullName | Out-String).Substring(3).Trim() | ConvertFrom-Json
                return $Content
            }
            
            Mock Find-ePOwerShellComputerSystem {
                if ($File = Get-ChildItem $ReferenceDirectory.FullName -Filter ('{0}.html' -f $ComputerName)) {
                    return (Get-Content $File.FullName | Out-String).Substring(3).Trim() | ConvertFrom-Json
                }
                return $Null
            }

            Mock Write-Error {
                Throw "SHIT"
            }

            Remove-Variable -Scope 'Script' -Name 'RequestResponse' -Force -ErrorAction SilentlyContinue

            Context $Test.Name {
                [hashtable] $parameters = $Test.Parameters

                if ($Test.Output.Throws) {
                    if ($Test.Pipeline) {
                        It "Invoke-ePOwerShellWakeUpAgent Throws through pipeline" {
                            { $script:RequestResponse = $Parameters.ComputerName | Invoke-ePOwerShellWakeUpAgent } | Should Throw
                        }
                    } else {
                        It "Invoke-ePOwerShellWakeUpAgent Throws" {
                            { $script:RequestResponse = Invoke-ePOwerShellWakeUpAgent @parameters } | Should Throw
                        }
                    }

                    continue
                }

                if ($Test.Pipeline) {
                    It "Invoke-ePOwerShellWakeUpAgent through pipeline" {
                        { $script:RequestResponse = $Parameters.ComputerName | Invoke-ePOwerShellWakeUpAgent } | Should Not Throw
                    }
                } else {
                    It "Invoke-ePOwerShellWakeUpAgent" {
                        { $script:RequestResponse = Invoke-ePOwerShellWakeUpAgent @parameters } | Should Not Throw
                    }
                }
                
                It "Output Type: Null" {
                    $script:RequestResponse | Should BeNullOrEmpty
                }
            }
        }
    }

    Remove-Variable -Scope 'Global' -Name 'Test' -Force -ErrorAction SilentlyContinue
    Remove-Variable -Scope 'Global' -Name 'ReferenceDirectory' -Force -ErrorAction SilentlyContinue
}