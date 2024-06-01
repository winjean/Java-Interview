mongo
use admin
db.auth("admin","YY5VV5")
use lsmsp-alarm

db.getCollection("alarm_record").count({"labels.source":"指标监控"})
db.getCollection("alarm_record").aggregate([{$match:{"labels.source":"日志管理"}},{$group:{_id:"$labels.instanceId",count:{$sum:1}}}]);
db.runCommand({distinct:"alarm_record","key":"labels.instanceId",query:{"labels.source":"日志管理"}})

db.getCollection('collection-name').update({'assetId':'F236834F606B4408872ECD1B7DBEE306','assetData.value':'1'},{$unset:{'assetData.$._class':'33'}},true,true);

sort：1-正序 -1-逆序
db.getCollection('collection-name').find({"key":{$lte:50}}).sort({KEY:1})