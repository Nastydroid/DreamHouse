public with sharing class HouseService {
    @AuraEnabled(cacheable=true)
    public static List <House__C> getRecords(){
        try{
            //create a list of house records from SOQL query
            List<House__C> lstHouse = [
                SELECT
                Id,
                Name,
                Address__c,
                State__c,
                City__c,
                Zip__c
                FROM House__c
                WITH USER_MODE
                ORDER BY CreatedDate
                LIMIT 10
            ];
            return lstHouse;
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());

        }

    }
}