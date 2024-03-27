# Source Guide: https://theitbros.com/powershell-gui-for-scripts/

Add-Type -assembly System.Windows.Forms
$window = New-Object System.Windows.Forms.Form
$window.text = "This is a title"

$window.Width = 500
$window.Height = 500
$window.FormBorderStyle = "FixedSingle"
$window.WindowState = "Maximized"

$Label_example = New-Object System.Windows.Forms.Label
$Label_example.Text = "This is a label"
$Label_example.Location = New-Object System.Drawing.Point(20,10)
$window.Controls.Add($Label_example)

$Textbox_UserSearch = New-Object System.Windows.Forms.TextBox
$Textbox_UserSearch.Location = New-Object System.Drawing.Point(20,30)
$Textbox_UserSearch.Width = 300
$window.Controls.Add($Textbox_UserSearch)

$button_UserSearch = New-Object System.Windows.Forms.Button
$button_UserSearch.Location = New-Object System.Drawing.Point(20,60)
$button_UserSearch.Text = "Search"
$window.Controls.Add($button_UserSearch)

$button_Close = New-Object System.Windows.Forms.Button
$button_Close.Location = New-Object System.Drawing.Point(120,60)
$button_Close.Text = "Close"
$window.Controls.Add($button_Close)



$button_UserSearch.Add_Click(
{
    write-host $Textbox_UserSearch.Text
    
})

$button_Close.Add_Click({
    $window.Close()

})

$window.ShowDialog()

