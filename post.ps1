
param(
    # Add Resource ID below if you dont want to add multiple database at a time
    # $resourceID = "", 
    $diagName = "evhnsdiag1",
    # Add your log analytics workspace ID here at below
    $laws = "samplelaws",
    # add your eventhub rule ID here
    $eventRule = "/subscriptions/f3d20c9f-3cb5-45df-b6a8-32f7f4e3d1b6/resourceGroups/sample-1/providers/Microsoft.EventHub/namespaces/eventnamespaceankur/authorizationRules/RootManageSharedAccessKey",
    # Add event hub name here    
    $eventHubName = "myeventhubankur",
    [switch]$set
)

foreach ($resourceID in Get-Content .\file.txt) {
    az monitor diagnostic-settings create --resource $resourceID -n $diagName --workspace $laws --event-hub-rule $eventRule --event-hub $eventHubName --logs '[{""category"": ""PostgreSQLLogs"",""enabled"": true}]'    
}
