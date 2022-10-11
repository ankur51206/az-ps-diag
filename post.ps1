param(
    # Add Resource ID below if you dont want to add multiple database at a time
    # $resourceID = "", 
    $diagNameEvent = "ankurdiagevent", 
    $diagNameLaws = "ankurdiaglaws",
    # Add your log analytics workspace ID here at below
    $laws = "samplelaws",
    # add your eventhub rule ID here
    $eventRule = "/subscriptions/f3d20c9f-3cb5-45df-b6a8-32f7f4e3d1b6/resourceGroups/sample-1/providers/Microsoft.EventHub/namespaces/eventnamespaceankur/authorizationRules/RootManageSharedAccessKey",
    # Add event hub name here    
    $eventHubName = "myeventhubankur",
    [switch]$set
)
              
$metrics = '[{\"category\":\"AllMetrics\",\"retentionPolicy\":{\"days\":0,\"enabled\":false},\"enabled\":true}]'
$logs = '[{\"category\":\"PostgreSQLLogs\",\"retentionPolicy\":{\"days\":0,\"enabled\":false},\"enabled\":true}]'
            
foreach ($resourceID in Get-Content .\file.txt) {
    az monitor diagnostic-settings create --resource $resourceID -n $diagNameEvent --event-hub-rule $eventRule --event-hub $eventHubName --logs $logs
    az monitor diagnostic-settings create --resource $resourceID -n $diagNameLaws --workspace $laws --metrics $metrics   
}
