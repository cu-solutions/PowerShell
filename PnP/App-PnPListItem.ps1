
#Connect to PnPOnline
Connect-PnPOnline -Url https://***.sharepoint.com/sites/***/ -Interactive


#Get all ListItems
$ListItems = Get-PnPListItem -List $ListName -PageSize 1000 | Sort-Object ID -Descending


#Delete all Items in List
ForEach ($Item in $ListItems)
{
    Remove-PnPListItem -List $ListName -Identity $Item.Id -Force
} 



#Import CSV Data
$CustomerData = Import-CSV "C:\Temp\Mappe1.csv" -Delimiter ";"
$ListName = "myList"

foreach ($CSVRecord in $CustomerData){

    Add-PnPListItem -List "Anforderungen" -Values @{
        "ID"= $CSVRecord.'ID';
        "Title"= $Record.'Title'
        }


    #If the List includes LookUp-Columns
    ##############################################

    #$lookupListItems = Get-PnPListItem -List $ListName
    #$lookupItem = $lookupListItems | Where-Object {$_["itgs_ID"] -eq $Record.'G_ID'}

    #if ($lookupItem){
    #    Add-PnPListItem -List "Anforderungen" -Values @{
    #    "LookupID"= $lookupItem["ID"];
    #    "ID"= $CSVRecord.'ID';
    #    "Title"= $Record.'Title'
    #    }
    #}
    #else{
    #
    #  Write-Host "Error: No correct Lookup-Value Found!"
    #}
}