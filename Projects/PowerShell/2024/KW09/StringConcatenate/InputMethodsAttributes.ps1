$username = "This is a string"

#A string can act as an array
$username[0]

#Show Dot Notation
$username.Length # Attribute
$username.ToUpper() # Method

#We can see all "Members" (Attributes and methods)
$username | Get-Member

#Methods can have parameters like in java
$username.TrimEnd("string")
$username.Replace("string","dog :)")
$username.EndsWith("g")

# Results get returned to the console by default, we can store it in a variable
$indexOfString = $username.IndexOf("string")
Write-Output $indexOfString
