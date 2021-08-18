<#
.SYNOPSIS
    Returns first recurring character in a string
.DESCRIPTION
    Takes an arbitrarily long string parameter $foo (e.g. 'abcdedcba') and returns the first recurring character in that Input string.
.EXAMPLE
    PS C:\> 'abcdedcba'
    returns 'd'
.EXAMPLE
    PS C:\> 'Thequickbrownfoxjumpsoverthelazydog'
    returns 'o'
.EXAMPLE
    PS C:\> 'The quick brown fox jumps over the lazy dog'
    returns ' '
.EXAMPLE
    PS C:\> 'The quick brown fox jumps over the lazy dog'
    returns $null and write-warning
.NOTES
    Be mindful of the runtime of your solution.
#>
function Find-FirstRecurringCharacter {
    [CmdletBinding()]
    param (
        # The string to search
        [Parameter(Mandatory)]
        [char[]]$foo
    )
    # Create an empty array to keep track of the characters as they are checked
    $TestArray = @()

    for ($i=0;$i -lt $foo.Length; $i++) {
        $currentChar = $foo[$i]
        # Check to see if we've found the character already
        if ($TestArray -contains $currentChar) {
            # Character already found earlier so return it and exit
            Write-Verbose "First recurring character is '$currentChar'"
            return $currentChar
        } else {
            # Character not found yet, add it to the array 
            $TestArray += $currentChar
        }
    }
    # Use write-warning to allow visual usage to distinguish between unprintable characters vs no match
    Write-Warning 'No recurring characters found'
    return $null
}