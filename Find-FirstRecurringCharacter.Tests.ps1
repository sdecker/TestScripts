Describe "Find-FirstRecurringCharacter" {
    BeforeAll { 
        . $PSScriptRoot/Find-FirstRecurringCharacter.ps1
    }
        It "Has the required parameter and type" {
            Get-Command "Find-FirstRecurringCharacter" | Should -HaveParameter foo -Mandatory
            Get-Command "Find-FirstRecurringCharacter" | Should -HaveParameter foo -Type 'char[]'         
        }
        It "ShouldMatchCorrectly" {
            Mock Write-Warning {}
            Find-FirstRecurringCharacter -foo 'abcdedcba' | Should -Be 'd'
            Find-FirstRecurringCharacter 'Thequickbrownfoxjumpsoverthelazydog' | Should -Be 'o'
            Find-FirstRecurringCharacter 'The quick brown fox jumps over the lazy dog' | Should -Be ' '
            Find-FirstRecurringCharacter 'abcdefghijklmnopqrstuvwxyz' | Should -Be $null
            Assert-MockCalled -CommandName Write-Warning -Times 1 -Exactly
        }
}