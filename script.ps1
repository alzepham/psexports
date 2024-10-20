param (
    [string]$Name,
    [string]$Environment,
    [string]$FilePath = "./output.txt",
    [string]$Department,
    [string]$ProjectName
)

Write-Output "Name: $Name"
Write-Output "Environment: $Environment"
Write-Output "Department: $Department"
Write-Output "Project Name: $ProjectName"

# Function to handle different environments
function Handle-Environment {
    param (
        [string]$Env
    )

    switch ($Env) {
        "development" { Write-Output "You are in the development environment. Proceed with caution." }
        "staging"     { Write-Output "You are in the staging environment. Test thoroughly!" }
        "production"  { Write-Output "You are in the production environment. All changes are live!" }
        "testing"     { Write-Output "You are in the testing environment. Validate all scenarios." }
        "QA"          { Write-Output "You are in the QA environment. Ensure quality assurance." }
        default       { Write-Output "Unknown environment: $Env" }
    }
}

# Error handling
try {
    $result = Handle-Environment -Env $Environment
    $output = @(
        "Name: $Name"
        "Environment: $Environment"
        "Department: $Department"
        "Project Name: $ProjectName"
        $result
        "Script execution completed."
    )
    $output | Out-File -FilePath $FilePath
}
catch {
    Write-Error "An error occurred: $_"
    $errorOutput = "An error occurred: $_"
    $errorOutput | Out-File -FilePath $FilePath
}

Write-Output "Results have been exported to $FilePath"
