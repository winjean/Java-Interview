db.getCollection('collection-name').update({'assetId':'F236834F606B4408872ECD1B7DBEE306','assetData.value':'1'},{$unset:{'assetData.$._class':'33'}},true,true);


sort：1-正序 -1-逆序
db.getCollection('collection-name').find({"key":{$lte:50}}).sort({KEY:1})