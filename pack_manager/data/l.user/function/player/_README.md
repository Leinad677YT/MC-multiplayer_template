# Info about the calls

> [!WARNING]
> **DO NOT** modify `leinad_temp:player playerdata` 
> while on the function calls unless you restore it afterwards on the same tag

> [!NOTE]
> **YOU** are the one in charge of the database status,
> remember to set their starting data correctly before loading

## Load
- Position data and spawn data **MUST** be already on their playerdata if you use the inventory module
- Data on the database must be valid
## Save
- All data that can't be toggled on/off **MUST** be present
## Set to default
- Data must be correctly placed on the database 
## Import
> [!WARNING]
> This merges **ALL** current data with the import data, be aware
## Save import
> [!NOTE]
> This will overwrite the import data