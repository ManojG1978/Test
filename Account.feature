Feature: Bank Account Management
	In order provide simple retail banking capabilities
	As a teller
	I want to be able to support operations on an account like deposit, withdraw etc.

@Sprint 1
Scenario: Creating a new bank account
	Given the customer has no account
	When I create a new account
	Then account should be marked active 
	And balance should be 0

@Sprint 1
Scenario: Deposit some amount on active account
	Given the customer has an active account
	And  Balance is 10
	When I deposit 10
	Then Balance should be 20

@Sprint 1
Scenario: Withdraw some amount on active account
	Given the customer has an active account
	And  Balance is 10
	When I withdraw 10
	Then balance should be 0

@Sprint 1
Scenario: Close an active account
	Given the customer has an active account
	And Balance is 10
	When I close the account
	Then account should be marked as closed

@Sprint 1
Scenario: Deposit not allowed on a closed account
	Given the customer has a closed account
	And Balance is 10
	When I deposit 10
	Then Balance is 10

@Sprint 1
Scenario: Withdraw not allowed on a closed account
	Given the customer has a closed account
	And Balance is 10
	When I withdraw 10
	Then Balance is 10

@Sprint 2
Scenario: Verify account holder before withdraw
	Given the customer has an active account
	And Balance is 10
	And holder is not verified
	When I withdraw 10
	Then Balance is 10

@Sprint 2
Scenario: Deposit does not require verification
	Given the customer has an active account
	And Balance is 10
	And holder is not verified
	When I deposit 10
	Then Balance is 20

@Sprint 2
Scenario: Allow account to be frozen
	Given the customer has an active account
	And  Balance is 10
	When I freeze the account
	Then account should marked frozen
	And Balance is 10

@Sprint 2
Scenario: Withdraw not allowed on frozen account
	Given the customer has a frozen account
	And Balance is 10
	When I withdraw 10
	Then Balance is 10

@Sprint 2
Scenario: Deposit on a frozen account should unfreeze account
	Given the customer has a frozen account
	And Balance is 10
	When I deposit 10
	Then account should be unfrozen
	And balance should be 20 
