# Import ImportExcel module
#Import-Module -Name ImportExcel -Force -Scope CurrentUser

# Function to hash the password
function HashedPassword {
    param(
        [string]$Password
    )

    $mystream = [IO.MemoryStream]::new([byte[]][char[]]$Password)
    $hash = Get-FileHash -InputStream $mystream -Algorithm SHA256
    return $hash.Hash
}

# Function to sign up
function SignUp {
    # Prompt user for username and password
    $username = Read-Host "Enter username"
    $password = Read-Host "Enter password"

    # Hash the password
    $hashedPassword = HashedPassword -Password $password

    # Path to Excel file
    $excelFile = "C:\Users\ninab\BLJ2024NiBis\Projects\PowerShell\2024\KW10\Hashing\AnmeldeDaten.xlsx"

    # Check if Excel file exists, if not, create it with headers
    if (-not (Test-Path $excelFile)) {
        $headers = "Username","Password"
        $headers | Export-Excel -Path $excelFile -AutoSize -AutoFilter -FreezeTopRow -BoldTopRow -Show
    }

    # Add the credentials to the Excel file
    $credentials = [PSCustomObject]@{
        Username = $username
        Password = $hashedPassword
    }
    Add-ExcelWorksheet -Path $excelFile -WorksheetName "Sheet1" -PassThru | Write-ExcelCell -Row 2 -Value $credentials

    Write-Host "User signed up successfully!"
}

# Function to log in
function LogIn {
    # Prompt user for username and password
    $username = Read-Host "Enter username"
    $password = Read-Host "Enter password"

    # Hash the password
    $hashedPassword = HashedPassword -Password $password

    # Path to Excel file
    $excelFile = "C:\Users\ninab\BLJ2024NiBis\Projects\PowerShell\2024\KW10\Hashing\AnmeldeDaten.xlsx"

    # Check if Excel file exists
    if (-not (Test-Path $excelFile)) {
        Write-Host "No users signed up yet!"
        return
    }

    # Load users from Excel file
    $users = Import-Excel -Path $excelFile -WorksheetName "Sheet1" -AsHash

    # Check if user exists and password matches
    $user = $users | Where-Object { $_.Username -eq $username -and $_.Password -eq $hashedPassword }
    if ($user) {
        Write-Host "Login successful!"
    } else {
        Write-Host "Invalid username or password!"
    }
}


# Main menu loop
while ($true) {
    Write-Host "1. Sign Up"
    Write-Host "2. Log In"
    Write-Host "3. Exit"
    $choice = Read
}