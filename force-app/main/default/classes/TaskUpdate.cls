public with sharing class TaskUpdate {
    public void createTasks(Account acct) {
        // from local repository
        // Field Label to Field Name Mapping
        // Assigned To = OwnerId
        // Related To = WhatId
        Task acctTask1 = new Task(Subject = 'Feature call', 
                                  Status = 'Not Started', 
                                  Priority = 'High', 
                                  ActivityDate = Date.today(),
                                  OwnerId = acct.OwnerId,
                                  WhatId = acct.Id);
        Task acctTask2 = new Task(Subject = 'Follow up 1', 
                                  Status = 'Not Started', 
                                  Priority = 'Normal', 
                                  ActivityDate = Date.today() + 7,
                                  OwnerId = acct.OwnerId,
                                  WhatId = acct.Id);
        Task acctTask3 = new Task(Subject = 'Follow up 2', 
                                  Status = 'Not Started', 
                                  Priority = 'Normal', 
                                  ActivityDate = Date.today() + 14,
                                  OwnerId = acct.OwnerId,
                                  WhatId = acct.Id);
        List<Task> listTask =new List<Task>{ acctTask1, acctTask2, acctTask3 };
        insert listTask;
    }
}
